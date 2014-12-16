#!/bin/sh

echo "running start-nominatim.sh"

# Generate your own credentials file by copying from .config.sh.template
if [ ! -e /app/config.sh ]; then
    echo "#\tThe config file, /app/config.sh, does not exist - copy your own based on the config.sh.template file." 1>&2
    exit 1
fi
# Load the credentials
chmod +x /app/config.sh
. /app/config.sh

# Re-attuning the mounted postgres cluster permissions so its compatible to the users on this system
usermod -u ${originaluid} postgres
groupmod -g ${originalgid} postgres
chown -R postgres:postgres /var/run/postgresql
chown -R postgres:postgres /etc/postgresql/9.3

# Tuning PostgreSQL
/app/configPostgresql.sh ${postgresconfigmode} n ${override_maintenance_work_mem}
# recreate the postgres functions to use the nominatim of the docker
sudo -u postgres -- /app/nominatim/utils/setup.php --create-functions --enable-diff-updates
# Restart postgres assume the new config
service postgresql restart

# This is the data part. Need to attach EBS with all data imported and indexed
# Otherwise, would get Get Wikipedia data which helps with name importance hinting here
# Would get OSM data here

# Set up the website for use with Apache
sudo -u nominatim cat > /app/nominatim/settings/local.php << EOF
<?php
    // Paths
    @define('CONST_Postgresql_Version', '9.3');
    @define('CONST_Postgis_Version', '2.1');
    // Website settings
    @define('CONST_Website_BaseURL', 'http://${websiteurl}/nominatim/');
    // latest osmosis
    @define('CONST_Osmosis_Binary', '/usr/bin/osmosis');
    // Update process
    // @define('CONST_Replication_Url', '${updateurl}');
    // @define('CONST_Replication_MaxInterval', '86400');     // Process each update separately, osmosis cannot merge multiple updates
    // @define('CONST_Replication_Update_Interval', '86400');  // How often upstream publishes diffs
    // @define('CONST_Replication_Recheck_Interval', '900');   // How long to sleep if no update found yet
EOF

# Would import and index main OSM data here
# Would add special phrases here

mkdir -pm 755 /var/www/nominatim
chown nominatim /var/www/nominatim
sudo -u nominatim ./utils/setup.php --create-website /var/www/nominatim

# Write out a robots file to keep search engines out
sudo -u nominatim cat > /var/www/nominatim/robots.txt << EOF
    User-agent: *
    Disallow: /
EOF

# Create a VirtualHost for Apache
cat > /etc/apache2/sites-available/000-default.conf << EOF
<VirtualHost *:80>
        ServerAdmin ${emailcontact}
        DocumentRoot /var/www
        CustomLog \${APACHE_LOG_DIR}/access.log combined
        ErrorLog \${APACHE_LOG_DIR}/error.log
        LogLevel info
        <Directory /var/www/nominatim>
                Options FollowSymLinks MultiViews
                AllowOverride None
                Order allow,deny
                Allow from all
        </Directory>
        AddType text/html .php
</VirtualHost>
EOF

# Enable the VirtualHost and restart Apache
# a2ensite /etc/apache2/sites-available/400-nominatim.conf
service apache2 restart

# Would set up the update process here
# Would enable hierarchical updates here

# Adust PostgreSQL to do disk writes
/app/configPostgresqlDiskWrites.sh

# Reload postgres assume the new config
service postgresql restart

# Would run the Updating Nominatim here. 

bash

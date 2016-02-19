#!/bin/sh


if [ -f /deployment/init.sh ];
then
	echo "Running custom init script"
	chmod +x /deployment/init.sh
	/deployment/init.sh
fi

cat <<EOF > ~/.aws/config
[default]
output = json
region = us-east-1
EOF

aws s3 cp s3://${S3_PATH} /deployment/${LOCAL_PATH}
aws s3 cp s3://maluuba-content/movie-update-scripts/updateMovies.sh /opt/updater/updateMovies.sh
aws s3 cp s3://maluuba-content/movie-update-scripts/updateRatings.sh /opt/updater/updateRatings.sh
chmod -R 777 /opt/updater
(crontab -l 2>/dev/null; echo "*/15 * * * * /opt/updater/updateMovies.sh"; echo "0 9 * * * /opt/updater/updateRatings.sh"; echo "")| crontab -

cron
bash

#!/bin/sh

if [ -z "$ACCESS_KEY" ] || [ -z "$SECRET_KEY" ] || [ -z "$S3PATH" ] || [ -z "$LIMIT" ]; then
	echo "Missing Required Variable:"
	echo "ACCESS_KEY: ${ACCESS_KEY}"
	echo "SECRET_KEY: ${SECRET_KEY}"
	echo "S3PATH: ${S3PATH}"
	echo "LIMIT: ${LIMIT}"
	exit 1
fi

S3PATH=`echo "${S3PATH}/" | sed 's#/*/#/#g'`

sed -i s#ACCESS_KEY#${ACCESS_KEY}#g .s3cfg
sed -i s#SECRET_KEY#${SECRET_KEY}#g .s3cfg

if [ ! -d /backup ]; then  
	mkdir /backup/

fi

DATE=`date +%Y-%m-%d:%H:%M:%S`

tar -zvcf /backup/backup-${DATE}.tar.gz /source
s3cmd put /backup/backup-${DATE}.tar.gz s3://${S3PATH}

# Delete old backups
count=1

s3cmd ls s3://$S3PATH | cut -d ' ' -f 12 | sort -r | while read line; do
		if [ "$count" -gt "$LIMIT" ]; then
			s3cmd del ${line}
		fi
		count=`expr $count + 1`		
done

echo "Backups done"

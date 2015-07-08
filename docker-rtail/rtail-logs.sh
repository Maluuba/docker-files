#!/bin/sh

# TODO replace watch with inotifywait for more elegant partial updates
# ex. inotifywait -mr -e moved_to -e moved_from -e create -e delete -e delete_self -e unmount --format "%e %w %f" .

# TODO have a pattern provided by an ENV instead of looking for tomcat & jetty type logs

while true; do
	pkill tail
	find * -type f -iregex '.*catalina\.out\|.*'`date +"%Y_%m_%d"`'.*\.log' -exec sh -c "tail -F {} | rtail --id {} -h 'rtail-server' &" \;
	watch -t -n 60 -g "find * -type f -iregex '.*catalina\.out\|.*\.log'"
done

#Run bash to keep container running and provide interactive mode
bash

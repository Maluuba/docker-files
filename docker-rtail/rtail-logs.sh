#!/bin/sh

# TODO replace watch with inotifywait for more elegant partial updates
# ex. inotifywait -mr -e moved_to -e moved_from -e create -e delete -e delete_self -e unmount --format "%e %w %f" .

while true; do
    pkill tail
    var_files=`eval echo "${FILES_IREGEX}"`
    var_watch=`eval echo "${WATCH_IREGEX}"`
    find * -type f -iregex "${var_files}" -exec sh -c "tail -F -n100 {} | rtail --id {} -h 'rtail-server' &" \;
    watch -t -n 60 -g "find * -type f -iregex '${var_watch}'"
done

#Run bash to keep container running and provide interactive mode
bash

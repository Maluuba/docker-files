usage(){
	echo "Usage: $0 ACCESS_KEY SECRET_KEY SOURCE_DIR S3PATH LIMIT"
	exit 1
}
 
# invoke  usage
# call usage() function if filename not supplied
[[ $# -eq 0 ]] && usage

docker run -e ACCESS_KEY="${1}" -e SECRET_KEY="${2}" \
-e S3PATH="${4}" -e LIMIT="${5}" -v ${3}:/source  -t -i maluuba/s3backup


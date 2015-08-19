usage(){
	echo "Usage: $0 ACCESS_KEY SECRET_KEY SOURCE_DIR S3PATH LIMIT [TAR_PARAMETERS]"
	exit 1
}
 
# invoke  usage
# call usage() function if filename not supplied
[[ $# -lt 5 ]] && usage

docker run -e ACCESS_KEY="${1}" -e SECRET_KEY="${2}" \
-e S3PATH="${4}" -e LIMIT="${5}" -e TAR_PARAMS="${6}" -v ${3}:/source  -t -i maluuba/s3backup


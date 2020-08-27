FIRST_ARGUMENT=$1
SECOND_ARGUMENT=$2
LINE=''
NAME=''
VALUE=''

replaceEnvVars() {
  find $SECOND_ARGUMENT -type f \( -name "*.js" -o -name "*.js.map" \) -exec sed -i -e "s/process.env.${NAME}/'${VALUE}'/g" {} \;
}

search() {
  IFS='='
  read -ra ADDR <<<"$LINE"
  NAME=${ADDR[0]}
  VALUE=${ADDR[1]}
  if [[ ! -z $NAME && ! -z $VALUE ]]; then
    SEARCH_CHARACTER="/"
    REPLACE_CHARACTER="\/"
    VALUE="${VALUE//$SEARCH_CHARACTER/$REPLACE_CHARACTER}"
    replaceEnvVars
  fi
}

echo .env.$FIRST_ARGUMENT | xargs cat | while read line; do LINE=$line && search; done

#!/bin/bash
set -x

readonly URL="https://api.github.com/search/issues"

usage() {
  cat <<EOS >&2
Usage: $0 -u <user> -s YYYY-MM-DD -e YYYY-MM-DD
  -u: your github user name
  -s: start date to get your contribution
  -e: end date to get your contribution
EOS
  exit 1
}

parse_args() {
  while getopts "u:s:e:" OPT; do
    case $OPT in
      u) AUTHOR="$OPTARG" ;;
      s) START="$OPTARG" ;;
      e) END="$OPTARG" ;;
      :) echo  "[ERROR] Option argument is undefined.";;
      \?) echo "[ERROR] Undefined options.";;
    esac
  done

  shift $((OPTIND - 1))
}

main() {
  source ./token.sh
  if [[ $TOKEN != "" ]]; then
    AUTH="Authorization: token ${TOKEN}"
  fi

  JSON=`curl -sS -H "$AUTH" "${URL}?q=type:pr+in:body+is:merged+merged:${TERMS}+author:${AUTHOR}&per_page=100"`
  NUM=`echo $JSON | jq ".items[].title" | wc -l`
  PR=`echo $JSON | jq -c '.items[] | {title,html_url} | .html_url |= . + "\n" ' \
                 | jq -c 'sort_by(.html_url) | .[]' --slurp \
                 | jq -r .[]`

  echo "Hi ${AUTHOR}, this is your contribution report :tada: in $TERMS"
  echo "# Pull Request"
  echo "your created and merged pull request is ${NUM}!!"
  echo -n "$PR"
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  parse_args "$@"
  main
fi

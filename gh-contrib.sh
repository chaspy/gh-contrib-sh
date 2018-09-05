#!/bin/bash
AUTHOR="chaspy"
#TOKEN=<YOUR GITHUB TOKEN>
TERMS="2018-06-21..2018-07-21"

JSON=`curl -sS -H "Authorization: token ${TOKEN}" "https://api.github.com/search/issues?q=type:pr+in:body+is:merged+merged:${TERMS}+author:${AUTHOR}&per_page=100"`
NUM=`echo $JSON | jq ".items[].title" | wc -l`
PR=`echo $JSON | jq -c '.items[] | {title,html_url} | .html_url |= . + "\n" ' \
               | jq -c 'sort_by(.html_url) | .[]' --slurp \
               | jq -r .[]`

echo "Hi ${AUTHOR}, this is your contribution report :tada: in $TERMS"
echo "# Pull Request"
echo "your created and merged pull request is ${NUM}!!"
echo -n "$PR"
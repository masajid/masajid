#!/bin/bash

result=0

cd "$( dirname "${BASH_SOURCE[0]}" )"

for rubocop_script in $(find . -name rubocop.sh); do
  pushd `dirname $rubocop_script` > /dev/null
  ./rubocop.sh
  result+=$?
  popd > /dev/null
done

if [ $result -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
fi

exit $result

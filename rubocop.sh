#!/bin/bash

result=0

cd "$( dirname "${BASH_SOURCE[0]}" )"

for gemfile in $(find . -name Gemfile); do
  pushd `dirname $gemfile` > /dev/null
  bundle exec rubocop
  result+=$?
  popd > /dev/null
done

if [ $result -eq 0 ]; then
  echo "SUCCESS"
else
  echo "FAILURE"
fi

exit $result

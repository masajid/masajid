#!/bin/bash

exit_code=0

echo "*** Running main app rubocop"
bundle install | grep installing
bundle exec rubocop
exit_code+=$?

exit $exit_code

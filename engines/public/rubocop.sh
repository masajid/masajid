#!/bin/bash

exit_code=0

echo "*** Running public engine rubocop"
bundle install | grep installing
bundle exec rubocop
exit_code+=$?

exit $exit_code

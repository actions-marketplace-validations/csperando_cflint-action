#!/bin/sh -l

# echo "::group::cd to target"
# echo "There has to be a better way to deal with these directories..."
# cd ..
# cd ..
# cd target
# ls
# echo "::endgroup::"

echo "::group::linting directory: $1"
java -jar ../../target/CFLint-1.5.0-all.jar -folder "$1"
echo "::endgroup::"

echo "::group::get output"
results=`cat cflint-result.html`
echo $results
echo "::set-output name=results::$results"
echo "::endgroup::"

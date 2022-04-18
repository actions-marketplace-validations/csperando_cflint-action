#!/bin/sh -l

echo "::group::linting directory: $1"
echo java -jar /target/CFLint-1.5.0-all.jar -q -folder "$1"
java -jar /target/CFLint-1.5.0-all.jar -q -folder "$1"
echo "::endgroup::"

# echo "::group::format results"
# echo results=`cat cflint-result.html`
# results=`cat cflint-result.html`
# results="${results//$'\n'/' '}"
# echo "::set-output name=results::$results"
# echo "::endgroup::"

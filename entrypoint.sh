#!/bin/sh -l

echo "::group::linting directory: $1"
ls
# java -jar ../../target/CFLint-1.5.0-all.jar -help
echo "::endgroup::"

# echo "::group::format output"
# results=`cat cflint-result.html`
# results="${results//$'\n'/''}"
# results="${results//$'\r'/''}"
# echo "::set-output name=results::$results"
# echo "::endgroup::"

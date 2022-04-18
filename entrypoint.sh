#!/bin/sh -l

echo "::group::linting directory: $1"

java -jar /target/CFLint-1.5.0-all.jar -folder "$1"

ls
cd /target
ls

results=`cat /target/cflint-result.html`
results="${results//$'\n'/''}"
results="${results//$'\r'/''}"

echo "::set-output name=results::$results"

echo "::endgroup::"

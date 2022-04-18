#!/bin/sh -l

# get diff from codebase ...

echo "::group::linting directory: $1"
echo java -jar /target/CFLint-1.5.0-all.jar -q -folder "$1"
java -jar /target/CFLint-1.5.0-all.jar -q -folder "$1"
echo "::endgroup::"

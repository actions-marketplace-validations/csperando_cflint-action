#!/bin/sh -l

echo "::group::cd to target"
echo "There has to be a better way to deal with these directories..."
cd ..
cd ..
cd target
ls
echo "::endgroup::"

echo $0
echo $1
echo $2

echo "::group::linting directory: $0"
java -jar CFLint-1.5.0-all.jar -folder "$0"
echo "::endgroup::"

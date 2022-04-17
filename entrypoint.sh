#!/bin/sh -l

echo "There has to be a better way to deal with these directories..."
cd ..
cd ..
cd target

echo "linting directory: $1"
java -jar CFLint-1.5.0-all.jar -folder "$1"

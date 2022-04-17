#!/bin/sh -l

echo "There has to be a better way to deal with these directories..."
cd ..
cd ..
cd target

java -jar CFLint-1.5.0-all.jar -folder "::$folder-to-lint"

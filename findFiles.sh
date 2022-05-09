#!/usr/bin/env bash

#this finds all of the files with a .ts extension and runs it through the java file

echo "Finding all .ts extension files to change"
echo "Please wait for this script to finish"

find . -type f -name '*.ts' -exec java AddLine {} \;
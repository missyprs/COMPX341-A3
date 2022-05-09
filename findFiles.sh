#!/usr/bin/env bash

#this finds all of the files with a .ts extension and runs it through the java file

echo "finding things"

find . -type f -name '*.ts' -exec java AddLine {} \;
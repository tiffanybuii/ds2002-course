#!/bin/bash

set -e

#if [ -z "$1" ]; then
#	echo "This script converts a TSV into a CSV";
#	echo "Append the input file name and then the output file name";
#fi

/usr/bin/tr '\t' ',' < $1 > $2

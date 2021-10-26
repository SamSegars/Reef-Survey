#!/bin/bash

#Convert data to CSV file

#Convert CSV file to SQL Insert statement that corresponds to schema

echo "Enter file path."
read file
sed 's/ \+/,/g' ""${file}"" > ofile.csv

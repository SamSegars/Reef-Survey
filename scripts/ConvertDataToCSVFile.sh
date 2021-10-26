#!/bin/bash

#Convert data to CSV file

#Convert CSV file to SQL Insert statement that corresponds to schema

echo "Enter file path (minus the format for text file)."
read {file}.txt
sed 's/ \+/,/g' ""${file}.txt"" > ""{$file}"".csv

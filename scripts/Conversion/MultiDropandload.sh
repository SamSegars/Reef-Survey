#!/bin/bash
read -p "Whats the password?" passwrd
echo 'drop database `reef-survey`;' | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat QuickDBD-export.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat required_users.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
./ConvertMultipleCsvtoSql.sh
./MultiCSVLoader.sh

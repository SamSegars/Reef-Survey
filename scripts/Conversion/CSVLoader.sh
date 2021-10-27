#!/bin/bash
read -p "Password for server?" passwrd
cat locations.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat fishs.sql |mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat surveys.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat fishinfo.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd

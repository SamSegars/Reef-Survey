#!/bin/bash
read -p "Password for server?" passwrd
cat mlocations.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat mfishs.sql |mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat msurveys.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd
cat fishinfo.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -p$passwrd

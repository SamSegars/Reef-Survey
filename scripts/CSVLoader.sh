#!/bin/bash
cat Fish.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -ppassword
cat konbert-export-3f88d9987b3b4.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -ppassword

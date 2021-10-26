#!/bin/bash
cat QuickDBD-export.sql | mysql -u admin -h mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com -P 3306 -ppassword

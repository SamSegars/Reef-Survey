#!/bin/bash -x
whereami="$(pwd)"

scp -v $whereami/QuickDBD-export.sql mysql.ciazfzbygfyt.us-east-1.rds.amazonaws.com

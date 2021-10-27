#!/usr/bin/bash


CREATE USER 'samuelsegars'@'%'
  IDENTIFIED BY 'new_password'
CREATE USER 'garrypeffer'@'%'
  IDENTIFIED BY 'new_password'
CREATE USER 'leonardobenitez'@'%'
  IDENTIFIED BY 'new_password'
CREATE USER 'lillianmead'@'localhost'
  IDENTIFIED BY 'new_password'

GRANT ALL ON reef-survey.* TO 'samuelsegars,garrypeffer,leonardobenitez,lillianmead@'%'

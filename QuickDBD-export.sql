-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE DATABASE if not exists `reef-survey`;
use `reef-survey`;
CREATE TABLE if not exists `Fish` (
    `FishID` int  unsigned NOT NULL auto_increment ,
    `Family`  tinytext NOT NULL ,
    `ScientificName` tinytext  NOT NULL ,
    `CommonName` tinytext  NOT NULL ,
    `Trophic` Char(2)  NOT NULL ,
    PRIMARY KEY (
        `FishID`
    )
);

CREATE TABLE if not exists `FishInfo` (
    `FishID` int  unsigned NOT NULL ,
    `LocationID` int  unsigned NOT NULL ,
    `SurveyIndex` int  NOT NULL ,
    `Count` int  NOT NULL ,
    `Length` int  NOT NULL
);

CREATE TABLE if not exists `Survey` (
    `BatchCode` char(16)  NOT NULL ,
    `SurveyIndex` int  NOT NULL ,
    `SurveyDate` date  NOT NULL ,
    `StructureType` Char(4)  NOT NULL ,
    PRIMARY KEY (
        `SurveyIndex`
    )
);

CREATE TABLE if not exists `Location` (
    `LocationID` int  unsigned NOT NULL auto_increment,
    `Region` tinytext  NOT NULL ,
    `SubRegion` tinytext  NOT NULL ,
    `StudyArea` tinytext  NOT NULL ,
    `Latitude` double(10,5)  NOT NULL ,
    `Longitude` double(10,5)  NOT NULL ,
    `Management` tinytext  NOT NULL ,
    PRIMARY KEY (
        `LocationID`
    )
);

ALTER TABLE `FishInfo` ADD CONSTRAINT `fk_FishInfo_FishID` FOREIGN KEY(`FishID`)
REFERENCES `Fish` (`FishID`);

ALTER TABLE `FishInfo` ADD CONSTRAINT `fk_FishInfo_LocationID` FOREIGN KEY(`LocationID`)
REFERENCES `Location` (`LocationID`);

ALTER TABLE `FishInfo` ADD CONSTRAINT `fk_FishInfo_SurveyIndex` FOREIGN KEY(`SurveyIndex`)
REFERENCES `Survey` (`SurveyIndex`);

#### CREATE USERS AND PRIVLEGES ####

CREATE USER 'root'@'%' IDENTIFIED BY 'user_password';
GRANT ALL PRIVILEGES ON database_name.* TO 'root'@'localhost';
CREATE USER 'samuelsegars'@'%' IDENTIFIED BY 'user_password';
GRANT ALL PRIVILEGES ON database_name.* TO 'samuelsegars'@'localhost';
CREATE USER 'garrypeffer'@'%' IDENTIFIED BY 'user_password';
GRANT ALL PRIVILEGES ON database_name.* TO 'garrypeffer'@'localhost';
CREATE USER 'leonardobenitez'@'%' IDENTIFIED BY 'user_password';
GRANT ALL PRIVILEGES ON database_name.* TO 'leonardobenitez'@'localhost';

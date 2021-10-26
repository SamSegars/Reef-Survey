-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE DATABASE if not exists `reef-survey`;
use `reef-survey`;
CREATE TABLE if not exists `fish` (
    `FishID` int  unsigned NOT NULL auto_increment ,
    `Family`  tinytext NOT NULL ,
    `ScientificName` tinytext  NOT NULL ,
    `CommonName` tinytext  NOT NULL ,
    `Trophic` Char(2)  NOT NULL ,
    PRIMARY KEY (
        `FishID`
    )
);

CREATE TABLE if not exists `fishinfo` (
    `FishID` int  unsigned NOT NULL ,
    `LocationID` int  unsigned NOT NULL ,
    `SurveyIndex` int  NOT NULL ,
    `Count` int  NOT NULL ,
    `Length` int  NOT NULL
);

CREATE TABLE if not exists `survey` (
    `BatchCode` char(16)  NOT NULL ,
    `SurveyIndex` int  NOT NULL ,
    `SurveyDate` date  NOT NULL ,
    `StructureType` Char(4)  NOT NULL ,
    PRIMARY KEY (
        `SurveyIndex`
    )
);

CREATE TABLE if not exists `location` (
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

ALTER TABLE `fishinfo` ADD CONSTRAINT `fk_fishinfo_FishID` FOREIGN KEY(`FishID`)
REFERENCES `fish` (`FishID`);

ALTER TABLE `fishinfo` ADD CONSTRAINT `fk_fishinfo_LocationID` FOREIGN KEY(`LocationID`)
REFERENCES `location` (`LocationID`);

ALTER TABLE `fishinfo` ADD CONSTRAINT `fk_fishinfo_SurveyIndex` FOREIGN KEY(`SurveyIndex`)
REFERENCES `survey` (`SurveyIndex`);

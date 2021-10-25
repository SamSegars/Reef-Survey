-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).
CREATE DATABASE `reef-survey`
CREATE TABLE `Fish` (
    `FishID` int  NOT NULL ,
    `Family` string  NOT NULL ,
    `ScientificName` string  NOT NULL ,
    `CommonName` string  NOT NULL ,
    `Trophic` Char(2)  NOT NULL ,
    PRIMARY KEY (
        `FishID`
    )
);

CREATE TABLE `FishInfo` (
    `FishID` int  NOT NULL ,
    `LocationID` int  NOT NULL ,
    `SurveyIndex` int  NOT NULL ,
    `Count` int  NOT NULL ,
    `Length` int  NOT NULL
);

CREATE TABLE `Survey` (
    `BatchCode` char(16)  NOT NULL ,
    `SurveyIndex` int  NOT NULL ,
    `SurveyDate` date  NOT NULL ,
    `StructureType` Char(4)  NOT NULL ,
    PRIMARY KEY (
        `SurveyIndex`
    )
);

CREATE TABLE `Location` (
    `LocationID` int  NOT NULL ,
    `Region` string  NOT NULL ,
    `SubRegion` string  NOT NULL ,
    `StudyArea` string  NOT NULL ,
    `Latitude` string  NOT NULL ,
    `Longitude` string  NOT NULL ,
    `Management` string  NOT NULL ,
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

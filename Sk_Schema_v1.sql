-- ****************** SqlDBM: MySQL ******************;
-- ***************************************************;

-- ************************************** `skillType`
use sk_dev;
CREATE TABLE `skillType`
(
 `skillTypeID`   int NOT NULL AUTO_INCREMENT,
 `skillTypeName` varchar(45) NOT NULL ,

PRIMARY KEY (`skillTypeID`)
);






-- ************************************** `roleType`

CREATE TABLE `roleType`
(
 `roleTypeID`   int NOT NULL AUTO_INCREMENT,
 `roleTypeName` varchar(45) NOT NULL ,

PRIMARY KEY (`roleTypeID`)
);






-- ************************************** `industry`

CREATE TABLE `industry`
(
 `industryID`          int NOT NULL AUTO_INCREMENT,
 `industryName`        varchar(45) NOT NULL ,
 `industryDescription` varchar(100) NULL ,

PRIMARY KEY (`industryID`)
);






-- ************************************** `candidate`

CREATE TABLE `candidate`
(
 `candidateID`    int NOT NULL AUTO_INCREMENT,
 `firstName`      varchar(45) NOT NULL ,
 `lastName`       varchar(45) NOT NULL ,
 `email`          varchar(45) NOT NULL ,
 `contactNumber`  varchar(45) NOT NULL ,
 `password`       varchar(45) NOT NULL ,
 `linkdinUrl`     varchar(45) NOT NULL ,
 `image`          varchar(45) NOT NULL ,
 `remote`         tinyint(1) NOT NULL ,
 `educationLevel` varchar(45) NOT NULL ,
 `visaStatus`     varchar(45) NOT NULL ,

PRIMARY KEY (`candidateID`)
);






-- ************************************** `skill`

CREATE TABLE `skill`
(
 `skillID`          int NOT NULL AUTO_INCREMENT,
 `skillName`        varchar(45) NOT NULL ,
 `skillDescription` varchar(45) NULL ,
 `skillTypeID`      int NOT NULL ,

PRIMARY KEY (`skillID`),
KEY `fkIdx_27` (`skillTypeID`),
CONSTRAINT `FK_27` FOREIGN KEY `fkIdx_27` (`skillTypeID`) REFERENCES `skillType` (`skillTypeID`)
);






-- ************************************** `role`

CREATE TABLE `role`
(
 `roleID`          int NOT NULL AUTO_INCREMENT,
 `roleName`        varchar(45) NOT NULL ,
 `roleDescription` varchar(100) NULL ,
 `roleTypeID`      int NOT NULL ,

PRIMARY KEY (`roleID`),
KEY `fkIdx_34` (`roleTypeID`),
CONSTRAINT `FK_34` FOREIGN KEY `fkIdx_34` (`roleTypeID`) REFERENCES `roleType` (`roleTypeID`)
);






-- ************************************** `organization`

CREATE TABLE `organization`
(
 `orgID`      int NOT NULL AUTO_INCREMENT,
 `orgName`    varchar(45) NOT NULL ,
 `industryID` int NOT NULL ,

PRIMARY KEY (`orgID`),
KEY `fkIdx_148` (`industryID`),
CONSTRAINT `FK_148` FOREIGN KEY `fkIdx_148` (`industryID`) REFERENCES `industry` (`industryID`)
);






-- ************************************** `candidate_industry`

CREATE TABLE `candidate_industry`
(
 `candidateIndustryID` int NOT NULL AUTO_INCREMENT,
 `candidateID`         int NOT NULL ,
 `industryID`          int NOT NULL ,
 `yearsOfWorkExp`      float NOT NULL ,

PRIMARY KEY (`candidateIndustryID`),
KEY `fkIdx_177` (`candidateID`),
CONSTRAINT `FK_177` FOREIGN KEY `fkIdx_177` (`candidateID`) REFERENCES `candidate` (`candidateID`),
KEY `fkIdx_180` (`industryID`),
CONSTRAINT `FK_180` FOREIGN KEY `fkIdx_180` (`industryID`) REFERENCES `industry` (`industryID`)
);






-- ************************************** `role_skill`

CREATE TABLE `role_skill`
(
 `roleSkillID` int NOT NULL AUTO_INCREMENT,
 `roleID`      int NOT NULL ,
 `skillID`     int NOT NULL ,

PRIMARY KEY (`roleSkillID`),
KEY `fkIdx_46` (`roleID`),
CONSTRAINT `FK_46` FOREIGN KEY `fkIdx_46` (`roleID`) REFERENCES `role` (`roleID`),
KEY `fkIdx_49` (`skillID`),
CONSTRAINT `FK_49` FOREIGN KEY `fkIdx_49` (`skillID`) REFERENCES `skill` (`skillID`)
);






-- ************************************** `role_industry`

CREATE TABLE `role_industry`
(
 `roleIndustryID` int NOT NULL AUTO_INCREMENT,
 `industryID`     int NOT NULL ,
 `roleID`         int NOT NULL ,

PRIMARY KEY (`roleIndustryID`),
KEY `fkIdx_55` (`industryID`),
CONSTRAINT `FK_55` FOREIGN KEY `fkIdx_55` (`industryID`) REFERENCES `industry` (`industryID`),
KEY `fkIdx_58` (`roleID`),
CONSTRAINT `FK_58` FOREIGN KEY `fkIdx_58` (`roleID`) REFERENCES `role` (`roleID`)
);






-- ************************************** `recruiter`

CREATE TABLE `recruiter`
(
 `recruiterID`        int NOT NULL AUTO_INCREMENT,
 `firstName`          varchar(45) NOT NULL ,
 `lastName`           varchar(45) NOT NULL ,
 `orgEmail`           varchar(45) NOT NULL ,
 `contactNumber`      varchar(45) NOT NULL ,
 `password`           varchar(45) NOT NULL ,
 `linkdinUrl`         varchar(45) NOT NULL ,
 `image`              varchar(45) NOT NULL ,
 `rating`             enum('1','2','3','4') NOT NULL ,
 `executiveRecruiter` tinyint(1) NOT NULL ,

PRIMARY KEY (`recruiterID`)
);


CREATE TABLE `recruiter_org`
(
 `recruiterOrgID`        int NOT NULL AUTO_INCREMENT,
 `recruiterID`          int NOT NULL ,
 `orgID`           int NOT NULL ,

PRIMARY KEY (`recruiterOrgID`),
KEY `orgIdx_151` (`orgID`),
CONSTRAINT `recFK_151` FOREIGN KEY `recfkIdx_151` (`orgID`) REFERENCES `organization` (`orgID`),
KEY `recIdx_151` (`recruiterID`),
CONSTRAINT `FK_511` FOREIGN KEY `fkIdx_511` (`recruiterID`) REFERENCES `recruiter` (`recruiterID`)
);




-- ************************************** `candidate_skill`

CREATE TABLE `candidate_skill`
(
 `candidateSkill` int NOT NULL AUTO_INCREMENT,
 `skillID`        int NOT NULL ,
 `candidateID`    int NOT NULL ,
 `yearsOfWorkExp` float NOT NULL ,
 `skillLevel`     int NOT NULL ,

PRIMARY KEY (`candidateSkill`),
KEY `fkIdx_114` (`skillID`),
CONSTRAINT `FK_114` FOREIGN KEY `fkIdx_114` (`skillID`) REFERENCES `skill` (`skillID`),
KEY `fkIdx_117` (`candidateID`),
CONSTRAINT `FK_117` FOREIGN KEY `fkIdx_117` (`candidateID`) REFERENCES `candidate` (`candidateID`)
);






-- ************************************** `candidate_organization`

CREATE TABLE `candidate_organization`
(
 `candidateOrgID` int NOT NULL AUTO_INCREMENT,
 `candidateID`    int NOT NULL ,
 `orgID`          int NOT NULL ,
 `yearsInvolved`  float NOT NULL ,

PRIMARY KEY (`candidateOrgID`),
KEY `fkIdx_187` (`candidateID`),
CONSTRAINT `FK_187` FOREIGN KEY `fkIdx_187` (`candidateID`) REFERENCES `candidate` (`candidateID`),
KEY `fkIdx_190` (`orgID`),
CONSTRAINT `FK_190` FOREIGN KEY `fkIdx_190` (`orgID`) REFERENCES `organization` (`orgID`)
);






-- ************************************** `recruiter_skill`

CREATE TABLE `recruiter_skill`
(
 `recruiterSkillID` int NOT NULL AUTO_INCREMENT,
 `recruiterID`      int NOT NULL ,
 `skillID`          int NOT NULL ,

PRIMARY KEY (`recruiterSkillID`),
KEY `fkIdx_123` (`recruiterID`),
CONSTRAINT `FK_123` FOREIGN KEY `fkIdx_123` (`recruiterID`) REFERENCES `recruiter` (`recruiterID`),
KEY `fkIdx_126` (`skillID`),
CONSTRAINT `FK_126` FOREIGN KEY `fkIdx_126` (`skillID`) REFERENCES `skill` (`skillID`)
);






-- ************************************** `jobListing`

CREATE TABLE `jobListing`
(
 `jobListingID`     int NOT NULL AUTO_INCREMENT,
 `roleID`           int NOT NULL ,
 `recruiterID`      int NOT NULL ,
 `listingStatus`    enum('active','interviewing','filled','closed') NOT NULL ,
 `listingDate`      datetime NOT NULL ,
 `visaStatus`       varchar(45) NOT NULL ,
 `industryID`       int NOT NULL ,
 `lastUpdateStatus` datetime NOT NULL ,
 `orgID`            int NOT NULL ,
 `remotePosition`   tinyint(1) NOT NULL ,
 `jobZipCode`       int(5) NOT NULL ,

PRIMARY KEY (`jobListingID`),
KEY `fkIdx_100` (`recruiterID`),
CONSTRAINT `FK_100` FOREIGN KEY `fkIdx_100` (`recruiterID`) REFERENCES `recruiter` (`recruiterID`),
KEY `fkIdx_143` (`industryID`),
CONSTRAINT `FK_143` FOREIGN KEY `fkIdx_143` (`industryID`) REFERENCES `industry` (`industryID`),
KEY `fkIdx_154` (`orgID`),
CONSTRAINT `FK_154` FOREIGN KEY `fkIdx_154` (`orgID`) REFERENCES `organization` (`orgID`),
KEY `fkIdx_64` (`roleID`),
CONSTRAINT `FK_64` FOREIGN KEY `fkIdx_64` (`roleID`) REFERENCES `role` (`roleID`)
);






-- ************************************** `jobRequiredSkills`

CREATE TABLE `jobRequiredSkills`
(
 `jobRequiredSkillID` int NOT NULL AUTO_INCREMENT,
 `skillID`            int NOT NULL ,
 `jobListingID`       int NOT NULL ,

PRIMARY KEY (`jobRequiredSkillID`),
KEY `fkIdx_105` (`jobListingID`),
CONSTRAINT `FK_105` FOREIGN KEY `fkIdx_105` (`jobListingID`) REFERENCES `jobListing` (`jobListingID`),
KEY `fkIdx_82` (`skillID`),
CONSTRAINT `FK_82` FOREIGN KEY `fkIdx_82` (`skillID`) REFERENCES `skill` (`skillID`)
);






-- ************************************** `jobListing_candidate`

CREATE TABLE `jobListing_candidate`
(
 `jobListingCandidateID` int NOT NULL AUTO_INCREMENT,
 `candidateID`           int NOT NULL ,
 `jobListingID`          int NOT NULL ,
 `applicationDate`       datetime NOT NULL ,
 `applicationStatus`     enum('submitted','inreview','interview','not considered','selected') NOT NULL ,
 `candidateLastAction`   datetime NOT NULL ,
 `recruiterLastAction`   datetime NOT NULL ,
 `recruiterID`           int NOT NULL ,

PRIMARY KEY (`jobListingCandidateID`),
KEY `fkIdx_162` (`candidateID`),
CONSTRAINT `FK_162` FOREIGN KEY `fkIdx_162` (`candidateID`) REFERENCES `candidate` (`candidateID`),
KEY `fkIdx_165` (`jobListingID`),
CONSTRAINT `FK_165` FOREIGN KEY `fkIdx_165` (`jobListingID`) REFERENCES `jobListing` (`jobListingID`),
KEY `fkIdx_197` (`recruiterID`),
CONSTRAINT `FK_197` FOREIGN KEY `fkIdx_197` (`recruiterID`) REFERENCES `recruiter` (`recruiterID`)
);






CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `UpdateRecruiterCompany`(recuiterEmail varchar(50), companyName varchar(50), companyDescription varchar(50), companyWebsite varchar(50) )
BEGIN

	DECLARE recruitingOrg INT DEFAULT 0;
    DECLARE recruiterID INT DEFAULT 0;
    
    ##load local variable info
	SELECT EXISTS(select *
		FROM organization 
		WHERE industryID = (select industryID from sk_dev.industry where industryName="Recruiter Org") 
			and TRIM(LOWER(orgName)) = TRIM(LOWER(companyName))) 
	INTO recruitingOrg;
    
    SELECT r.recruiterID 
		FROM sk_dev.recruiter r
		WHERE orgEmail = recuiterEmail
    INTO recruiterID;
    
    
    #if org dosent exist as a Recruiter Org create it
    IF(recruitingOrg=0) THEN
		START TRANSACTION;
			INSERT INTO sk_dev.organization (orgName,industryID)
			VALUES (companyName,(select industryID from sk_dev.industry where industryName="Recruiter Org"));
        COMMIT;
    END IF;
    
    
	START TRANSACTION;
		INSERT INTO sk_dev.recruiter_org (recruiterID,orgID)
		VALUES (recruiterID,(select orgID from sk_dev.organization where orgName=companyName));
	COMMIT;
    SELECT firstName,orgEmail FROM recruiter r WHERE r.orgEmail = recuiterEmail;
END
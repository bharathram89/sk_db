CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `createRecruiter`(firstName varchar(50),lastName varchar(50),orgEmail varchar(50),contactNum varchar(10),verifyCode varchar(5),pass varchar(50))
BEGIN
	##IF 
    
	DECLARE userExists INT DEFAULT 0;
	SELECT EXISTS(select *
	FROM recruiter r WHERE TRIM(LOWER(r.orgEmail)) = TRIM(LOWER(orgEmail))) newOrg INTO userExists;
    
    IF(userExists=0) THEN
		START TRANSACTION;
			INSERT INTO recruiter(`firstName`,`lastName`,`orgEmail`,`contactNumber`,`verificationCode`,`password`) VALUES ( firstName,lastName,orgEmail,contactNum,verifyCode,pass);
		COMMIT;
        SELECT firstName,orgEmail FROM recruiter r WHERE r.orgEmail = orgEmail;
    ELSE 
		SELECT 'USER EXISTS';
    END IF;
    
END
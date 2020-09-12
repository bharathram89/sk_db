CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `createNewVerificationCode`(user varChar(50),code varChar(10))
BEGIN
	DECLARE userID INT DEFAULT 0;
    DECLARE userVerified INT DEFAULT 0;
    
    
	select recruiterID INTO userID
	FROM recruiter r WHERE TRIM(LOWER(r.orgEmail)) = TRIM(LOWER(user)) AND r.verificationCode != 'VERIFIED';
    
    IF(userID!=0)THEN
		Update recruiter
		Set verificationCode = code
		Where recruiterID = userID;
		
		
		#verify update is good
		SELECT EXISTS(select *
		FROM recruiter r WHERE r.verificationCode = code AND TRIM(LOWER(r.orgEmail)) = TRIM(LOWER(user))) newOrg INTO userVerified;
	ELSE
		select candidateID INTO userID
		FROM candidate r WHERE TRIM(LOWER(r.email)) = TRIM(LOWER(user)) AND r.verificationCode != 'VERIFIED';
    
		IF(userID!=0)THEN
			Update candidate
			Set verificationCode = code
			Where candidateID = userID;
			
			
			#verify update is good
			SELECT EXISTS(select *
			FROM candidate r WHERE r.verificationCode = code AND TRIM(LOWER(r.email)) = TRIM(LOWER(user))) newOrg INTO userVerified;
		END IF;
    END IF;
    
    
    
    #if user does exist and is verified 
    IF(userVerified!=0) THEN
		SELECT 'NEW VERIFICATION' as orgEmail;
    ELSE 
		SELECT 'VERIFY FAILED';
    END IF;
    
    
END
CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `verifyRecruiter`(code varchar(10),userType varchar(5))
BEGIN
	DECLARE user INT;
    DECLARE userVerified INT DEFAULT 0;
    
    IF (userType='rec') THEN
		#get user
		select recruiterID into user from recruiter where verificationCode=code;
		
		#update user as verified
		Update recruiter 
		Set verificationCode = 'VERIFIED'
		Where recruiterID = user;
		
		#verify update is good
		SELECT EXISTS(select *
		FROM recruiter r WHERE r.verificationCode = 'VERIFIED' AND TRIM(LOWER(r.recruiterID)) = TRIM(LOWER(user))) newOrg INTO userVerified;
	
    ELSE
    
		#get user
		select candidateID into user from candidate where verificationCode=code;
		
		#update user as verified
		Update candidate 
		Set verificationCode = 'VERIFIED'
		Where candidateID = user;
		
		#verify update is good
		SELECT EXISTS(select *
		FROM candidate r WHERE r.verificationCode = 'VERIFIED' AND TRIM(LOWER(r.candidateID)) = TRIM(LOWER(user))) newOrg INTO userVerified;
	
	END IF;
    
    #if user does exist and is verified 
    IF(userVerified!=0 && userType='rec') THEN
		select orgEmail
		FROM recruiter r
		Where r.recruiterID = user;
    ELSEIF(userVerified!=0 && userType='can') THEN
		select email
		FROM candidate r
		Where r.candidateID = user;
	ELSE
		SELECT 'VERIFY FAILED';
    END IF;
END
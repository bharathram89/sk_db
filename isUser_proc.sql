CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `isUser`(user varchar(50),passResetCode varchar(10))
BEGIN

    DECLARE verifiedUser INT DEFAULT 0;
    DECLARE user INT DEFAULT 0;
    
    Select recruiterID into user
    From recruiter
    Where orgEmail =user;
    
    IF(user != 0) THEN
    
		Update recruiter
		Set passwordResetCode = passResetCode
		Where orgEmail = user;
		
		SELECT EXISTS(select *
		FROM recruiter r WHERE  r.passwordResetCode = passResetCode AND r.verificationCode = 'VERIFIED' AND TRIM(LOWER(r.orgEmail)) = TRIM(LOWER(user))) newOrg INTO verifiedUser;
	ELSE
		Select candidateID into user
		From candidate
		Where email =user;
		
        IF(user != 0) THEN
			Update candidate
			Set passwordResetCode = passResetCode
			Where email = user;
			
			SELECT EXISTS(select *
			FROM candidate r WHERE  r.passwordResetCode = passResetCode AND r.verificationCode = 'VERIFIED' AND TRIM(LOWER(r.email)) = TRIM(LOWER(user))) newOrg INTO verifiedUser;
		END IF;
    END IF;
    #passwordResetCode
    
    Select verifiedUser;
END
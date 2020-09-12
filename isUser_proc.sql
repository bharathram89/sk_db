CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `isUser`(user varchar(50),passResetCode varchar(10))
BEGIN

    DECLARE verifiedUser INT DEFAULT 0;
    
    Update recruiter
    Set passwordResetCode = passResetCode
    Where orgEmail = user;
    
	SELECT EXISTS(select *
	FROM recruiter r WHERE  r.passwordResetCode = passResetCode AND r.verificationCode = 'VERIFIED' AND TRIM(LOWER(r.orgEmail)) = TRIM(LOWER(user))) newOrg INTO verifiedUser;
    #passwordResetCode
    Select verifiedUser;
END
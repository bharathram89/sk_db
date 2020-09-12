CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `resetPass`(userName varchar(50), code varchar(10),pass varchar(50))
BEGIN
	DECLARE User INT DEFAULT 0;
    
    Select recruiterID INTO User
    From recruiter
    Where passwordResetCode = code AND orgEmail = userName;
    
    IF(User=0) THEN
    
		Select candidateID INTO User
		From candidate
		Where passwordResetCode = code AND email = userName;
        IF(User!=0) THEN
			Update candidate
			Set password = pass , passwordResetCode='Complete'
			Where candidateID = User;
            
			Select User as result;
        ELSE
			Select 'USER NOT FOUND' as result;
        END IF;
    ELSE
		Update recruiter
        Set password = pass , passwordResetCode='Complete'
        Where recruiterID = User;
        
        Select User as result;
    END IF;
END
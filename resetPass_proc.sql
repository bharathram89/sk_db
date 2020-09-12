CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `resetPass`(userName varchar(50), code varchar(10),pass varchar(50))
BEGIN
	DECLARE User INT DEFAULT 0;
    Select recruiterID INTO User
    From recruiter
    Where passwordResetCode = code AND orgEmail = userName;
    
    IF(User=0) THEN
		Select 'USER NOT FOUND' as result;
    ELSE
		Update recruiter
        Set password = pass , passwordResetCode='Complete'
        Where recruiterID = User;
        
        Select User as result;
    END IF;
END
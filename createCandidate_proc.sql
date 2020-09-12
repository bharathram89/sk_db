CREATE DEFINER=`skippeddbadmin`@`%` PROCEDURE `createCandidate`(IN P_firstName varchar(50),IN P_lastName varchar(50),IN P_Email varchar(50),IN P_contactNum varchar(10),IN verifyCode varchar(5),IN P_password varchar(50))
BEGIN
	DECLARE userExists INT DEFAULT 0;
    
	SELECT EXISTS(select *
 	FROM candidate r WHERE TRIM(LOWER(r.Email)) = TRIM(LOWER(P_Email))) newOrg INTO userExists;
    
     IF(userExists=0) THEN
 		START TRANSACTION;
 			INSERT INTO candidate(firstName,lastName,Email,contactNumber,verificationCode,password) VALUES ( P_firstName,P_lastName,P_Email,P_contactNum,verifyCode,P_password);
 		COMMIT;
        SELECT firstName,Email FROM candidate r WHERE r.Email = P_Email;
    ELSE 
 		SELECT 'USER EXISTS';
     END IF;
    
END
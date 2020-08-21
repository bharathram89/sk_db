/**ROLETYPE**/
Insert into roleType 
Values (1,'Information Techniology'),(2,'Project/Program Management'),(3,'Analyst'),(4,'Product'),(5,'Design'),(6,'Devops'),(7,'Engineering Management'),(8,'Software Engineer'),(9,'QA Engineer');

/**INDUSTRY**/
Insert into industry
Values (1,"Banking","Banking") ,(2,"Health Care","Health Care"),(3,"Manufacturing","Manufacturing"),(4,"Hospitality","Hospitality"),(5,"Information Technology","Information Technology"),(6,"Automotive Industry","Automotive Industry"),(7,"Retail","Retail"),(8,'Recruiter Org','Recruiter Org');

/**ROLE**/


//#8 role
Insert into role 
Values (1,"Embedded Engineer","",8),(2,"Frontend Engineer","",8),(3,"Hardware Engineer","",8),(4,"Backend Engineer","",8),(5,"Data Engineer","",8),(6,"Full Stack Engineer","",8),(7,"Machine Learning Engineer","",8),(8,"Mobile Engineer","",8),(9,"Security Engineer","",8),(10,"AR/VR Engineer","",8),(11,"Blockchain Engineer","",8),(12,"Computer Vision Engineer","",8),(13,"Gaming Engineer","",8),(14,"NLP Engineer","",8),(15,"Search Engineer","",8);
//#7 role
Insert into role 
Values(16,"Applications Engineering Manager","",7),(17,"Data Infrastructure Manager","",7),(18,"DevOps Manager","",7),(19,"Machine Learning Manager","",7),(20,"Mobile Engineering Manager","",7),(21,"QA Manager","",7),(22,"Search Engineering Manager","",7);
//#6
Insert into role (roleName,roleDescription,roleTypeID)
Values ("Build/Release Engineer","",6),("DevOps Engineer","",6),("Site Reliability Engineer (SRE)","",6),('Cloud Engineer','',8),('ERP Engineer','',8);
//#5
Insert into role (roleName,roleDescription,roleTypeID)
Values("Brand/Graphic Designer","",5),("Product Designer","",5),("UX Designer","",5),("UX Researcher","",5),("Visual/UI Designer","",5);


//#3
Insert into role (roleName,roleDescription,roleTypeID)
Values("Data Analyst","",3),("Data Scientist","",3),("Business Analyst","",3),("Business Operations","",3);
//#2
Insert into role (roleName,roleDescription,roleTypeID)
Values("IT Project Manager","",2),("Program Manager (HW)","",2),("Program Manager (SW)","",2),("Project Manager","",2),("Technical Program Manager","",2);
//#1
Insert into role (roleName,roleDescription,roleTypeID)
Values("Database Administrator","",1),("Business Systems Engineer","",1),("Desktop Support","",1),("NOC Engineer","",1),("Network Administrator","",1),("Network Engineer","",1),("Salesforce Developer","",1),("Solutions Architect","",1),("QA Manager","Testing team Manager",2);


/**SKILLTYPE**/

Insert into skillType (skillTypeName)
Values("Framework"),("Business Intelligence"),("Programing Language"),("Scripting Language"),("Communication"),("Networking"),("Concepts"),("CMS"),('ERP Applications'),('Cloud Tools');

/**SKILL**/

 Insert into skill (skillName,skillDescription,skillTypeID)
 Values('JAVA','',3),('Javascript','',3),('Angular','Front end framework',1),('ReactJS','Front end framework',1),('AJAX','',1),
('C#','',3),('SQL','',3),('C++','',3),('HTML','',3),('PL/SQL','',3),('XML','',3),('C','',3),('Perl','',3),('Python','',3),('PHP','',3),('Objective-C','',3),('ASP.NET','',3),('Ruby','',3),
('SAP','',9),('Oracle','',9),('Siebel','',9),('Workday','',9),('Salesforce','',9),('Netsuite','',9),
('Amazon Web Service','',10),('Google Cloud','',10),('Azure','',10),('Salesforce','',10),('IBM','',10),('Rackspace','',10);


/**ORGS**/

Insert into organization (orgName,IndustryID)
Values ('Bank of America',1),('Wells Fargo',1),('Kaiser Permanente',2);

 
 
 
 
 
 
 
 
 
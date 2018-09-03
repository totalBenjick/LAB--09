#Section I. Create Database and Tables

#    Create a database called JS09_MessagesBy_Benjick, with two tables:
#        Users (structure):
#            User_Id, make it auto increment and primary key.
#            Username, length of 50.
#            Password, length of 41, user CHAR MySQL Data Type.

CREATE Table Users(
User_ID INT AUTO_INCREMENT PRIMARY KEY,
Username VARCHAR(50) UNIQUE,
Password VARCHAR(41) UNIQUE);

#        Messages
#            Message_Id, should be auto_increment and primary_key.
#            User_Id, the foreign key from Users table.
#            Content, user TEXT MySQL Data Type.
#            Created_At, use TIMESTAMP Data Type, and add a default value of the current time that it’s created.

CREATE Table Messages(
Message_ID INT AUTO_INCREMENT PRIMARY KEY,
User_ID INT,
Content TEXT,
Created_At TIMESTAMP DEFAULT NOW());

ALTER TABLE Messages ADD FOREIGN KEY(User_ID) REFERENCES Users(User_ID);

#You make sure to read about CURRENT_TIMESTAMP helper.
#Section II. Basic Operations.

 #   Insert two users:
#        User 1:
#            Username: tapeface
#            Password: tapeface. Make sure to encrypt the content using PASSWORD native function.

#        User 2:
#            Username: butterface
#            Password: butterface. Make sure to encrypt the content using PASSWORD native function.


INSERT INTO Users(Username,Password) VALUES('tapeface',PASSWORD('tapeface'));
INSERT INTO Users(Username,Password) VALUES('butterface',PASSWORD('butterface'));

#    Save the next three messages:
#        Message 1
#            Username: typeface
#            Content: How is it going my friend!?
#            Date: 2017-09-10 23:45:12
#        Message 2
#            Username: typeface
#            Content: Are u there?
#            Date: 2017-09-10 23:55:25
#        Message 3
#            Username: butterface
#            Content: I’m here! Really cool. How about you man? Tell me something.
#            Date: 2017-09-11 00:20:33

INSERT INTO Messages(Message_ID,User_ID,Content,Created_At) VALUES('1','1','How is it going my friend!?','2017-09-10 23:45:12');

INSERT INTO Messages(Message_ID,User_ID,Content,Created_At) VALUES('2','1','Are u there?','2017-09-10 23:55:25');

INSERT INTO Messages(User_ID,Content,Created_At) VALUES('2','I’m here! Really cool. How about you man? Tell me something.','2017-09-11 00:20:33');


#Section III. Get information
#Use HR database

#Write a query to get the department name (Departments.DEPARTMENT_NAME) and number of employees (COUNT) in each department.


SELECT DEPARTMENT_NAME, count(Employees.DEPARTMENT_ID) AS TOTALofEMPLOYEES FROM Employees INNER JOIN Departments ON 		Employees.Department_ID  = Departments.Department_ID GROUP BY Department_Name;


#Write a query to find the employee ID (Employees.EMPLOYEE_ID), job title (Jobs.JOB_TITLE), number of days between ending date and starting #date (JobsHistory.END_DATE - JobsHistory.START_DATE) for all jobs in department 90 (DEPARTMENT_ID) from job history (JobsHistory).

	
SELECT JobHistory.Department_ID, JobHistory.Job_ID, Employees.Employee_ID, DATEDIFF(End_Date,Start_Date) AS TotalDays 
FROM JobHistory INNER JOIN Employees ON JobHistory.Employee_ID = Employees.Employee_ID WHERE JobHistory.Department_ID=90;



#Write a query to display the department name (Departments.DEPARTMENT_NAME), manager name (Employees.FIRST_NAME), and city (Locations.CITY).


SELECT Employees.FIRST_NAME,Departments.DEPARTMENT_ID, Departments.DEPARTMENT_NAME, Departments.MANAGER_ID, Locations.City 
FROM Departments 
INNER JOIN Locations ON Locations.LOCATION_ID = Departments.LOCATION_ID 
INNER JOIN Employees ON Employees.MANAGER_ID = Departments.MANAGER_ID 
WHERE Departments.Manager_ID !=0;


#Write a query to display the job title (Jobs.JOBS_TITLE) and average salary (Employees.SALARY) of employees.a

SELECT  Jobs.Job_Title, ROUND(AVG(Employees.SALARY),2) AS AVG_SALARY FROM Jobs INNER JOIN Employees ON Jobs.Job_ID = Employees.Job_ID
GROUP BY Jobs.Job_Title ORDER BY AVG_SALARY DESC;


#   EXTRA BONUS Write a query to display the job history (JobsHistory) that were done by any employee (Employees) who is currently earning #more than 10000 of salary (Employees.SALARY).


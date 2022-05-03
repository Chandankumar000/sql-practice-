/****** Script for SelectTopNRows command from SSMS  ******/
-- Question 1 Provide the complete info on all employees

 Select * from employee

-- Question 2 What is the count of all employees?
Select count(*) from employee

 -- Question 3 What is the count of all departments?
 Select count(*) from department

 -- Question 4 Name of projects in Sugarland ?
 SELECT pname, plocation
 FROM project
 WHERE plocation = 'Sugarland';

 -- Question 5 Employees name and hours information ?
 SELECT e.Fname, e.Lname, SUM(hours) as hour_info
 FROM employee e
 INNER JOIN works_on w
 ON e.ssn = w.essn
 GROUP BY Fname, Lname ;

-- Question 6 (Employees name that don't work on Project ProductX ?
 SELECT e.Fname, e.Lname
 FROM employee e
 JOIN project p ON e.Dno = p.dnum
 WHERE pname <> 'ProductX'
 GROUP BY Fname, Lname;

-- Question 7 (Employer that worked the least 40) ?
 SELECT e.Fname, e.Lname, SUM(hours) as Hours
 FROM employee e
 INNER JOIN works_on w ON e.ssn = w.essn
 GROUP BY e.Fname, e.Lname
 having SUM(hours) >= 40

-- Question 8(Employer that worked the most)
 SELECT e.Fname, e.Lname, SUM(hours) as hours
 FROM employee e
 INNER JOIN works_on w ON e.ssn = w.essn
 GROUP BY Fname, Lname
 ORDER BY SUM(hours) DESC ;

 -- since we can see from the result that the max hour worked for is 40, we can edit the query to include only employees that worked for 40 hours ?
 
 SELECT e.Fname, e.Lname, SUM(hours)
 FROM employee e
 INNER JOIN works_on w ON e.ssn = w.essn
 GROUP BY Fname, Lname
 HAVING SUM(hours) = 40 ;


 -- Question 9 Who worked the most hours in Research dept? 

 SELECT Fname, Lname, SUM(hours), dname
 FROM employee e
 JOIN works_on w ON e.ssn = w.essn
 JOIN department d ON e.Dno = d.dnumber
 WHERE dname = 'research'
 GROUP BY Fname, Lname, dname;

-- Question 10 Names of dependents for person who worked most hours in Research dept. 
 SELECT e.Fname, e.Lname, SUM(hours), d.dname, dp.dependent_name
 FROM employee e
 JOIN works_on w ON e.ssn = w.essn
 JOIN department d ON e.Dno = d.dnumber
 JOIN dependent dp ON e.ssn = dp.essn
 WHERE dname = 'research'
 GROUP BY Fname, Lname, dname, dependent_name
 ORDER BY SUM(hours);

-- Question 11 Provide the name of projects in either Department number 4 or 5 ?
SELECT pname, dnum
FROM project 
WHERE dnum = '4' OR dnum = '5' ;

-- Question 12 Provide the names of employees with either a son or wife dependent
SELECT e.Fname, e.Lname, d.relationship, d.sex
FROM employee e
JOIN dependent d ON e.SSN = d.essn
WHERE d.relationship = 'son' OR (d.relationship = 'spouse' AND d.sex = 'F')
GROUP BY e.Fname, e.Lname, d.relationship;

-- Question 13 Provide the names of employees with salary between $5k and $30k
SELECT Fname, Lname, Salary
FROM employee
WHERE Salary BETWEEN '5000' AND '30000';

-- Question 14 Provide the names of employees that worked between 20 and 30 hours
SELECT e.Fname, e.Lname, SUM(hours) as total_no_of_hours
FROM employee e
JOIN works_on w 
ON e.SSN = w.essn
GROUP BY e.Fname, e.Lname
HAVING SUM(hours) BETWEEN '30' AND '40' ;

-- Question 15 Provide the department name and project name for projects in Houston, Sugarland, or Stafford
SELECT d.dname, p.pname, p.plocation
FROM department d
INNER JOIN project p
ON d.dnumber=p.dnum
WHERE plocation IN ('Houston', 'Sugarland', 'Stafford');


-- Question 16 Provide employees with A in First Name
SELECT e.Fname,e.Lname
FROM employee e
WHERE Fname LIKE '%a%' ;

-- Question 17 Provide employees with Last Name that does not begin with W
SELECT *
FROM employee
WHERE Lname NOT LIKE 'W%';

-- Question 18 Provide employees with ‘a’ as the second letter
SELECT 	*
FROM employee
WHERE Fname LIKE '_a%';

-- Question 20 What is the total salary for employees that worked on either Product Z or X?
SELECT SUM(e.salary), p.pname
FROM employee e
JOIN project p
ON e.Dno=p.dnum
WHERE p.pname IN ('ProductZ', 'ProductX')
GROUP BY p.pname ;

-- Question 21 Name of employees who first name start with A and order last name alphabetically
SELECT Fname, Lname
FROM employee
WHERE Fname LIKE 'A%'
ORDER BY Lname ;

-- Question 22 Name of employees in Department number 5 and salary ordered largest to smallest
SELECT Fname, Lname, Dno, Salary
FROM employee
WHERE Dno=5
ORDER BY Salary DESC ;

-- Question 23 Sort employee birthdates from oldest to newest and then sort first names in alphabetical order
SELECT *
FROM employee
ORDER BY bdate DESC, Fname ASC ;

-- Question 24 Sort employee salaries by largest to smallest and employee last names alphabetically
SELECT *
FROM employee
ORDER BY salary DESC, Lname;


-- Question 25 How many male and female employees are there?
SELECT sex, COUNT(sex) AS total_no
FROM employee
GROUP BY sex
ORDER BY total_no DESC; -- To put the highest sex first

-- Question 26 How many male and female dependents are there?
SELECT sex, COUNT(sex) AS total_no
FROM dependent 
GROUP BY sex
ORDER BY total_no DESC; -- To put the highest sex first

-- Question 27 How many projects are there for each location?
SELECT plocation, COUNT(*) AS total_no
FROM project
GROUP BY plocation ;

-- Question 28 Identify the number of projects in each location and order by most to least projects
SELECT plocation, COUNT(*) AS total_no
FROM project
GROUP BY plocation
ORDER BY total_no DESC ;

-- Question 29 Identify the number of male and female employees and order from most to least
SELECT sex, COUNT(sex) AS total_no
FROM employee
GROUP BY sex
ORDER BY total_no DESC ; -- To put the highest sex first

-- Question 30 How many male and female spouses are there?
SELECT sex, COUNT(relationship) AS total_no
FROM dependent
WHERE relationship = 'spouse'
GROUP BY sex ;

--  Question 31 What departments pay over $50,000 to employees?
SELECT d.dname, SUM(e.salary) as total_no
FROM employee e
JOIN department d ON e.Dno = d.dnumber
GROUP BY d.dname
HAVING SUM(e.salary) > 50000
ORDER BY total_no DESC ;

-- Question 32 Provide the employee SSN and number of dependents for employees with more than 1 dependent
SELECT e.SSN, COUNT(d.dependent_name) as total
FROM employee e
JOIN dependent d ON e.SSN = d.essn
GROUP BY e.SSN
HAVING COUNT(d.dependent_name) > 1 ;

-- Question 33 Provide the project locations with more than 1 project
SELECT plocation, COUNT(pnumber) as total
FROM project 
GROUP BY plocation 
HAVING count(pnumber)  > 1 ;

-- Question 34 Get the name, birthdate, sex, and salary for each employee.
SELECT Fname, Lname, bdate, sex, salary
FROM employee ;

-- Question 34a Modify query to get only employees born after 1960.
SELECT Fname, Lname, bdate, sex, salary
FROM employee
WHERE bdate > '1960-12-31' ;

-- Question 34b Modify query to group by sex for those born after 1960 (remove name and salary)
SELECT  COUNT(bdate) AS total_no, sex
FROM employee
WHERE bdate > '1960-12-31'
GROUP BY sex ;

-- Question 34cModify query to get the average salary for men and women employees born after 1960
SELECT  AVG(salary) AS avg_salary, sex
FROM employee
WHERE bdate > '1960-12-31'
GROUP BY sex ;

-- Question 34d Modify query to get the average salary for men and women employees born after 1960 and with an average over $15,000 ranked from largest to smallest

SELECT  AVG(salary) AS avg_salary, sex
FROM employee
WHERE bdate > '1960-12-31'
GROUP BY sex
HAVING AVG(salary) > 15000
ORDER BY AVG(salary) DESC ;
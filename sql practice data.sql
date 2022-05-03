/* Exporting metadata from `COMPANY` */ 
create database company ;

use company ;
-- TABLE: COMPANY.department
CREATE TABLE department (
  dname varchar(15) NOT NULL,
  dnumber int NOT NULL,
  mgr_ssn char(9) NOT NULL,
  mgr_start_date date DEFAULT NULL,
  PRIMARY KEY (dnumber)
  )

-- TABLE: `COMPANY`.`dependent`
CREATE TABLE dependent (
  essn char(9) NOT NULL,
  dependent_name varchar(15) NOT NULL,
  sex char(1) DEFAULT NULL,
  bdate date DEFAULT NULL,
  relationship varchar(8) DEFAULT NULL,
  PRIMARY KEY (essn,dependent_name)
  ) 

  --  TABLE: `COMPANY`.`dept_locations`
CREATE TABLE dept_locations (
  dnumber int NOT NULL,
  dlocation varchar(15) NOT NULL,
  PRIMARY KEY (dnumber,dlocation)
  )

-- TABLE: `COMPANY`.`employee`
CREATE TABLE employee (
  Fname varchar(15) NOT NULL,
  Minit char(1) DEFAULT NULL,
  Lname varchar(15) NOT NULL,
  SSN char(9) NOT NULL,
  bdate date DEFAULT NULL,
  Address varchar(30) DEFAULT NULL,
  sex varchar(2) DEFAULT NULL,
  Salary decimal(10,2) DEFAULT NULL,
  Super_ssn char(9) DEFAULT NULL,
  Dno int NOT NULL,
  PRIMARY KEY (SSN)
  )

-- # TABLE: `COMPANY`.`project`
CREATE TABLE project (
  pname varchar(15) NOT NULL,
  pnumber int NOT NULL,
  plocation varchar(15) DEFAULT NULL,
  dnum int NOT NULL,
  PRIMARY KEY (pnumber)
  )

-- # TABLE: `COMPANY`.`works_on`
CREATE TABLE works_on (
  essn char(9) NOT NULL,
  pno int NOT NULL,
  hours decimal(3,1) NOT NULL,
  PRIMARY KEY (essn,pno)
  )

-- 
use company 

-- # Data for table `COMPANY`.`department`:
INSERT INTO department VALUES ('Headquarters', 1, '888665555', '1981-06-19');

INSERT INTO department VALUES ('Administration', 4, '987654321', '1995-01-10');

INSERT INTO department VALUES ('Research', 5, '333445555', '1988-05-22');


Select * from department


-- # Data for table `COMPANY`.`dependent`:
INSERT INTO dependent VALUES ('123456789', 'Alice', 'F', '1988-12-30', 'Daughter')
INSERT INTO dependent VALUES ('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');
INSERT INTO dependent VALUES ('123456789', 'Michael', 'M', '1988-01-04', 'Son');
INSERT INTO dependent  VALUES ('333445555', ' \"Theodore\"', 'M', '1983-10-25', 'Son');
INSERT INTO dependent VALUES ('333445555', 'Alice', 'F', '1986-04-05', 'Daughter');
INSERT INTO dependent VALUES ('333445555', 'Joy', 'F', '1958-03-05', 'Spouse');
INSERT INTO dependent VALUES ('987654321', 'Abner', 'M', '1942-02-28', 'Spouse');

Select * from dependent

-- # Data for table `COMPANY`.`dept_locations`:
INSERT INTO dept_locations VALUES (1, 'Houston');
INSERT INTO dept_locations VALUES (4, 'Stafford');
INSERT INTO dept_locations VALUES (5, 'Bellaire');
INSERT INTO dept_locations VALUES (5, 'Houston');
INSERT INTO dept_locations VALUES (5, 'Sugarland');

Select * from dept_locations


-- delete from dept_locations

-- # Data for table `COMPANY`.`employee`:
INSERT INTO employee VALUES ('John', 'B', 'Smith', '123456789', '1965-01-09', '731 Fondren, Houston, TX', 'M', 30000.00, '333445555', 5);
INSERT INTO employee VALUES ('Franklin', 'T', 'Wong', '333445555', '1955-12-08', '638 Voss, Houston, TX', 'M', 40000.00, '888665555', 5);
INSERT INTO  employee VALUES ('Joyce', 'A', 'English', '453453453', '1972-07-31', '5631 Rice, Houston, TX', 'F', 25000.00, '333445555', 5);
INSERT INTO employee VALUES ('Richard', 'K', 'Marini', '653298653', '1962-12-30', '98 Oak Forest, Katy, TX', 'M', 37000.00, '888665555', 4);
INSERT INTO employee VALUES ('Ramesh', 'K', 'Narayan', '666884444', '1962-09-15', '975 Fire Oak, Humboldt, TX', 'M', 38000.00, '333445555', 5);
INSERT INTO employee VALUES ('James', 'E', 'Borg', '888665555', '1937-11-10', '450 Stone, Houston, TX', 'M', 55000.00, '', 1);
INSERT INTO employee  VALUES ('Jennifer', 'S', 'Wallace', '987654321', '1941-06-20', '291 Berry, Bellaire, TX', 'F', 43000.00, '888665555', 4);
INSERT INTO employee VALUES ('Ahmad', 'V', 'Jabbar', '987987987', '1969-03-29', '980 Dallas, Houston, TX', 'M', 25000.00, '987654321', 4);
INSERT INTO employee VALUES ('Alicia', 'J', 'Zelaya', '999887777', '1968-01-19', '3321 Castle, Spring, TX', 'F', 25000.00, '987654321', 4);


Select * from employee


-- # Data for table `COMPANY`.`project`:
INSERT INTO project VALUES ('ProductX', 1, 'Bellaire', 5);
INSERT INTO project VALUES ('ProductY', 2, 'Sugarland', 5);
INSERT INTO project VALUES ('ProductZ', 3, 'Houston', 5);
INSERT INTO project VALUES ('Computerization', 10, 'Stafford', 4);
INSERT INTO project  VALUES ('Reorganization', 20, 'Houston', 1);
INSERT INTO project VALUES ('NewBenefits', 30, 'Stafford', 4);

Select * from project

-- # Data for table `COMPANY`.`works_on`:
INSERT INTO works_on VALUES ('123456789', 1, 32.5);
INSERT INTO works_on VALUES ('123456789', 2, 7.5);
INSERT INTO works_on VALUES ('333445555', 2, 10.0);
INSERT INTO works_on VALUES ('333445555', 3, 10.0);
INSERT INTO works_on VALUES ('333445555', 10, 10.0);
INSERT INTO works_on VALUES ('333445555', 20, 10.0);
INSERT INTO works_on VALUES ('453453453', 1, 20.0);
INSERT INTO works_on VALUES ('453453453', 2, 20.0);
INSERT INTO works_on VALUES ('666884444', 3, 40.0);
INSERT INTO works_on VALUES ('888665555', 20, 0.0);
INSERT INTO works_on VALUES ('987654321', 20, 15.0);
INSERT INTO works_on VALUES ('987654321', 30, 20.0);
INSERT INTO works_on VALUES ('987987987', 10, 35.0);
INSERT INTO works_on VALUES ('999887777', 10, 10.0);
INSERT INTO works_on  VALUES ('999887777', 30, 30.0);
INSERT INTO works_on  VALUES ('987987987', 30, 5.0);

select * from works_on
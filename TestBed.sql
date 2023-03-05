drop table Employee;
drop table Department;
drop table Dept_Locations;
drop table Works_on;
drop table Comp_Project;
drop table Dependent;

CREATE TABLE Employee (
SSN CHAR(9),
Fname CHAR(10),
Minit CHAR(1),
Lname CHAR(10),
Address CHAR(30),
Sex CHAR(1),
Salary REAL,
SuperSSN CHAR(9),
Dno CHAR(1),
PRIMARY KEY (SSN));

INSERT INTO Employee VALUES ('123456789', 'John', 'B', 'Smith', '731 Fondren, Houston TX', 'M', 30000, '333445555', '5');
INSERT INTO Employee VALUES ('333445555', 'Franklin', 'T', 'Wong', '638 Voss, Houston TX', 'M', 40000, '888665555', '5');
INSERT INTO Employee VALUES ('999887777', 'Alicia', 'J', 'Zelaya', '3321 Castle, Spring TX', 'F', 25000, '987654321', '4');
INSERT INTO Employee VALUES ('987654321', 'Jennifer', 'S', 'Wallace', '291 Berry, Bellaire TX', 'F', 43000, '888665555', '4'); 
INSERT INTO Employee VALUES ('666884444', 'Ramesh', 'K', 'Narayan', '975 FireOak, Humble TX', 'M', 38000, '333445555', '5');
INSERT INTO Employee VALUES ('453453453', 'Joyce', 'A', 'English', '5631 Rice, Houston TX', 'F', 25000, '333445555', '5');
INSERT INTO Employee VALUES ('987987987', 'Ahmad', 'V', 'Jabbar', '980 Dallas, Houston TX', 'M', 25000, '987654321', '4');
INSERT INTO Employee VALUES ('888665555', 'James', 'E', 'Borg', '450 Stone, Houston TX', 'M', 55000, null, '1');

CREATE TABLE Department (
Dnumber CHAR(1),
Dname CHAR(20),
MgrSSN CHAR(9),
PRIMARY KEY (Dnumber));

INSERT INTO Department VALUES ('5', 'Research', '333445555');
INSERT INTO Department VALUES ('4', 'Administration', '987654321'); 
INSERT INTO Department VALUES ('3', 'Research', '333445555');
INSERT INTO Department VALUES ('1', 'Headquarters', '888665555');

CREATE TABLE Dept_Locations (
Dnumber CHAR(1),
Dlocation CHAR(20),
PRIMARY KEY (Dnumber, Dlocation));

INSERT INTO Dept_Locations VALUES ('1', 'Houston');
INSERT INTO Dept_Locations VALUES ('3', 'Bellaire');
INSERT INTO Dept_Locations VALUES ('4', 'Stafford');
INSERT INTO Dept_Locations VALUES ('5', 'Bellaire');
INSERT INTO Dept_Locations VALUES ('5', 'Sugarland');
INSERT INTO Dept_Locations VALUES ('5', 'Houston');

CREATE TABLE Works_on (
ESSN CHAR(9),
Pno CHAR(2),
Hours REAL,
PRIMARY KEY (ESSN, Pno));

INSERT INTO Works_on VALUES ('123456789', '1', 32.5);
INSERT INTO Works_on VALUES ('123456789', '2', 7.5);
INSERT INTO Works_on VALUES ('666884444', '3', 40.0);
INSERT INTO Works_on VALUES ('453453453', '1', 20.0);
INSERT INTO Works_on VALUES ('453453453', '2', 20.0);
INSERT INTO Works_on VALUES ('333445555', '2', 10.0);
INSERT INTO Works_on VALUES ('333445555', '3', 10.0);
INSERT INTO Works_on VALUES ('333445555', '10', 10.0);
INSERT INTO Works_on VALUES ('333445555', '20', 10.0);
INSERT INTO Works_on VALUES ('999887777', '30', 30.0);
INSERT INTO Works_on VALUES ('999887777', '10', 10.0);
INSERT INTO Works_on VALUES ('987987987', '10', 35.0);
INSERT INTO Works_on VALUES ('987987987', '30', 5.0);
INSERT INTO Works_on VALUES ('987654321', '30', 20.0);
INSERT INTO Works_on VALUES ('987654321', '20', 15.0);
INSERT INTO Works_on VALUES ('888665555', '20', null);

CREATE TABLE Comp_Project (
Pnumber CHAR(2),
Pname CHAR(20),
Plocation CHAR(20),
Dnum CHAR(1),
PRIMARY KEY (Pnumber));

INSERT INTO Comp_Project VALUES ('1', 'ProductX', 'Bellaire', '5');
INSERT INTO Comp_Project VALUES ('2', 'ProductY', 'Sugarland', '5');
INSERT INTO Comp_Project VALUES ('3', 'ProductZ', 'Houston', '5');
INSERT INTO Comp_Project VALUES ('10', 'Computerization', 'Stafford', '4');
INSERT INTO Comp_Project VALUES ('20', 'Reorganization', 'Houston', '1');
INSERT INTO Comp_Project VALUES ('30', 'ProductX', 'Stafford', '4');

CREATE TABLE Dependent (
ESSN CHAR(9),
Dependent_name CHAR(20),
Sex CHAR(1),
Relationship CHAR(10),
PRIMARY KEY (ESSN, Dependent_name));

INSERT INTO Dependent VALUES ('333445555', 'Alice', 'F', 'Daughter');
INSERT INTO Dependent VALUES ('333445555', 'Theodore', 'M', 'Son');
INSERT INTO Dependent VALUES ('333445555', 'Joy', 'F', 'Spouse');
INSERT INTO Dependent VALUES ('987654321', 'Abner', 'M', 'Spouse');
INSERT INTO Dependent VALUES ('123456789', 'Michael', 'M', 'Son');
INSERT INTO Dependent VALUES ('123456789', 'Alice', 'F', 'Daughter');
INSERT INTO Dependent VALUES ('123456789', 'Elizabeth', 'F', 'Spouse');
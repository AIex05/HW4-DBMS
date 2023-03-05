INSERT INTO Employee (SSN,Fname,Minit,Lname,Address,Sex,Salary,SuperSSN,Dno)
VALUES ('94377554', 'Robert', 'F', 'Scott', '2365 Newcastle Rd, Bellaire, TX', 'M', 58000, '777553333', '1');
-- This is wrong because the value for Adress is too long, containing 31 character, but the limit is 30

INSERT INTO Dept_Locations (Dnumber, Dlocation)
VALUES ('3', null);
-- This is wrong because it violates the restriction that the Dlocation cannot be null

INSERT INTO Department (Dnumber, Dname, MgrSSN)
VALUES ('1', 'Headquarters', '234567891');
-- This is wrong because Dnumber is a unique column and because there already exists an entity with Dnumber 1, so inserting another will throw an error

INSERT INTO Works_on (ESSN, Pno, Hours)
VALUES ('888665555', null, 40.0);
-- This is wrong because Pno is in primary key, so that it cannot be null, and here we were trying to insert null

INSERT INTO Dependent (ESSN,Dependent_name,Sex,Relationship)
VALUES ('453453453', 'Michael', 'M', 'SPOUSE');

delete 
from Department where Dnumber='5';
-- This is wrong because the foreign key reference in table Dept-Location is not deleted

delete
from EMPLOYEE where SSN = '999887777';
-- This is wrong because the foreign key reference in table Works_on is not deleted

delete
from COMP_PROJECT where Pname = 'ProductX';
-- This is wrong because it does not specify which project to delete, instead of delete one project, it deletes 2 with different Pnumber (primary key)

-- i)
-- It is not allowed to update the primary key when the entity is already inserted

-- j)
-- The superSSN '345678912' does not exists in the table ENPLOYEE, so it cannot be changed

--k)
-- Because Pno is one of the primary key, so it is prohibited to change it


--2
--a)
(Select E.SSN, E.FNAME, E.LNAME
From Employee E
Join Works_on W on W.ESSN = E.SSN
Join Comp_Project CP on CP.PNUMBER = W.PNO
Where E.DNO = 4 AND CP.PNAME = 'ProductX' AND W.HOURS > 5)
UNION
(Select E.SSN, E.FNAME, E.LNAME
From Employee E
Join Works_on W on W.ESSN = E.SSN
Join Comp_Project CP on CP.PNUMBER = W.PNO
Where E.DNO = 4 AND CP.PNAME = 'ProductY' AND W.HOURS > 5);

--b)
Select E.SSN, E.FNAME, E.LNAME
from Employee E, (Select SSN
From Employee
MINUS
Select ESSN From Dependent) A1
where E.SSN = A1.SSN;

--c)
Select E1.SSN, E1.FNAME, E1.LNAME
From Employee E1
Join Employee E2 on E1.SUPERSSN = E2.SSN
Join Employee E3 on E2.SUPERSSN = E3.SSN
Where E3.FNAME = 'James' and E3.LNAME = 'Borg';

--d)
Select E.SSN, E.FNAME, E.LNAME
from Employee E, (Select Unique ESSN From Works_on where HOURS > 0) A1
where E.SSN = A1.ESSN;

--e)
Select Unique SSN, FNAME, LNAME
From Employee,
(Select ESSN 
From Works_on, (Select PNUMBER
From Comp_Project
Where PLOCATION = 'Stafford') A1
where Works_on.PNO in A1.PNUMBER) A2
Where Employee.SSN = A2.ESSN;

--f)
Select Department.DNAME, Employee.FNAME, Employee.LNAME, Employee.SSN,Employee.SALARY
From Employee
Join Department on Department.DNUMBER = Employee.DNO,
(Select MIN(Employee.SALARY) as SALARY
From Employee
Join Department on Department.DNUMBER = Employee.DNO
Where Dnumber = 5 and SEX = 'M'
group by DNO) A1
where A1.SALARY = Employee.SALARY;

--g)
Select Employee.FNAME, Employee.LNAME, Employee.SSN,Employee.SALARY
From Employee,
(Select MAX(Employee.SALARY) as SALARY
From Employee
Join Department on Department.DNUMBER = Employee.DNO
Where Dnumber = 4
group by DNO) A1
where A1.SALARY = Employee.SALARY;

--h)
Select E.SSN, E.FNAME, E.LNAME
from Employee E,
(select DNUMBER
From dept_locations
Where DLOCATION ='Houston') A1
Where E.DNO in A1.DNUMBER
INTERSECT
Select E.SSN, E.FNAME, E.LNAME
from Employee E
Where ADDRESS LIKE '%Houston%';

--i)
Select E.SSN, E.LNAME
From Employee E,
(Select Unique ESSN
From Dependent
Where RELATIONSHIP = 'Spouse'
INTERSECT
Select Unique SUPERSSN
From Employee) A1
Where E.SSN in A1.ESSN






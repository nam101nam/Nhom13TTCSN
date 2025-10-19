use master
if(exists (select*from sysdatabases where name='DeptEMP'))
drop database DeptEMP
go
create database DeptEMP
go 
use DeptEMP
go


 create table Department(
     DepartmentNo Integer  not null primary key,
     DepartmentName char(25) not null,
     Locationn char(25) not null
)
 create table Employee(
    EmpNo integer not null primary key,
    Fname varchar(15) not null,
    Lname varchar(15) not null,
    Job varchar(25) not null,
    HireDate datetime not null,
    Salary numeric,
    Commision numeric,
    DepartmentNo integer,
    constraint FK_EM_DE foreign key(DepartmentNo)
    references Department(DepartmentNo)
)
insert into Department(DepartmentNo,DepartmentName,Locationn) values('10','Accounting','Melbourne'),
    ('20','Research','Adealide'),
    ('30','Sales','Sydney'),
    ('40','Operations','Perth');

insert into Employee(EmpNo,Fname,Lname,Job,HireDate,Salary,Commision,DepartmentNo) values('1','John','Smith','Clerk','17-Dec-1980 ','800','0','20'),
    ('2','Peter','Allen','Salesman','20-Feb-1981 ','1600','300','30'),
    ('3','Kate','Ward','Salesman','22-Feb-1981 ','1250','500','20'),
    ('4','Jack','Jones','Manager','02-Apr-1981 ','2975','0','20'),
    ('5','Joe','Martin','Salesman','28-Sep-1981','1250','1400','30');

select *from Department;
select *from Employee;


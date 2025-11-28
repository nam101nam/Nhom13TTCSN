use master
if(exists (select *from sysdatabases where name='MarkManagement'))
drop database MarkManagement
go
create database MarkManagement 
go
use MarkManagement
go

create table Students(
   StudentID nvarchar(12) not null primary key,
   StudentName nvarchar(25) not null,
   DateofBird datetime not null,
   Email nvarchar(40),
   Phone nvarchar(12),
   Class nvarchar(10)
)

create table Subjects(
   SubjectID nvarchar(10) not null primary key,
   SubjectName nvarchar(25) not null
)

create table Mark(
   StudentID nvarchar(10) not null,
   SubjectID nvarchar(10) not null,
   constraint PK_Mark primary key (StudentID,SubjectID),
   Ngay datetime,
   Theory Tinyint,
   Practical Tinyint,
)

insert into Students(StudentID,StudentName,DateofBird,Email,Phone,Class)values ('AV0807005','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV0807006','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV0807007','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV0807008','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV0807009','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV08070010','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV08070011','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1'),
   ('AV08070012','Mai Trung hieu','11/10/1989','trunghieu@gmail.com','0904115116','AV1');


insert into Subjects(SubjectID,SubjectName) values('S001','SQL'),
   ('S002','Java Simplefield'),
   ('S003','Active Server Page');


insert into Mark(StudentID,SubjectID,Theory,Practical,Ngay) values('AV0807005','S001','8','25','6/5/2008'),
   ('AV0807006','S002','8','25','6/5/2008'),
   ('AV0807007','S003','8','25','6/5/2008'),
   ('AV0807008','S004','8','25','6/5/2008'),
   ('AV0807009','S005','8','25','6/5/2008'),
   ('AV08070010','S006','8','25','6/5/2008'),
   ('AV08070011','S007','8','25','6/5/2008'),
   ('AV08070012','S008','8','25','6/5/2008'),
   ('AV0807005','S009','8','25','6/5/2008');

select *from Students;
select *from Subjects;
select *from Mark;

--in ra 3 cột trên ở trong bảng
select StudentID,StudentName,Email from Students;
-- in ra 3 hàng đầu ở trong bảng
select top 3 *from Students
-- có thẻ lấy một số cột
select top 3  StudentID,StudentName  from Students;
-- in ra 50% thông tin của bảng
select top 50 percent *from Students;
-- sắp xếp dữ liệu trong bảng
--ví dụ đưa ra sắp xếp các sinh viên theo mã sinh viên tăng dần
select *from Students order by StudentID asc;
-- kết quả được xắp xếp theo nhiều trường
select from Students order by StudentID asc, Email desc;
-- oderby rất hay dùng với top N, dưới đây là ví dụ
select top 3 Email from Students order by Email asc;


-- lọc dữ liệu : where
--=,>,>=,<,<=,!=, and ,or ,not
-- ví dụ đầu tiên yêu cầu đưa ra các sinh viên tên Mai Trung hieu
select *from Students where StudentName=N'Mai Trung hieu';
-- ví dụ đưa ra các sinh viên có tên là Mai Trung hieu và có class là AV1
select *from StudentS where StudentName=N'Mai Trung hieu' and Class=N'AV1';



-- Hàm in/Not in:
-- ví dụ đưa ra các sinh  viên quê hà nội , bắc ninh hải dương
-- select *from sinhvien where quequan=in(N'ha noi',N'bac ninh,N'hai duong')
-- tương tự not in


-- between..... and:
-- ví dụ đưa ra các mã sinh viên , mã môn học có điểm thi từ 7-9
-- select masv,mamh from diem where diemthi between 7 and 9 ;



-- like N'% chuỗi%'
-- ví dụ đưa ra các sinh viên có họ nguyễn
--select *from sv where tensv like N'%Nguyen%";




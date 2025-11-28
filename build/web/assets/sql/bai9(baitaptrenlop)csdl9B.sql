use master 
go
--alter database QLSV set single_user with rollback immediate
--go
if(exists (select *from sysdatabases where name='QLSV'))
drop database QLSV
go
create database QLSV
go
use QLSV
go

create table SINHVIEN(
   MASV nvarchar(30) not null primary key,
   HoTen nvarchar(30) ,
   NgaySinh date,
   QueQuan nvarchar(20),
   GTinh nvarchar(200)
)

create table GiaoVien(
   MAGV nvarchar(30) not null primary key,
   HoTen nvarchar(30),
   NamLV int,
   Luong money
)
create table PHANCONG(
   MASV nvarchar(30),
   MAGV nvarchar(30),
   constraint PK primary key(MASV,MAGV),
   Lop varchar(10),
   Phong varchar(10)
)

insert into SINHVIEN(MASV,HoTen,NgaySinh,QueQuan,GTinh) values('SV1',N'Nguyễn Tuấn Vũ','1/5/2003',N'Hà Nội',N'Nam'),
    ('SV2',N'Phạm Huy Linh ','8/3/2004',N'Hà Nam',N'Nam'),
    ('SV3',N'Nguyễn Thị Mai ','5/1/2002',N'Hà Nội',N'Nữ');

insert into GiaoVien( MAGV,HoTen,NamLV,Luong) values('GV1',N'Trần Minh An','2013','60000000'), 
    ('GV2',N'Trần Minh An','2013','60000000'),
    ('GV3',N'Phan Huy Lê','2020','50000000'),
    ('GV4',N'Lê Văn Tuấn ','1999 ','4000000');

insert into PHANCONG(MASV,MAGV,Lop,Phong) values('SV1','GV1','WE183','L301'),
    ('SV2','GV2','WE184','L403'),
    ('SV3','GV3','WE185','L406');
 

select *from SINHVIEN;
select *from GiaoVien;
select *from PHANCONG;

-- đưa ra thông tin mã sinh viên ,họ tên, tuổi của sinh viên quê hà nội
select MASV,HoTen,NgaySinh from SINHVIEN where QueQuan like (N'Hà Nội');
-- đưa ra thông tin: Magv, Hoten,Luong của những giáo viên có năm làm việc trên 10 năm và có họ lê
select MAGV,HoTen,Luong from GiaoVien where NamLV>10 and HoTen LIKE N'Lê%';
-- đưa ra thong tin sinh viên có tuổi cao nhất,hiển thị thông tin gồm có:MaSV,Hoten,GioiTinh
--select top 1 MASV,HoTen, GTinh from SINHVIEN order by NgaySinh asc;
select  MASV,HoTen, GTinh from SINHVIEN where NgaySinh=(select min(NgaySinh) from SINHVIEN);
--đưa ra danh sách 2 sinh viên đầu tiên bao gồm:MaSV,HoTen,GTinh, có quê ở hà nội và xắp xếp tăng dần theo tuổi
select top 2 MASV,HoTen,GTinh from SINHVIEN where QueQuan=N'Hà Nội' order by NgaySinh desc;
-- thêm một bản ghi mới vào phân công,dữ liệu phải phù hợp,không được để giá trị null,
insert into SINHVIEN values('SV4',N'Dương Thúy Hường ','5/7/2002',N'Bắc Giang',N'Nữ');
insert into PHANCONG values ('SV4','GV4','WE186','L407');
-- cập nhật lại phòng học thành 205 cho sinh viên có mã sinh viên là SV3
update PHANCONG set Phong='205' where MASV='SV3';
-- xóa tất cả giáo viên chưa dạy môn nào cả;
delete from GiaoVien where MAGV not in( select MAGV from PHANCONG);
-- Hãy cập nhật lương tăng lên  1000000 cho các  giáo viên đã  hướng dẫn cho sinh viên;
update GiaoVien set Luong=Luong+1000000 where MAGV in(select MAGV from PHANCONG);

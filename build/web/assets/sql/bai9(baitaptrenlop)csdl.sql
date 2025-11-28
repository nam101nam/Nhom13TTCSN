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

insert into SINHVIEN(MASV,HoTen,NgaySinh,QueQuan,GTinh) values('SV1',N'Nguy?n Tu?n V?','1/5/2003',N'Hà N?i',N'Nam'),
    ('SV2',N'Ph?m Huy Linh ','8/3/2004',N'Hà Nam',N'Nam'),
    ('SV3',N'Nguy?n Th? Mai ','5/1/2002',N'Hà N?i',N'N?');

insert into GiaoVien( MAGV,HoTen,NamLV,Luong) values('GV1',N'Tr?n Minh An','2013','60000000'), 
    ('GV2',N'Tr?n Minh An','2013','60000000'),
    ('GV3',N'Phan Huy Lê','2020','50000000'),
    ('GV4',N'Lê V?n Tu?n ','1999 ','4000000');

insert into PHANCONG(MASV,MAGV,Lop,Phong) values('SV1','GV1','WE183','L301'),
    ('SV2','GV2','WE184','L403'),
    ('SV3','GV3','WE185','L406');
 

select *from SINHVIEN;
select *from GiaoVien;
select *from PHANCONG;

-- ??a ra thông tin mã sinh viên ,h? tên, tu?i c?a sinh viên quê hà n?i
select MASV,HoTen,NgaySinh from SINHVIEN where QueQuan like (N'Hà N?i');
-- ??a ra thông tin: Magv, Hoten,Luong c?a nh?ng giáo viên có n?m làm vi?c trên 10 n?m và có h? lê
select MAGV,HoTen,Luong from GiaoVien where NamLV>10 and HoTen LIKE N'Lê%';
-- ??a ra thong tin sinh viên có tu?i cao nh?t,hi?n th? thông tin g?m có:MaSV,Hoten,GioiTinh
--select top 1 MASV,HoTen, GTinh from SINHVIEN order by NgaySinh asc;
select  MASV,HoTen, GTinh from SINHVIEN where NgaySinh=(select min(NgaySinh) from SINHVIEN);
--??a ra danh sách 2 sinh viên ??u tiên bao g?m:MaSV,HoTen,GTinh, có quê ? hà n?i và x?p x?p t?ng d?n theo tu?i
select top 2 MASV,HoTen,GTinh from SINHVIEN where QueQuan=N'Hà N?i' order by NgaySinh desc;
-- thêm m?t b?n ghi m?i vào phân công,d? li?u ph?i phù h?p,không ???c ?? giá tr? null,
insert into SINHVIEN values('SV4',N'D??ng Thúy H??ng ','5/7/2002',N'B?c Giang',N'N?');
insert into PHANCONG values ('SV4','GV4','WE186','L407');
-- c?p nh?t l?i phòng h?c thành 205 cho sinh viên có mã sinh viên là SV3
update PHANCONG set Phong='205' where MASV='SV3';
-- xóa t?t c? giáo viên ch?a d?y môn nào c?;
delete from GiaoVien where MAGV not in( select MAGV from PHANCONG);
-- Hãy c?p nh?t l??ng t?ng lên  1000000 cho các  giáo viên ?ã  h??ng d?n cho sinh viên;
update GiaoVien set Luong=Luong+1000000 where MAGV in(select MAGV from PHANCONG);

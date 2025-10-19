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

insert into SINHVIEN(MASV,HoTen,NgaySinh,QueQuan,GTinh) values('SV1',N'Nguy?n Tu?n V?','1/5/2003',N'H� N?i',N'Nam'),
    ('SV2',N'Ph?m Huy Linh ','8/3/2004',N'H� Nam',N'Nam'),
    ('SV3',N'Nguy?n Th? Mai ','5/1/2002',N'H� N?i',N'N?');

insert into GiaoVien( MAGV,HoTen,NamLV,Luong) values('GV1',N'Tr?n Minh An','2013','60000000'), 
    ('GV2',N'Tr?n Minh An','2013','60000000'),
    ('GV3',N'Phan Huy L�','2020','50000000'),
    ('GV4',N'L� V?n Tu?n ','1999 ','4000000');

insert into PHANCONG(MASV,MAGV,Lop,Phong) values('SV1','GV1','WE183','L301'),
    ('SV2','GV2','WE184','L403'),
    ('SV3','GV3','WE185','L406');
 

select *from SINHVIEN;
select *from GiaoVien;
select *from PHANCONG;

-- ??a ra th�ng tin m� sinh vi�n ,h? t�n, tu?i c?a sinh vi�n qu� h� n?i
select MASV,HoTen,NgaySinh from SINHVIEN where QueQuan like (N'H� N?i');
-- ??a ra th�ng tin: Magv, Hoten,Luong c?a nh?ng gi�o vi�n c� n?m l�m vi?c tr�n 10 n?m v� c� h? l�
select MAGV,HoTen,Luong from GiaoVien where NamLV>10 and HoTen LIKE N'L�%';
-- ??a ra thong tin sinh vi�n c� tu?i cao nh?t,hi?n th? th�ng tin g?m c�:MaSV,Hoten,GioiTinh
--select top 1 MASV,HoTen, GTinh from SINHVIEN order by NgaySinh asc;
select  MASV,HoTen, GTinh from SINHVIEN where NgaySinh=(select min(NgaySinh) from SINHVIEN);
--??a ra danh s�ch 2 sinh vi�n ??u ti�n bao g?m:MaSV,HoTen,GTinh, c� qu� ? h� n?i v� x?p x?p t?ng d?n theo tu?i
select top 2 MASV,HoTen,GTinh from SINHVIEN where QueQuan=N'H� N?i' order by NgaySinh desc;
-- th�m m?t b?n ghi m?i v�o ph�n c�ng,d? li?u ph?i ph� h?p,kh�ng ???c ?? gi� tr? null,
insert into SINHVIEN values('SV4',N'D??ng Th�y H??ng ','5/7/2002',N'B?c Giang',N'N?');
insert into PHANCONG values ('SV4','GV4','WE186','L407');
-- c?p nh?t l?i ph�ng h?c th�nh 205 cho sinh vi�n c� m� sinh vi�n l� SV3
update PHANCONG set Phong='205' where MASV='SV3';
-- x�a t?t c? gi�o vi�n ch?a d?y m�n n�o c?;
delete from GiaoVien where MAGV not in( select MAGV from PHANCONG);
-- H�y c?p nh?t l??ng t?ng l�n  1000000 cho c�c  gi�o vi�n ?�  h??ng d?n cho sinh vi�n;
update GiaoVien set Luong=Luong+1000000 where MAGV in(select MAGV from PHANCONG);

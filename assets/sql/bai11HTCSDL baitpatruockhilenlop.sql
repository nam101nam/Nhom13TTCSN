use master
--alter database THUCTAP set single_user with rollback immediate
go
if(exists(select *from sysdatabases where name='THUCTAP'))
drop database THUCTAP
go
create database THUCTAP
go
use THUCTAP
go

create table Khoa(
   MaKhoa char(10) not null primary key,
   TenKhoa nvarchar(30),
   DienThoai char(10)
)
create table GiangVien(
   MaGV int not null primary key,
   HoTenGV nvarchar(30),
   Luong decimal(5,2),
   MaKhoa char(10),
   constraint FK_GiangVien_Khoa foreign key (MaKhoa)
   references Khoa(MaKhoa)
)

create table SinhVien(
   MaSV int primary key,
   HoTenSV nvarchar(30),
   MaKhoa char(10),
   constraint FK_SinhVien_Khoa foreign key(MaKhoa)
   references Khoa(MaKhoa),
   NamSinh int,
   QueQuan nvarchar(30)
)
create table DeTai(
   MaDT char(10) primary key,
   TenDT nvarchar(30),
   KinhPhi int,
   NoiThucTap nvarchar(30)
)

create table HuongDan(
   MaSV int primary key,
   MaDT char(10),
   constraint FK_HuongDan_DeTai foreign key(MaDT)
   references DeTai(MaDT),
   MaGV int,
   constraint FK_HuongDan_GiangVien foreign key(MaGV)
   references GiangVien(MaGV)
)


insert into Khoa(MaKhoa,TenKhoa,DienThoai)values('K01','TOAN','0123'),
   ('K02','DIA lY','0124'),
   ('K03','CONG NGHE SINH HOC','0125'),
   ('K04','QLTN','0126');


insert into GiangVien(MaGV,HoTenGV,Luong,MaKhoa)values('01','Nguyen Thi a ','234.11','K01'),
   ('02','Nguyen Thi b ','234.22','K02'),
   ('03','Nguyen Thi c ','234.33','K03'),
   ('04','Nguyen Thi d ','234.44','K04');

insert into SinhVien(MaSV,HoTenSV,MaKhoa,NamSinh,QueQuan)values('2023602552','‘Le van son','K01','2005','HaNoi'),
   ('2023602553','‘nguyen van a','K02','2005','NamDinh'),
   ('2023602554','‘Nguyen Van B','K03','2005','BacNinh'),
   ('2023602555','‘Nguyen Manh Dung','K04','2005','BacGiang');

insert into DeTai(MaDT,TenDT,KinhPhi,NoiThucTap) values('DT01','nguyen cuu A','30000','FPT'),
 ('DT02','nguyen cuu B','30000','VinFast'),
 ('DT03','nguyen cuu C','30000','Apple'),
 ('DT04','nguyen cuu D','30000','Samsung');

 insert  into HuongDan(MaSV,MaDT,MaGV) values('2023602552','DT01','01'),
 ('2023602553','DT02','02'),
 ('2023602554','DT03','03'),
 ('2023602555','DT04','04');


 select *from Khoa;
 select *from GiangVien;
 select *from SinhVien;
 select *from DeTai;
 select *from HuongDan;


 --??a ra thông tin g?m mã s?, h? tên và tên khoa c?a t?t c? các gi?ng viên
select MaGV,HoTenGV,MaKhoa from GiangVien;
--??a ra thông tin g?m mã s?, h? tênvà tên khoa c?a các gi?ng viên c?a khoa ‘DIALY va QLTN’
select MaGV,HoTenGV,TenKhoa from GiangVien inner join Khoa on GiangVien.MaKhoa = Khoa.MaKhoa where TenKhoa in(N'DIA LY','QLTN');
-- Cho bi?t s? sinh viên c?a khoa ‘CONG NGHE SINH HOC’
select count(*) as SoLuongSV from SinhVien inner join Khoa on SinhVien.MaKhoa=Khoa.MaKhoa where TenKhoa =(N'CONG NGHE SINH HOC');
--??a ra danh sách g?m mã s?, h? tênvà tu?i c?a các sinh viên khoa ‘TOAN’
select MaSV ,HoTenSV,YEAR(GETDATE()) - NamSinh AS Tuoi from SinhVien inner join Khoa on SinhVien.MaKhoa=Khoa.MaKhoa where TenKhoa=(N'TOAN');
--Cho bi?t s? gi?ng viên c?a khoa ‘CONG NGHE SINH HOC’
select count(*) as SoLuongGV from Khoa inner join GiangVien on Khoa.MaKhoa=GiangVien.MaKhoa where TenKhoa=(N'CONG NGHE SINH HOC');
--6. Cho bi?t thông tin v? sinh viên không tham gia th?c t?p
select *from SinhVien inner join HuongDan on SinhVien.MaSV=HuongDan.MaSV inner join DeTai on DeTai.MaDT=HuongDan.MaDT 
where NoiThucTap not in('FPT','VinFast','Apple','Samsung');
--Cho bi?t s? ?i?n tho?i c?a khoa mà sinh viên có tên ‘Le van son’ ?ang theo h?c
select DienThoai from Khoa inner join SinhVien on Khoa.MaKhoa=SinhVien.MaKhoa where HoTenSV=(N'‘Le Van Son');





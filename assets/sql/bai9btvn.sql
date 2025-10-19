use master 
go
--alter database SINHVIEN set single_user with rollback immediate
if(exists(select *from sysdatabases where name='SINHVIEN'))
drop database SINHVIEN
go
create database SINHVIEN
go
use SINHVIEN
go

create table Khoa(
    MaKhoa char(10) not null primary key,
    Tenkhoa char(30),
    DienThoai char(10)
)
 create table GiangVien(
    MaGV int not null primary key,
    HotenGV char(30),
    Luong decimal(5,2),
    MaKhoa char(10)
    constraint FK_GiangVien_Khoa foreign key (MaKhoa)
    references Khoa(MaKhoa)
)
create table SinhVien(
    MaSV int not null primary key,
    HoTenSV char(30),
    MaKhoa char(10),
    constraint FK_SinhVien_Khoa foreign key(MaKhoa)
    references Khoa(MaKhoa),
    Namsinh int,
    Quequan char(30)
)

insert into Khoa(MaKhoa,Tenkhoa,DienThoai) values('IT01','CNTT','01234'),
    ('IT02','KHMT','01235'),
    ('IT03','KTPM','01236'),
    ('IT04','PTDL','01237');

insert into GiangVien(MaGV,HotenGV,Luong,MaKhoa) values('01','Nguyen Thi A','456.78','IT01'),
    ('02','Nguyen Thi B','456.78','IT02'),
    ('03','Nguyen Thi C','456.78','IT03'),
    ('04','Nguyen Thi D','456.78','IT04');

insert into SinhVien(MaSV,HoTenSV,MaKhoa,Namsinh,Quequan) values('2023602555','Nguyen Manh Dung','IT01','2005','Bac Giang'),
    ('2023602556','Nguyen Van A','IT02','2005','Bac Ninh'),
    ('2023602557','Nguyen Van B','IT03','2005','Ha Noi'),
    ('2023602558','Nguyen Van C','IT04','2005','Ha Nam');

select *from Khoa;
select *from GiangVien;
select *from SinhVien;

-- ??a ra th�ng tin c?a t?t c? c�c sinh vi�n
select *from SinhVien;
-- ??a ra th�ng tin sinh vi�n c� tu?i tr�n 20;
select *from SinhVien where Namsinh<=2005;
-- ??a ra danh s�ch sinh vi�n c� h? nguy?n
select *from SinhVien where HoTenSV like(N'Nguyen%');
-- ??a ra danh s�ch qu� qu�n c?a c�c sinh vi�n kh�ng tr�ng nhau
select distinct Quequan from SinhVien;
--??a ra th�ng  tin t?t c? c�c gi�o vi�n c� l??ng t? 10 tri?u ??n 20 tri?u
select *from GiangVien where Luong between 10000000 and 20000000;
-- ??a ra th�ng tin sinh vi�n s?p x?p theo chi?u t?ng d?n c?a n?m sinh
select *from SinhVien order by Namsinh asc;
-- ??a ra th�ng tin 2 sinh vi�n l?n tu?i nh?t
select top 2 *from SinhVien order by Namsinh asc;
-- select ....... from SinhVien where Namsinh=(select Min(Namsinh) from SinhVien);
-- ??a ra 30%  th�ng tin gi?ng vi�n c� l??ng cao nh?t
select top 30 percent *from GiangVien order by Luong desc;
-- ??a ra danh s�ch c�c sinh vi�n kh�ng c� qu� ? h� n?i ,b?c giang l?ng s?n
select *from SinhVien where Quequan Not in('Ha Noi','Bac Giang','Lang Son');
-- ??a ra th�ng tin 2 gi?ng vi�n c� l??ng th?p nh?t
select top 2 *from GiangVien order by Luong asc;
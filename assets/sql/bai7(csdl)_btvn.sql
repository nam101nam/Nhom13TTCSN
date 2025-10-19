

use master
go

create database QLBanHang

use QLBanHang

create table CongTy(
	MaCT Nchar(10) primary key,
	TenCT Nvarchar(20),
	TrangThai Nvarchar(20),
	ThanhPho Nvarchar(20)
)

create table SanPham(
	MaSP Nchar(10) primary key, 
	TenSP Nvarchar(50) unique,
	MauSac Nvarchar(20) default N'Đỏ',
	SoLuongCo int,
	constraint hehe check (SoLuongCo > 0)
)

create table Cungung(
	MaCT Nchar(10),
	MaSP Nchar(10), 
	SoLuongBan int,
	constraint PK primary key(MaCT, MaSP),
	constraint FK1 foreign key(MacT) references CongTy(MaCT),
	constraint FK2 foreign key(MaSP) references SanPham(MaSP),
	constraint hehehe check (SoLuongBan > 0)
)

--nhap 3 cong ty, 3 sp , 6 cung ung

insert into CongTy (MaCT, TenCT, TrangThai, ThanhPho) values
(N'CT001', N'Công ty A', N'Hoạt động', N'Hà Nội'),
(N'CT002', N'Công ty B', N'Hoạt động', N'TP.HCM'),
(N'CT003', N'Công ty C', N'Tạm nghỉ', N'Đà Nẵng')

insert into SanPham (MaSP, TenSP, MauSac, SoLuongCo) values
(N'SP001', N'Laptop Dell', N'Đen', 50),
(N'SP002', N'Điện thoại iPhone', N'Đỏ', 100),
(N'SP003', N'Máy tính bảng Samsung', N'Trắng', 30)

insert into Cungung (MaCT, MaSP, SoLuongBan) values
(N'CT001', N'SP001', 10), -- Công ty A cung ứng 10 Laptop Dell
(N'CT001', N'SP002', 20), -- Công ty A cung ứng 20 iPhone
(N'CT002', N'SP001', 15), -- Công ty B cung ứng 15 Laptop Dell
(N'CT002', N'SP003', 25), -- Công ty B cung ứng 25 Máy tính bảng Samsung
(N'CT003', N'SP002', 30), -- Công ty C cung ứng 30 iPhone
(N'CT003', N'SP003', 10)  -- Công ty C cung ứng 10 Máy tính bảng Samsung

select * from CongTy
select * from SanPham
select * from Cungung
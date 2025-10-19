

use master
go

create database QLSinhVien

use QLSinhVien

create table SV(
	MaSV Nchar(10) primary key,
	TenSV Nvarchar(30),
	Que Nvarchar(20)
)

create table MON(
	MaMH Nchar(10) primary key, 
	TenMH Nvarchar(50) unique,
	Sotc int default 3,
	constraint hehe check (sotc >= 2 and sotc <= 5)
)

create table KQ(
	MaSV Nchar(10),
	MaMH Nchar(10), 
	Diem decimal(4, 2),
	constraint PK primary key(MaSV, MaMH),
	constraint FK1 foreign key(MaSV) references SV(MaSV),
	constraint FK2 foreign key(MaMH) references MON(MaMH),
	constraint hehehe check (Diem >= 0 and Diem <= 10)
)

--nhap 3 sv, 3 mh , 6 kq

insert into SV (MaSV, TenSV, Que) values
(N'SV001', N'Nguyễn Văn A', N'Hà Nội'),
(N'SV002', N'Trần Thị Bình', N'TP.HCM'),
(N'SV003', N'Lê Minh Châu', N'Đà Nẵng')

insert into MON (MaMH, TenMH, Sotc) values
(N'MH001', N'Toán Cao Cấp', 3),
(N'MH002', N'Lập Trình C', 4),
(N'MH003', N'Cơ Sở Dữ Liệu', 3)

insert into KQ (MaSV, MaMH, Diem) values
(N'SV001', N'MH001', 8.50), -- An, Toán Cao Cấp, 8.50
(N'SV001', N'MH002', 7.75), -- An, Lập Trình C, 7.75
(N'SV002', N'MH001', 9.00), -- Bình, Toán Cao Cấp, 9.00
(N'SV002', N'MH003', 6.50), -- Bình, Cơ Sở Dữ Liệu, 6.50
(N'SV003', N'MH002', 8.25), -- Châu, Lập Trình C, 8.25
(N'SV003', N'MH003', 7.00)  -- Châu, Cơ Sở Dữ Liệu, 7.00

select * from SV
select * from MON
select * from KQ
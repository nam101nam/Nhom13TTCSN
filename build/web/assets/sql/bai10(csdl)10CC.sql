use master
--alter database QLBanHang set single_user with rollback immediate
go
if(exists (select *from sysdatabases where name='QLBanHang'))
drop database QLBanHang
go
create database QLBanHang
go
use QLBanHang
go

 create table HangSX(
     MaHangSX nvarchar(20) primary key,
     TenHang nvarchar(20),
     DiaChi nvarchar(20),
     SoDT int,
     Email nvarchar(20)
 )
create table SanPham(
     MaSP nvarchar(20) not null primary key,
     MaHangSX nvarchar(20),
     constraint FK_SanPham_HangSX foreign key(MaHangSX)
     references HangSX(MaHangSX),
     TenSP nvarchar(20),
     SoLuong int,
     MauSac char(10),
     GiaBan money,
     DonViTinh char(10),
     MoTa char(20)
)
create table NhanVien(
      MaNV nvarchar(30) not null primary key,
      TenNV nvarchar(30),
      GioiTinh nvarchar(30),
      DiaChi nvarchar(20),
      SoDT int,
      Email nvarchar(20),
      TenPhong nvarchar(20)
)
create table PNhap(
       SoHDN nvarchar(30) primary key,
       NgayNhap date,
       MaNV nvarchar(30),
       constraint FK_PNhap_NhanVien foreign key(MaNV)
       references NhanVien(MaNV)
)
create table Nhap(
       SoHDN nvarchar(30),
       MaSP nvarchar(20),
       constraint PK primary key(SoHDN,MaSP),
       SoLuongN int,
       DonGiaN money,
       constraint FK_Nhap_PNhap foreign key(SoHDN)
       references PNhap(SoHDN),
       constraint FK_Nhap_SanPham foreign key(MaSP)
       references SanPham(MaSP)
)
create table Pxuat(
       SoHDX nvarchar(30) primary  key,
       NgayXuat date,
       MaNV nvarchar(30),
       constraint FK_PXuat_NhanVien foreign key(MaNV)
       references NhanVien(MaNV)
)

create table Xuat(
       SoHDX nvarchar(30),
       MaSP nvarchar(20),
       SoLuongX int,
       constraint FK_Xuat_PXuat foreign key(SoHDX)
       references PXuat(SoHDX),
       constraint FK_Xuat_SanPham foreign key(MaSP)
       references SanPham(MaSP)
)

insert into HangSX(MaHangSX, TenHang, DiaChi, SoDT, Email) values
('H01', N'Samsung', N'Hà N?i', 0241234567, 'contact@samsung.com'),
('H02', N'Apple', N'H? Chí Minh', 0289876543, 'info@apple.com'),
('H03', N'Sony', N'?à N?ng', 0236123456, 'support@sony.com');

insert into SanPham(MaSP, MaHangSX, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa) values
('SP01', 'H01', N'Galaxy S', 100, '?en', 20000000, 'Chi?c', '?i?n tho?i Samsung'),
('SP02', 'H01', N'Tivi QLED', 50, '?en', 15000000, 'Chi?c', 'Tivi 55 inch'),
('SP03', 'H02', N'iPhone 15', 30, '??', 25000000, 'Chi?c', '?i?n tho?i m?i'),
('SP04', 'H03', N'Tai nghe WH-1000XM4', 100, '?en', 7000000, 'Chi?c', 'Tai nghe ch?ng ?n');

insert into NhanVien(MaNV, TenNV, GioiTinh, DiaChi, SoDT, Email, TenPhong) values
('NV01', N'Nguy?n V?n A', N'Nam', N'Hà N?i', 0912345678, 'vana@gmail.com', N'Bán hàng'),
('NV02', N'Tr?n Th? B', N'N?', N'H? Chí Minh', 0934567890, 'thib@gmail.com', N'Kho'),
('NV03', N'Lê V?n C', N'Nam', N'?à N?ng', 0987654321, 'vanc@gmail.com', N'K? toán');

-- Phi?u nh?p
insert into PNhap(SoHDN, NgayNhap, MaNV) values
('HDN01', '2019-05-10', 'NV01'), -- ?? test top 10 s? l??ng 2019
('HDN02', '2019-07-20', 'NV01'),
('HDN03', '2020-02-01', 'NV02');

-- Nh?p chi ti?t
insert into Nhap(SoHDN, MaSP, SoLuongN, DonGiaN) values
('HDN01', 'SP01', 500, 18000000), -- Galaxy S nhi?u nh?t
('HDN01', 'SP02', 400, 14000000),
('HDN02', 'SP03', 300, 24000000),
('HDN02', 'SP04', 200, 6500000),
('HDN03', 'SP02', 50, 14500000); -- cho truy v?n MaSP=SP02 nhân viên NV02

-- Phi?u xu?t
insert into PXuat(SoHDX, NgayXuat, MaNV) values
('HDX01', '2020-02-03', 'NV02'), -- SP02 xu?t ngày 03/02/2020
('HDX02', '2023-06-15', 'NV01'), -- Galaxy S xu?t n?m 2023
('HDX03', '2023-02-03', 'NV03'); -- SP04 xu?t ngày 3/2/2023

-- Xu?t chi ti?t
insert into Xuat(SoHDX, MaSP, SoLuongX) values
('HDX01', 'SP02', 10),
('HDX02', 'SP01', 5),
('HDX03', 'SP04', 8);



 select *from HangSX;
 select *from SanPham;
 select *from NhanVien;
 select *from PNhap;
 select *from Nhap;
 select *from PXuat;
 select *from Xuat;



 --??a ra 10 m?t hàng có SoLuongN nhi?u nh?t trong n?m 2019
 SELECT TOP 10 n.MaSP, sp.TenSP, n.SoLuongN, pn.NgayNhap
FROM Nhap n
JOIN PNhap pn ON n.SoHDN = pn.SoHDN
JOIN SanPham sp ON n.MaSP = sp.MaSP
WHERE YEAR(pn.NgayNhap) = 2019
ORDER BY n.SoLuongN DESC;
 --??a ra MaSP,TenSP c?a các s?n ph?m do công ty ‘Samsung’ s?n xu?t do nhân viêncó mã ‘NV01’ nh?p.
 SELECT DISTINCT sp.MaSP, sp.TenSP
FROM Nhap n
JOIN PNhap pn ON n.SoHDN = pn.SoHDN
JOIN SanPham sp ON n.MaSP = sp.MaSP
JOIN HangSX hs ON sp.MaHangSX = hs.MaHangSX
WHERE hs.TenHang = N'Samsung'
  AND pn.MaNV = 'NV01';
 ---??a ra SoHDN,MaSP,SoLuongN,ngayN c?a m?t hàng có MaSP là ‘SP02’, ???c nhânviên ‘NV02’ xu?t.
 SELECT DISTINCT n.SoHDN, n.MaSP, n.SoLuongN, pn.NgayNhap
FROM Nhap n
JOIN PNhap pn ON n.SoHDN = pn.SoHDN
JOIN Xuat x ON n.MaSP = x.MaSP
JOIN PXuat px ON x.SoHDX = px.SoHDX
WHERE n.MaSP = 'SP02'
  AND px.MaNV = 'NV02';
-- ??a ra MaNV,TenNV ?ã xu?t m?t hàng có mã ‘SP02’ ngày ‘03-02-2020’
SELECT DISTINCT nv.MaNV, nv.TenNV
FROM NhanVien nv
JOIN PXuat px ON nv.MaNV = px.MaNV
JOIN Xuat x ON px.SoHDX = x.SoHDX
WHERE x.MaSP = 'SP02'
  AND px.NgayXuat = '2020-02-03';
 --??a ra Các s?n ph?m do hãng SamSung s?n xu?t
 SELECT sp.*
FROM SanPham sp
JOIN HangSX hs ON sp.MaHangSX = hs.MaHangSX
WHERE hs.TenHang = N'Samsung';
 --??a ra Nhân viên ?ã xu?t s?n ph?m “Galaxy S” trong n?m 2023
 SELECT DISTINCT nv.MaNV, nv.TenNV
FROM NhanVien nv
JOIN PXuat px ON nv.MaNV = px.MaNV
JOIN Xuat x ON px.SoHDX = x.SoHDX
JOIN SanPham sp ON x.MaSP = sp.MaSP
WHERE sp.TenSP = N'Galaxy S' AND YEAR(px.NgayXuat) = 2023;
 --??a ra thông tin s?n ph?m ???c xu?t ngày “3/2/2023”
 SELECT sp.*
FROM SanPham sp
JOIN Xuat x ON sp.MaSP = x.MaSP
JOIN PXuat px ON x.SoHDX = px.SoHDX
WHERE px.NgayXuat = '2023-02-03';
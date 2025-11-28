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
('SP01', 'H01', N'Tivi QLED', 50, '?en', 15000000, 'Chi?c', 'Tivi 55 inch'),
('SP02', 'H02', N'iPhone 15', 30, '??', 25000000, 'Chi?c', '?i?n tho?i m?i'),
('SP03', 'H03', N'Tai nghe WH-1000XM4', 100, '?en', 7000000, 'Chi?c', 'Tai nghe ch?ng ?n');


insert into NhanVien(MaNV, TenNV, GioiTinh, DiaChi, SoDT, Email, TenPhong) values
('NV01', N'Nguy?n V?n A', N'Nam', N'Hà N?i', 0912345678, 'vana@gmail.com', N'Bán hàng'),
('NV02', N'Tr?n Th? B', N'N?', N'H? Chí Minh', 0934567890, 'thib@gmail.com', N'Kho'),
('NV03', N'Lê V?n C', N'Nam', N'?à N?ng', 0987654321, 'vanc@gmail.com', N'K? toán');


insert into PNhap(SoHDN, NgayNhap, MaNV) values
('HDN01', '2025-08-01', 'NV02'),
('HDN02', '2025-08-02', 'NV02');


insert into Nhap(SoHDN, MaSP, SoLuongN, DonGiaN) values
('HDN01', 'SP01', 10, 14000000),
('HDN01', 'SP02', 5, 24000000),
('HDN02', 'SP03', 20, 6500000);


insert into PXuat(SoHDX, NgayXuat, MaNV) values
('HDX01', '2025-08-05', 'NV01'),
('HDX02', '2025-08-06', 'NV03');


insert into Xuat(SoHDX, MaSP, SoLuongX) values
('HDX01', 'SP01', 3),
('HDX01', 'SP02', 2),
('HDX02', 'SP03', 5);


 select *from HangSX;
 select *from SanPham;
 select *from NhanVien;
 select *from PNhap;
 select *from Nhap;
 select *from PXuat;
 select *from Xuat;

-- ??a ra thông tin các s?n ph?m có màu ??
select *from SanPham where MauSac like('??'),
-- ??a ra thong tin 2 s?n ph?m có giá bán l?n nh?t
select top 2 from SanPham order by GiaBan desc;
-- ??a ra thông tin phi?u nh?p có n?m nh?p là 2021
select *from PNhap where year(NgayNhap)=2021;
--??a ra danh sách  các tên t?nh c?a các nhân viên không trùng nhau
select


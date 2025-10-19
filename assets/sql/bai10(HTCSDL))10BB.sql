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
('H01', N'Samsung', N'Hà Nội', 0241234567, 'contact@samsung.com'),
('H02', N'Apple', N'Hồ Chí Minh', 0289876543, 'info@apple.com'),
('H03', N'Sony', N'Đà Nẵng', 0236123456, 'support@sony.com');


insert into SanPham(MaSP, MaHangSX, TenSP, SoLuong, MauSac, GiaBan, DonViTinh, MoTa) values
('SP01', 'H01', N'Tivi QLED', 50, 'Đen', 15000000, 'Chiếc', 'Tivi 55 inch'),
('SP02', 'H02', N'iPhone 15', 30, 'Đỏ', 25000000, 'Chiếc', 'Điện thoại mới'),
('SP03', 'H03', N'Tai nghe WH-1000XM4', 100, 'Đen', 7000000, 'Chiếc', 'Tai nghe chống ồn');


insert into NhanVien(MaNV, TenNV, GioiTinh, DiaChi, SoDT, Email, TenPhong) values
('NV01', N'Nguyễn Văn A', N'Nam', N'Hà Nội', 0912345678, 'vana@gmail.com', N'Bán hàng'),
('NV02', N'Trần Thị B', N'Nữ', N'Hồ Chí Minh', 0934567890, 'thib@gmail.com', N'Kho'),
('NV03', N'Lê Văn C', N'Nam', N'Đà Nẵng', 0987654321, 'vanc@gmail.com', N'Kế toán');


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

-- đưa ra thông tin các sản phảm có màu đỏ
select *from SanPham where MauSac like('Đỏ');
-- đưa ra thong tin 2 sản phẩm có giá bán lớn nhất
select top 2 *from SanPham order by GiaBan desc;
-- đưa ra thông tin phiếu nhập có năm nhập là 2021
select *from PNhap where year(NgayNhap)=2021;
--đưa ra danh sách  các tên tỉnh của các nhân viên không trùng nhau
SELECT DISTINCT DiaChi FROM NhanVien;
-- đưa ra 3 sản phẩm màu xanh có số lượng nhỏ nhất
select  top 3 *from SanPham where MauSac='Xanh'  order by SoLuong asc ;
-- đưa ra các nhân viên phòng kế toán
select *from NhanVien where TenPhong like('Kế Toán');
---- đưa ra 3 sản phẩm màu xanh có số lượng nhỏ nhất
select  top 3 *from SanPham where MauSac='Xanh'  order by SoLuong asc ;
--Đưa ra các sản phẩm có giá bán từ 1000000 đến 10000000.
select *from SanPham where GiaBan between 1000000 and 10000000;
--Đưa ra thông tin nhân viên bao gồm MaNV, Họ nhân viên, Tên đệm và tên
--nhân viên, giới tính, địa chỉ, số điện thoại, email, tên phòng
select *from NhanVien;
--Đưa ra SoHDN, ngày nhập, tháng nhập, năm nhập của các PNhap
-- j. SoHDX, ngày xuất, tháng xuất, năm xuất của các PXuatp
select
    SoHDX,
    DAY(NgayXuat) AS NgayXuat,
    MONTH(NgayXuat) AS ThangXuat,
    YEAR(NgayXuat) AS NamXuat
FROM PXuat;

-- k. Tất cả nhân viên có họ 'Nguyễn'
SELECT * 
FROM NhanVien
WHERE TenNV LIKE N'Nguyễn%';

-- l. Tất cả sản phẩm có chữ 'Flus' trong tên
SELECT *
FROM SanPham
WHERE TenSP LIKE N'%Flus%';

-- m. Sản phẩm sắp xếp giá bán giảm dần, số lượng tăng dần
SELECT *
FROM SanPham
ORDER BY GiaBan DESC, SoLuong ASC;

-- n. Thông tin sản phẩm trên 1 dòng định dạng
SELECT 
    'Mã sản phẩm: ' + MaSP + 
    ', Tên sản phẩm: ' + TenSP + 
    ', Số lượng: ' + CAST(SoLuong AS nvarchar) +
    ', Màu sắc: ' + MauSac +
    ', Giá bán: ' + CAST(GiaBan AS nvarchar) AS ThongTinSanPham
FROM SanPham;

-- o. Sản phẩm có số lượng lớn nhất
SELECT *
FROM SanPham
WHERE SoLuong = (SELECT MAX(SoLuong) FROM SanPham);

-- p. Sản phẩm có giá bán nhỏ nhất
SELECT *
FROM SanPham
WHERE GiaBan = (SELECT MIN(GiaBan) FROM SanPham);

-- q. Nhân viên tên 'Tuấn Anh' ở phòng 'Tổ chức'
SELECT *
FROM NhanVien
WHERE TenNV = N'Tuấn Anh' AND TenPhong = N'Tổ chức';

-- r. Thông tin PXuat tháng 9, năm 2021
SELECT SoHDX, NgayXuat, MaNV
FROM PXuat
WHERE MONTH(NgayXuat) = 9 AND YEAR(NgayXuat) = 2021;

-- s. Thông tin NhanVien (TenNV in hoa, DiaChi in thường)
SELECT 
    MaNV,
    UPPER(TenNV) AS TenNV,
    GioiTinh,
    LOWER(DiaChi) AS DiaChi,
    SoDT,
    Email,
    TenPhong
FROM NhanVien;


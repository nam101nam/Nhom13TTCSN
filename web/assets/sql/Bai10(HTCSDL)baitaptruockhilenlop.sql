use master
go 
--alter database QLBanHang set single_user with rollback immediate
if(exists(select *from sysdatabases where name='QLBanHang'))
drop database QLBanHang
go
create database QLBanHang
go
use QLBanHang
go

create table HangSX(
    MaHangSX nvarchar(20) not null primary key,
    TenHang nvarchar(20),
    DiaChi nvarchar(20),
    SoDT int,
    Email nvarchar(20)
)

create table SanPham(
    MaSP nvarchar(20) not null primary key,
    MaHangSX nvarchar(20),
    TenSP nvarchar(30),
    SoLuong int,
    MauSac nvarchar(10),
    GiaBan int,
    DonViTinh nvarchar(20),
    MoTa nvarchar(20)
    constraint FK_SanPham_HangSX foreign key(MaHangSX)
    references HangSX(MaHangSX)
 )



create table NhanVien(
    MaNV nvarchar(30) not null primary key,
    TenNV nvarchar(30),
    GioiTinh nvarchar(10),
    DiaChi nvarchar(20),
    SoDT int,
    Email nvarchar (20),
    TenPhong nvarchar(20)
)
create table PNhap(
    SoHDN nvarchar(20) not null primary key,
    NgayNhap date,
    MaNV nvarchar(30),
    constraint FK_PNhap_NhanVien foreign key(MaNV)
    references NhanVien(MaNV)
)
 create table Nhap(
    SoHDN nvarchar(20),
    MaSP nvarchar(20),
    constraint PK primary key(SoHDN,MaSP),
    constraint FK_Nhap_PNhap foreign key(SoHDN)
    references PNhap(SoHDN),
    constraint FK_Nhap_SanPham foreign key(MaSP)
    references SanPham(MaSP),
    SoLuongN int,
    DonGiaN int
)
create table PXuat(
    SoHDX nvarchar(20) not null primary key,
    NgayXuat date,
    MaNV nvarchar(30),
    constraint FK_PXuat_NhanVien foreign key(MaNV)
    references NhanVien(MaNV)
)
create table Xuat(
    SoHDX nvarchar(20),
    MaSP nvarchar(20),
    SoLuongX int,
    constraint PK_Xuat primary key(SoHDX, MaSP),
    constraint FK_Xuat_PXuat foreign key(SoHDX) references PXuat(SoHDX),
    constraint FK_Xuat_SanPham foreign key(MaSP) references SanPham(MaSP)
)


insert into HangSX(MaHangSX,TenHang,DiaChi,SoDT,Email) values('HSX01','Vin','HaNoi','012341','Vin@gmail.com'),
     ('HSX02','Apple','HaNam','012341','Apple@gmail.com'),
     ('HSX03','Samsung','HaiPhong','012341','Samsung@gmail.com'),
     ('HSX04','Xaomi','BacGiang','012341','Xaomi@gmail.com');

insert into SanPham(MaSP,MaHangSX,TenSP,SoLuong,MauSac,GiaBan,DonViTinh,MoTa) values('SP01','HSX01','A','1','xanh','10000','dong','caocap'),
    ('SP02','HSX02','A','2','xanh','20000','dong','caocap'),
    ('SP03','HSX03','A','3','xanh','30000','dong','caocap'),
    ('SP04','HSX04','A','4','xanh','40000','dong','caocap');
 
insert into NhanVien(MaNV,TenNV,GioiTinh,DiaChi,SoDT,Email,TenPhong)values ('NV01','Nguyen van A','Nam','HaNoi','0120121','A@gmail.com','PhongKinhDoanh'),
     ('NV02','Nguyen van A','Nam','HaNoi','0120121','A@gmail.com','PhongKinhDoanh'),
     ('NV03','Nguyen van B','Nam','BacNinh','0120121','B@gmail.com','PhongKeToan'),
     ('NV04','Nguyen thi C','Nu','NamDinh','0120121','C@gmail.com','PhongTaiChinh');
 
insert into PNhap(SoHDN,NgayNhap,MaNV)values('N01','2002-02-02','NV01'),
     ('N02','2002-02-04','NV02'),
     ('N03','2002-02-06','NV03'),
     ('N04','2002-02-28','NV04');

insert into Nhap(SoHDN,MaSP,SoLuongN,DonGiaN) values('N01','SP01','1','10000'),
     ('N02','SP02','2','20000'),
     ('N03','SP03','3','30000'),
     ('N04','SP04','4','40000');

insert into PXuat(SoHDX,NgayXuat,MaNV)values('X01','2002-02-03','NV01'),
     ('X02','2002-02-05','NV02'),
     ('X03','2002-02-07','NV03'),
     ('X04','2002-03-01','NV04');

insert into Xuat(SoHDX,MaSP,SoLuongX) values('X01','SP01','1'),
     ('X02','SP02','2'),
     ('X03','SP03','3'),
     ('X04','SP04','4');
 
 --Hiển thị thông tin các bảng dữ liệu trên.

 select *from HangSX;
 select *from SanPham;
 select *from NhanVien;
 select *from PNhap;
 select *from Nhap;
 select *from PXuat;
 select *from Xuat;

-- Đưa ra thông tin MaSP, TenSP,SoLuong, MauSac, GiaBan, DonViTinh, MoTa của các sản phẩm sắp xếp theo chiều giảm dần giá bán.
select *from SanPham order by GiaBan desc;
--Đưa ra thông tin 2 sản phẩm có giá bán thấp nhất.
select top 2 *from SanPham order by GiaBan asc;
--Đưa ra các hãng sản xuất có địa chỉ ở Hà Nội
select *from HangSX where DiaChi in('HaNoi');
--Đưa ra thông tin các sản phẩm có số lượng sắp xếp từ thấp đến cao
select *from SanPham order by SoLuong asc;


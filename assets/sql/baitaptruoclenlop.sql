use master  
if(exists (select*from sysdatabases where name='QLBanHang'))
drop database QLBanHang
go
create database QLBanHang
go 
use QLBanHang
go 

create table HangSX(
     MaHangSX nchar(10) not null primary key,
     TenHang nvarchar(20) not null,
     DiaChi nvarchar(20),
     SDT nvarchar(20),
     Email nvarchar(30),
)
create table NhanVien(
     MaNV nvarchar(10) not null primary key,
     TenNV nvarchar(30) not null,
     GioiTinh nvarchar(30) not null,
     DiaChi nchar(20),
     SoDT nchar(20),
     Email nvarchar(30),
     TenPhong nvarchar(20)
)
create table SanPham(
      MaSP nchar(10) not null primary key,
      MaHangSX nchar(10) not null,
      TenSP nvarchar(20) not null,
      SoLuong int,
      MauSac nchar(10),
      GiaBan money,
      DonViTinh nchar(10),
      MoTa ntext,
      constraint FK_SP_HSX foreign key(MaHangSX)
      references HangSX(MaHangSX)
)
create table PNhap(
    SoHDN nchar(10) not null primary key,
    NgayNhap Date,
    MaNV nchar(10),
    constraint FK_PN_NV foreign key(MaNV)
    references NhanVien(MaNV)
)
create table Nhap(
    SoHDN nchar(10) not null ,
    MaSP nchar(10)  not null ,
    SoLuongN int,
    DonGiaN money,
    constraint PK_Nhap primary key (SoHDN, MaSP),
    constraint FK_Nhap_PN foreign key(SoHDN)
    references PNhap(SoHDN),
    constraint FK_Nhap_SP foreign key(MaSP)
    references SanPham(MaSP)
)
create table PXuat(
    SoHDX nchar(10) not null primary key,
    NgayXuat date,
    MaNV nchar(10),
    constraint FK_PX_NV foreign key(MaNV)
    references NhanVien(MaNV)
)
create table Xuat(
     SoHDX nchar(10) not null,
     MaSP nchar(10) not null ,
     SoLuongX int,
     constraint PK_Xuat primary key(SoHDX,MaSP),
     constraint FK_X_PX foreign key(SoHDX)
     references PXuat(SoHDX),
     constraint FK_X_SP foreign key (MaSP)
     references SanPham(MaSP)
)
insert into HangSX(MaHangSX,TenHang,DiaChi,SDT,Email) values('H04','SamSung','koera','0127875837','ss@gmail.com'),
      ('H06','OPPO ','china','081-08626262','ss@gmail.com'),
      ('H09','Vinfone','VietNam','084-098262626','ss@gmail.com');
select *from HangSX;

insert into NhanVien(MaNV,TenNV,GioiTinh,DiaChi,SoDT,Email,TenPhong) values('NV01','NguyễnThị Thu','Nữ','Hà Nội','0982626521','thu@gmail.com','Kếtoán'),
      ('NV04','NguyễnThị Thu','Nữ','Hà Nội','0982626521','thu@gmail.com','Kếtoán'),
      ('NV02','Lê Văn nam','Nam','Bắc Ninh','0972525252','nam@gmail.com','vật tư'),
      ('NV06',' Trần Hòa Bình','Nữ','Hà Nội','0328388388','hb@gmail.com','Kếtoán');
select *from NhanVien;

insert into SanPham(MaSP,MaHangSX,TenSP,SoLuong,MauSac,GiaBan,DonViTinh,MoTa) values('SP01','H02','F1plus','100','Xam','7000000','chiếc','Hàng cận cao cấp'),
      ('SP02','H01','Galaxy nỏte11','50','đỏ','7000000','chiếc','Hàng  cao cấp'),
      ('SP03','H02','F3 lite','200','Nâu','1000000','chiếc','Hàng phổ thông'),
      ('SP04','H03','Vjoy3','200','Xám','3000000','chiếc','Hàng phổ thông'),
      ('SP05','H01','Galaxy v21','500','Nâu','8000000','chiếc','Hàng cận cao cấp');
select *from SanPham;

insert into PNhap(SoHDN,NgayNhap,MaNV) values('N01','02-05-2019','NV01'),
      ('N02','02-05-2019','NV01'),
      ('N03','04-07-2020','NV01'),
      ('N04','02-05-2019','NV01'),
      ('N05','02-05-2019','NV01');
select *from PNhap;

insert into Nhap(SoHDN,MaSP,SoLuongN,DonGiaN) values('N01','SP02','10','17000000'),
      ('N02','SP02','30','800000'),
      ('N03','SP02','20','600000'),
      ('N04','SP02','10','1000000'),
      ('N05','SP02','20','2000000');
select *from Nhap;

insert into PXuat(SoHDX,MaNV) values('X01','06-14-2020','NV02'),
      ('X01','06-14-2020','NV02'),
      ('X01','06-14-2020','NV02'),
      ('X01','06-14-2020','NV02'),
      ('X01','06-14-2020','NV02');
select *from PXuat;

insert into Xuat(SoHDX,MaSP,SoLuongX) values ('X01','SP03','5'),
      ('X01','SP03','5'),
      ('X01','SP03','5'),
      ('X01','SP03','5'),
      ('X01','SP03','5'),
      ('X01','SP03','5');
select *from Xuat;


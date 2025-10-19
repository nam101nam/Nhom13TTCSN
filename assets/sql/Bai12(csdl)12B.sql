use master;
alter database QLBanHang set single_user with rollback immediate
go
if(exists(select * from sysdatabases where name='QLBanHang'))
    drop database QLBanHang;
go
create database QLBanHang;
go
use QLBanHang;
go

-- t?o b?ng
create table hangsx(
    mahangsx nvarchar(20) not null primary key,
    tenhang nvarchar(20),
    diachi nvarchar(20),
    sodt nvarchar(20),
    email nvarchar(50)
);

create table sanpham(
    masp nvarchar(20) not null primary key,
    mahangsx nvarchar(20),
    tensp nvarchar(30),
    soluong int,
    mausac nvarchar(10),
    giaban int,
    donvitinh nvarchar(20),
    mota nvarchar(50),
    constraint fk_sanpham_hangsx foreign key(mahangsx) references hangsx(mahangsx)
);

create table nhanvien(
    manv nvarchar(30) not null primary key,
    tennv nvarchar(30),
    gioitinh nvarchar(10),
    diachi nvarchar(20),
    sodt nvarchar(20),
    email nvarchar(50),
    tenphong nvarchar(20)
);

create table pnhap(
    sohdn nvarchar(20) not null primary key,
    ngaynhap date,
    manv nvarchar(30),
    constraint fk_pnhap_nhanvien foreign key(manv) references nhanvien(manv)
);

create table nhap(
    sohdn nvarchar(20),
    masp nvarchar(20),
    soluongn int,
    dongian int,
    constraint pk_nhap primary key(sohdn, masp),
    constraint fk_nhap_pnhap foreign key(sohdn) references pnhap(sohdn),
    constraint fk_nhap_sanpham foreign key(masp) references sanpham(masp)
);

create table pxuat(
    sohdx nvarchar(20) not null primary key,
    ngayxuat date,
    manv nvarchar(30),
    constraint fk_pxuat_nhanvien foreign key(manv) references nhanvien(manv)
);

create table xuat(
    sohdx nvarchar(20),
    masp nvarchar(20),
    soluongx int,
    constraint pk_xuat primary key(sohdx, masp),
    constraint fk_xuat_pxuat foreign key(sohdx) references pxuat(sohdx),
    constraint fk_xuat_sanpham foreign key(masp) references sanpham(masp)
);

insert into hangsx values
('hsx01','vin','hanoi','012341','vin@gmail.com'),
('hsx02','apple','hanam','012342','apple@gmail.com'),
('hsx03','samsung','haiphong','012343','samsung@gmail.com'),
('hsx04','xiaomi','bacgiang','012344','xiaomi@gmail.com');


insert into sanpham values
('sp01','hsx01','vinfast a1',10,'xanh',150000,'chi?c','cao c?p'),
('sp02','hsx02','iphone 13',15,'tr?ng',200000,'chi?c','m?i'),
('sp03','hsx03','galaxy s7',20,'?en',300000,'chi?c','b?n qu?c t?'),
('sp04','hsx04','redmi note',25,'xanh',250000,'chi?c','b?n pro'),
('sp05','hsx03','galaxy note 10',30,'b?c',500000,'chi?c','b?n cao c?p'),
('sp06','hsx03','galaxy s21',5,'xanh',450000,'chi?c','b?n th??ng');


insert into nhanvien values
('nv01','nguy?n v?n a','nam','hanoi','0120121','a@gmail.com','phongkinhdoanh'),
('nv02','nguy?n c?m tú','n?','haiphong','0120122','t@gmail.com','phongketoan'),
('nv03','nguy?n v?n b','nam','bacninh','0120123','b@gmail.com','phongketoan'),
('nv04','nguy?n th? c','n?','namdinh','0120124','c@gmail.com','phongtaichinh'),
('nv05','nguy?n lê minh','nam','hanoi','0120125','m@gmail.com','phongkinhdoanh');


insert into pnhap values
('n01','2020-01-15','nv01'),
('n02','2020-06-12','nv02'),
('n03','2021-02-12','nv03'),
('n04','2023-02-12','nv02'),
('n05','2020-03-10','nv03');


insert into nhap values
('n01','sp03',5,280000),
('n02','sp05',3,480000),
('n03','sp02',2,190000),
('n04','sp01',1,140000),
('n05','sp06',4,430000);


insert into pxuat values
('x01','2020-06-14','nv01'),
('x02','2020-09-10','nv02'),
('x03','2021-02-03','nv05'),
('x04','2023-09-15','nv05');


insert into xuat values
('x01','sp03',2),
('x01','sp05',1),
('x02','sp06',5),
('x03','sp03',1),
('x03','sp02',3),
('x04','sp03',4);


select * from hangsx;
select * from sanpham;
select * from nhanvien;
select * from pnhap;
select * from nhap;
select * from pxuat;
select * from xuat;
--a
select pnhap.sohdn, sanpham.masp, sanpham.tensp, nhap.soluongn, nhap.dongian, pnhap.ngaynhap, nhanvien.tennv, nhanvien.tenphong
from nhap
join pnhap on nhap.sohdn = pnhap.sohdn
join sanpham on nhap.masp = sanpham.masp
join hangsx on sanpham.mahangsx = hangsx.mahangsx
join nhanvien on pnhap.manv = nhanvien.manv
where hangsx.tenhang = 'samsung' and year(pnhap.ngaynhap) = 2020;
--b
select top 10 pxuat.sohdx, xuat.masp, xuat.soluongx, pxuat.ngayxuat
from xuat
join pxuat on xuat.sohdx = pxuat.sohdx
where year(pxuat.ngayxuat) = 2020
order by xuat.soluongx desc;

--c
 select top 10 masp, tensp, giaban
from sanpham
order by giaban desc;
--d
select sanpham.*
from sanpham
join hangsx on sanpham.mahangsx = hangsx.mahangsx
where sanpham.giaban between 100000 and 500000
  and hangsx.tenhang = 'samsung';

  --e
select sum(nhap.soluongn * nhap.dongian) as tong_tien_nhap
from nhap
join pnhap on nhap.sohdn = pnhap.sohdn
join sanpham on nhap.masp = sanpham.masp
join hangsx on sanpham.mahangsx = hangsx.mahangsx
where hangsx.tenhang = 'samsung' and year(pnhap.ngaynhap) = 2020;

--f
select sum(xuat.soluongx * sanpham.giaban) as tong_tien_xuat
from xuat
join pxuat on xuat.sohdx = pxuat.sohdx
join sanpham on xuat.masp = sanpham.masp
where pxuat.ngayxuat = '2020-06-14';
--g
select top 1 pnhap.sohdn, pnhap.ngaynhap, (nhap.soluongn * nhap.dongian) as tien_nhap
from nhap
join pnhap on nhap.sohdn = pnhap.sohdn
where year(pnhap.ngaynhap) = 2020
order by tien_nhap desc;

--h
select sanpham.*
from xuat
join pxuat on xuat.sohdx = pxuat.sohdx
join nhanvien on pxuat.manv = nhanvien.manv
join sanpham on xuat.masp = sanpham.masp
where nhanvien.tennv = 'nguy?n lê minh' and year(pxuat.ngayxuat) = 2021;

--i
select sanpham.*, xuat.soluongx
from xuat
join pxuat on xuat.sohdx = pxuat.sohdx
join sanpham on xuat.masp = sanpham.masp
where pxuat.ngayxuat = '2021-02-03'
order by xuat.soluongx desc;

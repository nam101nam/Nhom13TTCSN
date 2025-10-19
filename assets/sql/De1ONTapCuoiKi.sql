use master
go
if(exists(select *from sysdatabases where name='QUANLIKHACHHANG'))
drop database QUANLIKHACHHANG
go
create database QUANLIKHACHHANG
go
use QUANLIKHACHHANG
go

create table KH(
   MaKH nvarchar(30) primary key,
   Ho nvarchar(30),
   Ten nvarchar(30),
   DiaChi nvarchar(30)
)
create table Hang(
   MaH nvarchar(30) primary key,
   TenH nvarchar(30) ,
   DonGia int
)
create table DH(
    SoDH nvarchar(30) primary key,
    Ngay date,
    MaKH nvarchar(30),
    constraint FK_DH_KH foreign key(MaKH)
    references KH(MaKH)
)
create table CTDH(
    SoDH nvarchar(30),
    MaH nvarchar(30),
    constraint PK primary key(SoDH,MaH),
    SL int,
    constraint FK_CTDH_DH foreign key(SoDH)
    references DH(SoDH),
    constraint FK_CTDH_Hang foreign key(MaH)
    references Hang(MaH)
)
insert into KH(MaKH,Ho,Ten,DiaChi) values
('KH01',N'Nguy?n',N'D?ng',N'B?c Giang'),
('KH02',N'D??ng',N'H??ng',N'H� N?i'),
('KH03',N'Nguy?n',N'Ng?c',N'B?c Ninh'),
('KH04',N'Ph?m',N'Ng?c',N'B?c Giang');

insert into Hang(MaH,TenH,DonGia)values
('H01','iphone 17',20000000),
('H02','OnePlus',18000000),
('H03','tivi',32000000),
('H04','xemay',10000000);

insert into DH(SoDH,Ngay,MaKH) values
('DH01','2024-01-25','KH01'),
('DH02','2023-07-15','KH02'),
('DH03','2023-11-06','KH03'),
('DH04','2022-02-28','KH04'),
('DH05','2023-09-12','KH01');

insert into CTDH(SoDH,MaH,SL) values
('DH01','H01',2),
('DH02','H02',3),
('DH03','H03',7),
('DH04','H04',4),
('DH05','H01',1);

select *from KH;
select *from Hang;
select *from DH;
select *from CTDH;

-- l?y ra m� h�ng v� s? l??ng h�ng ?� ???c ??t trong ??n h�ng c� m� s? l� DH03
select MaH, SL from CTDH where SoDH like('DH03');
-- l?y ra t�n v� gi� c�c m?t h�ng m� kh�ch c� m� l� KH02 ?� ??t v?i s? l??ng l� tr�n 2
select TenH, DonGia from Hang
inner join CTDH on Hang.MaH=CTDH.MaH
inner join DH on CTDH.SoDH=DH.SoDH
where MaKH like('KH02') and SL>2;
--l?y t�n kh�ch h�ng b?t ??u b?ng ch? Ng ?� ??t c�c m?t h�ng tr??c 1/5/2024
select Ho,Ten from KH
inner join DH on KH.MaKH=DH.MaKH
where Ho like(N'Ng%') and Ngay<'2024-05-01';
--L?y ra m� v� t�n m?t h�ng c� ??n gi� nh? nh?t
select top 1 *from Hang order by DonGia asc;
--l?y ra m� h�ng  v� s? Kh�ch h�ng ?� ??t mua m?t h�ng ?�.
select h.MaH, count(distinct ct.SoDH) as SoKhachMua
from Hang h
inner join CTDH ct on h.MaH = ct.MaH
group by h.MaH;



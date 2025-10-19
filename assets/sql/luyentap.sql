
use master
drop database QLBH
go
create database QLBH
go
use QLBH

create table CongTy(
    MaCT nchar(10) not null primary key,
    TenCT nvarchar(20) not null,
    TrangThai nchar(10),
    ThanhPho nvarchar(20)
)
create table SanPham(
    MaSP  nchar(10) not null primary key,
    TenSP nvarchar(20),
    MauSac nchar(10) default N'Đỏ',
    Gia money,
    SoLuongCo int,
    constraint unique_SP unique(TenSP)
)
create table CungUng(
    MaCT nchar(10) not null,
    MaSP nchar(10) not null,
    SoLuongBan int,
    constraint PK_CungUng Primary key(MaCT,MaSP),
    constraint chk_SLB check(SoLuongBan>0),
    constraint FK_CU_SP foreign key(MaSP)
    references SanPham(MaSP),
    constraint FK_CU_CT foreign key(MaCT)
    references CongTy(MaCT),
)
insert into CongTy(MaCT,TenCT,TrangThai,ThanhPho) values('IT2023','cong nghe thong tin','available','BacGiang'),
                 ('IT2025','cong nghe thong tin','available','BacGiang'),
                 ('IT2024','cong nghe thong tin','available','BacGiang'),
                 ('IT2022','cong nghe thong tin','available','BacGiang');
 select *from CongTy;


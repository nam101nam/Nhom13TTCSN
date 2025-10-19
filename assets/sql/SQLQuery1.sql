use master
alter database QLSV set single_user with rollback immediate
go
if(exists(select *from sysdatabases where name='QLSV'))
drop database QLSV
go
create database QLSV
go
use QLSV
go

create table SinhVien(
   MaSV char(10) primary key,
   TenSV nvarchar(50) not null,
   NgaySinh date,
   MaLop char(10) not null
)
 create table MonHoc(
   MaMH char(10) primary key,
   TenMH nvarchar(50) not null,
   Sotc int
)
 create table KetQua(
   MaSV char(10),
   MaMH char(10),
   constraint PK primary key(MaSV,MaMH),
   DiemThi int,
   constraint FK_KetQua_SinhVien foreign key(MaSV)
   references SinhVien(MaSV),
   constraint FK_KetQua_MonHoc foreign key(MaMH)
   references MonHoc(MaMH)
)

insert into SinhVien(MaSV,TenSV,NgaySinh,MaLop)values('2023602553','Nguyen Van A','2002-02-05','IT63'),
   ('2023602554','Nguyen Van B','2004-02-05','IT64'),
   ('2023602555','Nguyen Van C','2003-04-08','IT65'),
   ('2023602556','Nguyen Van D','2002-02-28','IT66');

insert into MonHoc(MaMH,TenMH,Sotc) values('MH01','HTCDSL','2'),
   ('MH02','GTICH','3'),
   ('MH03','TIENGANH','4'),
   ('MH04','HTTT','2');

insert into KetQua(MaSV,MaMH,DiemThi)values('2023602553','MH01','8'),
   ('2023602554','MH02','5'),
   ('2023602555','MH03','9'),
   ('2023602556','MH04','6');

select *from MonHoc;
select *from SinhVien;
select *from KetQua;

-- cập nhật số tín chỉ 2 tín thành 3 tín
update MonHoc set Sotc=3 where Sotc=2;
select *from MonHoc;

select MaSV,TenSV from SinhVien where year(NgaySinh)=2002;
-- đưa ra mã sinh viên , tên sinh viên đã đăng kí các môn học bắt đầu bằng chữ H
select SinhVien.MaSV,SinhVien.TenSV from SinhVien inner join KetQua on SinhVien.MaSV=KetQua.MaSV inner join MonHoc on KetQua.MaMH=MonHoc.MaMH where TenMH like (N'H%');
-- đưa ra mã môn học mà đếm số lượng sinh viên đã đăng kí môn học đó
SELECT MonHoc.MaMH, TenMH, COUNT(KetQua.MaSV) AS SoLuongDangKy
FROM KetQua
INNER JOIN MonHoc ON KetQua.MaMH = MonHoc.MaMH
GROUP BY MonHoc.MaMH, TenMH;
-- đưa ra tên sinh viên chưa đăng kí môn học nào
insert into SinhVien('2023602555','Nguyen Manh Dung','2005-02-28','IT67');
select TenSV from SinhVien  inner join  KetQua on SinhVien.MaSV=KetQua.MaSV inner join MonHoc on KetQua.MaMH=MonHoc.MaMH where MaMH not in('MH01','MH02','MH03','MH04');






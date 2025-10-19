use master
alter database QUANLYNHANVIEN set single_user with rollback immediate
go
if(exists(select *from sysdatabases where name='QUANLYNHANVIEN'))
drop database QUANLYNHANVIEN
go
create database QUANLYNHANVIEN
go
use QUANLYNHANVIEN
go

create table NhanVien(
    MaNV nvarchar(30) primary key,
    TenNV nvarchar(30),
    NgaySinh date,
    TrinhDo nvarchar(30),
    ChucVu nvarchar(30)
)
 create table KhoaHoc(
    MaKH nvarchar(30)  primary key,
    TenKH nvarchar(30),
    DiaDiem nvarchar(30)
)
create table ThamGia(
     MaNV nvarchar(30),
     MaKH nvarchar(30),
     constraint PK primary key(MaNV,MaKH),
     SoBuoiNghi int,
     KetQua nvarchar(30),
     constraint FK_ThamGia_NhanVien foreign key(MaNV)
     references NhanVien(MaNV),
     constraint FK_ThamGia_KhoaHoc foreign key(MaKH)
     references KhoaHoc(MaKH)
)
insert into NhanVien(MaNV,TenNV,NgaySinh,TrinhDo,ChucVu)values
('NV01',N'Trần Văn Uớc','1998-05-12',N'Đại Học',N'Nhân Viên'),
('NV02',N'Hoàng Văn Huy','2000-07-12',N'Đại Học',N'Trưởng Phòng'),
('NV03',N'Nguyễn Thị Chính','1982-05-02',N'Cao Đẳng',N'Nhân Viên');

insert into KhoaHoc(MaKH,TenKH,DiaDiem)values
('KH01',N'Giao Tiếp Cơ Bản',N'Hà Nội'),
('KH02',N'Giao Tiếp Nâng Cao',N'Hà Nội'),
('KH03',N'Phân Tích Số Liệu',N'Hồ Chí Minh');
 insert into ThamGia(MaNV,MaKH,SoBuoiNghi,KetQua)values
 ('NV01','KH01',1,N'Khá'),
 ('NV01','KH02',2,N'Khá'),
 ('NV02','KH01',0,N'Giỏi'),
 ('NV02','KH02',1,N'Khá'),
 ('NV02','KH03',1,N'Trung Bình'),
 ('NV03','KH01',4,N'Trung Bình');

 select *from NhanVien;
 select *from KhoaHoc;
 select *from ThamGia;
 --a
 select *from NhanVien where TrinhDo like(N'Đại học');
 --b
 select *from NhanVien where TenNV like(N'Trần%') and year(NgaySinh)=2000;
 --c 
 select TenNV from NhanVien 
 inner join ThamGia on NhanVien.MaNV=ThamGia.MaNV
 inner join KhoaHoc on ThamGia.MaKH=KhoaHoc.MaKH
 where TenKH like(N'Giao Tiếp Nâng Cao') and KetQua like(N'Khá');
 --d
 select *from NhanVien
 inner join ThamGia on NhanVien.MaNV=ThamGia.MaNV
 inner join KhoaHoc on ThamGia.MaKH=KhoaHoc.MaKH
 where DiaDiem like(N'Hà Nội') and SoBuoiNghi>2;
 --e
 select nv.MaNV ,nv.TenNV,tg.SoBuoiNghi,tg.KetQua from NhanVien nv
 inner join ThamGia tg  on nv.MaNV=tg.MaNV
 inner join KhoaHoc kh on tg.MaKH=kh.MaKH
 where TenKH like(N'Giao Tiếp%');
 -- đưa ra danh sách mã khóa học, tên khóa học, số người tham gia kết quả giỏi mỗi khóa học
select kh.MaKH,kh.TenKH,tg.KetQua,count(tg.KetQua)as SoNguoiThamGia from NhanVien nv
 inner join ThamGia tg  on nv.MaNV=tg.MaNV
 inner join KhoaHoc kh on tg.MaKH=kh.MaKH
 where tg.KetQua=N'Giỏi'
 group by kh.MaKH,kh.TenKH,tg.KetQua;
 --lấy ra mã nhân viên và số khóa học nhân viên đó đã tham gia
select MaNV, count(MaKH) as SoKhoaHoc
from ThamGia
group by MaNV;
--lấy ra mã và tên khóa học có từ 2 nhân viên trở lên
select kh.MaKH,kh.TenKH,count(nv.MaNV)as SoLuongThamGia
from NhanVien nv
 inner join ThamGia tg  on nv.MaNV=tg.MaNV
 inner join KhoaHoc kh on tg.MaKH=kh.MaKH
 group by kh.MaKH,kh.TenKH
 having count(nv.MaNV)>=2;







use master
go
alter database GVSinhVien set single_user with rollback immediate
go
if(exists (select *from sysdatabases where name='GVSinhVien'))
drop database GVSinhVien
go
create database GVSinhVien
go
use  GVSinhVien 
go

create table Khoa (
    MaKhoa nvarchar(10) not null primary key,
    TenKhoa char(30),
    DienThoai char(10)
)
create table GiangVien(
    MaGV nvarchar(20) not null primary key,
    HotenGV char(30),
    Luong decimal(5,2),
    MaKhoa nvarchar(10),
    constraint FK_GV_K foreign key(MaKhoa)
    references Khoa(MaKhoa)
)
create table SinhVien(
    MaSV int not null primary key,
    HotenSV char(30),
    NamSinh int,
    Quequan char(30),
    MaKhoa nvarchar(10),
    constraint FK_SV_K foreign key(MaKhoa)
    references Khoa(MaKhoa)
)
 insert into Khoa(MaKhoa,TenKhoa,DienThoai) values('IT601','Cong Nghe Thong Tin','0321'),
    ('IT602','Khoa Hoc May Tinh','0322'),
    ('IT603','Mang May Tinh','0323'),
    ('IT604','Ky Thuat Phan Mem','0324'),
    ('IT605','Ky Thuat May Tinh','0325');

insert into GiangVien(MaGV,HotenGV,Luong,MaKhoa) values('01','Nguyen Thi Thuy','100.00','IT601'),
    ('02','Bach Ngoc Anh','100.00','IT602'),
    ('03','Nguyen Tuan Tu','100.00','IT603'),
    ('04','Nguyen Thanh hai','100.00','IT604'),
    ('05','Nguyen Thi Trinh','100.00','IT605');

insert into SinhVien(MaSV,HotenSV,NamSinh,Quequan,MaKhoa) values('2023602551','Bui Dinh Hau','2005','Ha Tinh','IT601'),
('2023602552','Tran Dinh Dai','2005','Phu Tho','IT602'),
('2023602553','Nguyen Hoang Hai','2005','Sapa','IT603'),
('2023602554','Nguyen Ba Thanh','2005','Hai Duong','IT604'),
('2023602555','Nguyen Manh Dung','2005','Bac Giang','IT605');
 
select *from Khoa;
select *from GiangVien;
select *from SinhVien;
 
 -- đưa ra cái thông tin của sinh viên sắp xếp theo chiều tăng dần của năm sinh
select *from SinhVien order by NamSinh asc; 
 
 -- đưa ra thông tin 2 sinh viên có tuổi lớn nhất
select top 2 *from SinhVien order by NamSinh asc;

--đưa ra 30% thông tin giảng viên có lương cao nhất
 select top 30% *from GiangVien order by Luong desc;
 
--đưa ra danh sách các sinh viên không có quê ở hà nội,bắc giang,lạng sơn
select *from SinhVien where  Quequan=Not in(N'ha noi',N'Bac giang',N'lạng son');

--đưa ra thông tin 2 giảng viên có lương thấp nhất
select top 2 *from GiangVien order by Luong asc;

--đưa ra cái giảng viên có lương cao nhất
select top 3 *from GiangVien order by Luong desc;

--đưa ra danh sách các học sinh quê ở hà nam
select *from SinhVien where Quequan= in(N'Hà nam');

--đưa ra sinh viên có tuổi nhỏ nhất
select top 1 *from SinhVien order by NamSinh desc;

-- đưa ra các danh sách sinh viên chưa học khóa nào cả

--đưa ra các giáo viên chưa dạy môn nào cả

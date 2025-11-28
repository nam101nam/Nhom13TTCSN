use master
--alter database BanHang set single_user with rollback immediate
go
if(exists(select*from sysdatabases where name='BanHang'))
drop database BanHang
go
create database BanHang
go
use BanHang
go

create table MatHang(
     MSMH nvarchar(30) primary key,
     TenHang nvarchar(30),
     DonGia int,
     DVT char(10)
)
create table KhachHang(
     MaKH nvarchar(30) primary key,
     TenKH nvarchar(30),
     DiaChi nvarchar(30)
)
create table PhieuNhap(
     SoPN nvarchar(30) primary key,
     NgayLap nvarchar(30),
     MaKH nvarchar(30),
     constraint FK_PhieuNhap_KhachHang foreign key(MaKH)
     references KhachHang(MaKH),
     Kho nvarchar(30)
)
 create table CTNhap(
      SoPN nvarchar(30),
      MSMH nvarchar(30),
      constraint PK primary key(SoPN,MSMH),
      constraint FK_CTNhap_PhieuNhap foreign key(SoPN)
      references PhieuNhap(SoPN),
      constraint FK_CTNhap_MatHang foreign key(MSMH)
      references MatHang(MSMH),
      SoLuong int,
)

insert into MatHang(MSMH,TenHang,DonGia,DVT) values('MH01','TULANH',200000,'VND'),
      ('MH02','TELEVISION',2500000,'VND'),
      ('MH03','AIR CONDITITION',2900000,'VND'),
      ('MH04','MAYGIAT',300000,'VND');

insert into KhachHang(MaKH,TenKH,DiaChi)values('KH01',N'Ngô Anh Thư','HA NOI'),
      ('KH02',N'Trần Minh Trí','BAC GIANG'),
      ('KH03','NGUYEN VAN C','HCM'),
      ('KH04','NGUYEN VAN D','BAC NINH');

insert into PhieuNhap(SoPN,NgayLap,MaKH,Kho)values('PN01','2006-02-28','KH01','KHO01'),
      ('PN02','2006-03-07','KH02','KHO02'),
      ('PN03','2006-9-11','KH03','KHO03'),
      ('PN04','2005-07-10','KH04','KHO04');

insert into CTNhap(SoPN,MSMH,SoLuong)values('PN01','MH01','200'),
      ('PN02','MH02','400'),
      ('PN03','MH03','300'),
      ('PN04','MH04','700');

select *from MatHang;
select *from KhachHang;
select *from PhieuNhap;
select *from CTNhap;


--hiển thị thông tin các phiếu nhập của năm 2006 bao gồm:số phiếu nhập,tên khách hàng,Ngày lập phiếu,Thành tiền
SELECT pn.SoPN, kh.TenKH, pn.NgayLap, SUM(ct.SoLuong * mh.DonGia) AS ThanhTien
FROM KhachHang kh
INNER JOIN PhieuNhap pn ON kh.MaKH = pn.MaKH
INNER JOIN CTNhap ct ON pn.SoPN = ct.SoPN
INNER JOIN MatHang mh ON ct.MSMH = mh.MSMH
WHERE YEAR(pn.NgayLap) = 2006 
GROUP BY pn.SoPN, kh.TenKH, pn.NgayLap;
-- cho biết khách hàng Ngô Anh Thư (Nếu có) đã đặt bao nhiêu mặt hàng trong năm 2026, thông tin gồm:tháng,năm, tổng số, mặt hàng,đã đặt mua
select TenKH,NgayLap,SoLuong 
from KhachHang
inner join PhieuNhap on KhachHang.MaKH=PhieuNhap.MaKH
inner join CTNhap on PhieuNhap.SoPN=CTNhap.SoPN
where year(NgayLap)=2006 and TenKH like(N'Ngô Anh Thư');
-- in ra danh sách các khách hàng(MaKH,TenKH) có tổng thành tiền của các phiếu lập từ 1tr đổ lên
select KhachHang.MaKH,.KhachHang.TenKH,DonGia from KhachHang
inner join PhieuNhap on KhachHang.MaKH=PhieuNhap.MaKH
inner join CTNhap on PhieuNhap.SoPN=CTNhap.SoPN
inner join MatHang on CTNhap.MSMH=MatHang.MSMH
where DonGia>1000000;
--Liệt kê thông tin:mã khách hàng, tên khách hàng, số phiếu nhập,mã mặt hàng,số lượng đơn giá, 
-- của khách  hàng có tên khách hàng là Trần Minh Trí nếu có
select KhachHang.MaKH,KhachHang.TenKH,PhieuNhap.SoPN,MatHang.MSMH,SoLuong,DonGia,sum(SoLuong*DonGia)AS TongTien from KhachHang
inner join PhieuNhap on KhachHang.MaKH=PhieuNhap.MaKH
inner join CTNhap on PhieuNhap.SoPN=CTNhap.SoPN
inner join MatHang on CTNhap.MSMH=MatHang.MSMH
where TenKH like(N'Trần Minh Trí')
group By KhachHang.MaKH,KhachHang.TenKH,PhieuNhap.SoPN,MatHang.MSMH,SoLuong,DonGia;
-- cho biết khách hàng chưa  nhập hàng vào năm 2006 bao gồm: mã khách hàng , tên khách hàng , địa chỉ , tổng số  phiếu  nhập
select KhachHang.MaKH,KhachHang.TenKH,DiaChi,PhieuNhap.SoPN from KhachHang
inner join PhieuNhap on KhachHang.MaKH=PhieuNhap.MaKH
inner join CTNhap on PhieuNhap.SoPN=CTNhap.SoPN
inner join MatHang on CTNhap.MSMH=MatHang.MSMH
where year(NgayLap)not like(2006);

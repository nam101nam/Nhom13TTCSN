USE master
IF (EXISTS (SELECT * FROM SYSDATABASES WHERE NAME='QLBH'))
DROP DATABASE QLBH
CREATE DATABASE QLBH
use QLBH
CREATE TABLE HANG (
    MaHang CHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(50) NOT NULL,
    MauSac NVARCHAR(50),
    GiaBan MONEY NOT NULL
);
CREATE TABLE PHIEUXUAT (
    MaPX CHAR(10) PRIMARY KEY,
    NgayLap DATE,
    GhiChu NVARCHAR(MAX)
);
CREATE TABLE CHITIETPX (
    MaHang CHAR(10),
    MaPX CHAR(10),
    SoLuong INT NOT NULL,
    PRIMARY KEY (MaHang, MaPX),
    FOREIGN KEY (MaHang) REFERENCES HANG(MaHang),
    FOREIGN KEY (MaPX) REFERENCES PHIEUXUAT(MaPX)
);
INSERT INTO HANG VALUES
('H01', N'Ti vi', N'Hồng', 2000000),
('H02', N'Tủ lạnh', N'Đỏ', 6000000),
('H03', N'Máy Giặt', N'Xám', 8000000)
INSERT INTO PHIEUXUAT VALUES
('PX01', '11/02/2016', N'Bán buôn'),
('PX02', '1/12/2016', N'Bán lẻ'),
('PX03', '8/25/2025', N'Bán lẻ')
INSERT INTO CHITIETPX VALUES
('H01', 'PX01', 150),
('H02', 'PX01', 50),
('H02', 'PX02', 15)
SELECT * FROM HANG
SELECT * FROM PHIEUXUAT
SELECT * FROM CHITIETPX
--5.	Cập nhật màu sắc của tất cả các mặt hàng có màu Đỏ thành màu Cam. (0.5đ)
SELECT * FROM HANG
UPDATE HANG SET MAUSAC='Cam' WHERE MAUSAC=N'Đỏ'
SELECT * FROM HANG
--Câu 2 (CĐR L2- 4 điểm). Thực hiện các truy vấn sau: (1đ/câu)
--1.	Đưa ra tên hàng, giá bán của các hàng có màu bắt đầu bằng chữ H.
SELECT * FROM HANG
select TenHang, GiaBan from HANG
where MauSac LIKE N'H%';
--2.	Đưa ra tên hàng có số lượng bán trong mỗi phiếu từ 4 trở lên và có giá bán bằng 5000.
INSERT INTO HANG VALUES
('H04', N'Chổi', N'Hồng', 5000);
INSERT INTO CHITIETPX VALUES
('H04', 'PX01',5);
SELECT * FROM HANG
SELECT * FROM CHITIETPX
SELECT tenhang FROM HANG H JOIN CHITIETPX PX ON PX.MaHang=H.MaHang
WHERE SoLuong>=4 AND GiaBan=5000;
--3.	Đưa ra mã hàng và đếm số lượng phiếu xuất đã xuất mặt hàng đó.
SELECT * FROM CHITIETPX
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang;

--4.	Đưa ra tên hàng có giá bán cao nhất.
SELECT tenhang FROM HANG 
WHERE giaban=(SELECT max(GIABAN) FROM HANG)
-- Đưa ra tên hàng bán từ 3 phiếu trở lên
INSERT INTO CHITIETPX VALUES
('H02', 'PX03',5);
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang
HAVING count(MaPX)>=3;
--Đưa ra mã hàng chưa bán trong phiếu xuất nào
INSERT INTO HANG VALUES ('H05',N'Giá đỡ',N'trắng',200000)
SELECT mahang FROM hang
WHERE mahang NOT IN (SELECT Mahang FROM CHITIETPX)USE master
IF (EXISTS (SELECT * FROM SYSDATABASES WHERE NAME='QLBH'))
DROP DATABASE QLBH
CREATE DATABASE QLBH
use QLBH
CREATE TABLE HANG (
    MaHang CHAR(10) PRIMARY KEY,
    TenHang NVARCHAR(50) NOT NULL,
    MauSac NVARCHAR(50),
    GiaBan MONEY NOT NULL
);
CREATE TABLE PHIEUXUAT (
    MaPX CHAR(10) PRIMARY KEY,
    NgayLap DATE,
    GhiChu NVARCHAR(MAX)
);
CREATE TABLE CHITIETPX (
    MaHang CHAR(10),
    MaPX CHAR(10),
    SoLuong INT NOT NULL,
    PRIMARY KEY (MaHang, MaPX),
    FOREIGN KEY (MaHang) REFERENCES HANG(MaHang),
    FOREIGN KEY (MaPX) REFERENCES PHIEUXUAT(MaPX)
);
INSERT INTO HANG VALUES
('H01', N'Ti vi', N'Hồng', 2000000),
('H02', N'Tủ lạnh', N'Đỏ', 6000000),
('H03', N'Máy Giặt', N'Xám', 8000000)
INSERT INTO PHIEUXUAT VALUES
('PX01', '11/02/2016', N'Bán buôn'),
('PX02', '1/12/2016', N'Bán lẻ'),
('PX03', '8/25/2025', N'Bán lẻ')
INSERT INTO CHITIETPX VALUES
('H01', 'PX01', 150),
('H02', 'PX01', 50),
('H02', 'PX02', 15)
SELECT * FROM HANG
SELECT * FROM PHIEUXUAT
SELECT * FROM CHITIETPX
--5.	Cập nhật màu sắc của tất cả các mặt hàng có màu Đỏ thành màu Cam. (0.5đ)
SELECT * FROM HANG
UPDATE HANG SET MAUSAC='Cam' WHERE MAUSAC=N'Đỏ'
SELECT * FROM HANG
--Câu 2 (CĐR L2- 4 điểm). Thực hiện các truy vấn sau: (1đ/câu)
--1.	Đưa ra tên hàng, giá bán của các hàng có màu bắt đầu bằng chữ H.
SELECT * FROM HANG
select TenHang, GiaBan from HANG
where MauSac LIKE N'H%';
--2.	Đưa ra tên hàng có số lượng bán trong mỗi phiếu từ 4 trở lên và có giá bán bằng 5000.
INSERT INTO HANG VALUES
('H04', N'Chổi', N'Hồng', 5000);
INSERT INTO CHITIETPX VALUES
('H04', 'PX01',5);
SELECT * FROM HANG
SELECT * FROM CHITIETPX
SELECT tenhang FROM HANG H JOIN CHITIETPX PX ON PX.MaHang=H.MaHang
WHERE SoLuong>=4 AND GiaBan=5000;
--3.	Đưa ra mã hàng và đếm số lượng phiếu xuất đã xuất mặt hàng đó.
SELECT * FROM CHITIETPX
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang;

--4.	Đưa ra tên hàng có giá bán cao nhất.
SELECT tenhang FROM HANG 
WHERE giaban=(SELECT max(GIABAN) FROM HANG)
-- Đưa ra tên hàng bán từ 3 phiếu trở lên
INSERT INTO CHITIETPX VALUES
('H02', 'PX03',5);
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang
HAVING count(MaPX)>=3;
--Đưa ra mã hàng chưa bán trong phiếu xuất nào
INSERT INTO HANG VALUES ('H05',N'Giá đỡ',N'trắng',200000)
SELECT mahang FROM hang
WHERE mahang NOT IN (SELECT Mahang FROM CHITIETPX)
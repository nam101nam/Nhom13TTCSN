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
('H01', N'Ti vi', N'H?ng', 2000000),
('H02', N'T? l?nh', N'??', 6000000),
('H03', N'Máy Gi?t', N'Xám', 8000000)
INSERT INTO PHIEUXUAT VALUES
('PX01', '11/02/2016', N'Bán buôn'),
('PX02', '1/12/2016', N'Bán l?'),
('PX03', '8/25/2025', N'Bán l?')
INSERT INTO CHITIETPX VALUES
('H01', 'PX01', 150),
('H02', 'PX01', 50),
('H02', 'PX02', 15)
SELECT * FROM HANG
SELECT * FROM PHIEUXUAT
SELECT * FROM CHITIETPX
--5.	C?p nh?t màu s?c c?a t?t c? các m?t hàng có màu ?? thành màu Cam. (0.5?)
SELECT * FROM HANG
UPDATE HANG SET MAUSAC='Cam' WHERE MAUSAC=N'??'
SELECT * FROM HANG
--Câu 2 (C?R L2- 4 ?i?m). Th?c hi?n các truy v?n sau: (1?/câu)
--1.	??a ra tên hàng, giá bán c?a các hàng có màu b?t ??u b?ng ch? H.
SELECT * FROM HANG
select TenHang, GiaBan from HANG
where MauSac LIKE N'H%';
--2.	??a ra tên hàng có s? l??ng bán trong m?i phi?u t? 4 tr? lên và có giá bán b?ng 5000.
INSERT INTO HANG VALUES
('H04', N'Ch?i', N'H?ng', 5000);
INSERT INTO CHITIETPX VALUES
('H04', 'PX01',5);
SELECT * FROM HANG
SELECT * FROM CHITIETPX
SELECT tenhang FROM HANG H JOIN CHITIETPX PX ON PX.MaHang=H.MaHang
WHERE SoLuong>=4 AND GiaBan=5000;
--3.	??a ra mã hàng và ??m s? l??ng phi?u xu?t ?ã xu?t m?t hàng ?ó.
SELECT * FROM CHITIETPX
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang;

--4.	??a ra tên hàng có giá bán cao nh?t.
SELECT tenhang FROM HANG 
WHERE giaban=(SELECT max(GIABAN) FROM HANG)
-- ??a ra tên hàng bán t? 3 phi?u tr? lên
INSERT INTO CHITIETPX VALUES
('H02', 'PX03',5);
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang
HAVING count(MaPX)>=3;
--??a ra mã hàng ch?a bán trong phi?u xu?t nào
INSERT INTO HANG VALUES ('H05',N'Giá ??',N'tr?ng',200000)
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
('H01', N'Ti vi', N'H?ng', 2000000),
('H02', N'T? l?nh', N'??', 6000000),
('H03', N'Máy Gi?t', N'Xám', 8000000)
INSERT INTO PHIEUXUAT VALUES
('PX01', '11/02/2016', N'Bán buôn'),
('PX02', '1/12/2016', N'Bán l?'),
('PX03', '8/25/2025', N'Bán l?')
INSERT INTO CHITIETPX VALUES
('H01', 'PX01', 150),
('H02', 'PX01', 50),
('H02', 'PX02', 15)
SELECT * FROM HANG
SELECT * FROM PHIEUXUAT
SELECT * FROM CHITIETPX
--5.	C?p nh?t màu s?c c?a t?t c? các m?t hàng có màu ?? thành màu Cam. (0.5?)
SELECT * FROM HANG
UPDATE HANG SET MAUSAC='Cam' WHERE MAUSAC=N'??'
SELECT * FROM HANG
--Câu 2 (C?R L2- 4 ?i?m). Th?c hi?n các truy v?n sau: (1?/câu)
--1.	??a ra tên hàng, giá bán c?a các hàng có màu b?t ??u b?ng ch? H.
SELECT * FROM HANG
select TenHang, GiaBan from HANG
where MauSac LIKE N'H%';
--2.	??a ra tên hàng có s? l??ng bán trong m?i phi?u t? 4 tr? lên và có giá bán b?ng 5000.
INSERT INTO HANG VALUES
('H04', N'Ch?i', N'H?ng', 5000);
INSERT INTO CHITIETPX VALUES
('H04', 'PX01',5);
SELECT * FROM HANG
SELECT * FROM CHITIETPX
SELECT tenhang FROM HANG H JOIN CHITIETPX PX ON PX.MaHang=H.MaHang
WHERE SoLuong>=4 AND GiaBan=5000;
--3.	??a ra mã hàng và ??m s? l??ng phi?u xu?t ?ã xu?t m?t hàng ?ó.
SELECT * FROM CHITIETPX
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang;

--4.	??a ra tên hàng có giá bán cao nh?t.
SELECT tenhang FROM HANG 
WHERE giaban=(SELECT max(GIABAN) FROM HANG)
-- ??a ra tên hàng bán t? 3 phi?u tr? lên
INSERT INTO CHITIETPX VALUES
('H02', 'PX03',5);
SELECT mahang, count(MaPX) as SL_phieu
FROM CHITIETPX
GROUP BY MAhang
HAVING count(MaPX)>=3;
--??a ra mã hàng ch?a bán trong phi?u xu?t nào
INSERT INTO HANG VALUES ('H05',N'Giá ??',N'tr?ng',200000)
SELECT mahang FROM hang
WHERE mahang NOT IN (SELECT Mahang FROM CHITIETPX)
-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-03-09 01:21:53.362

-- tables
-- Table: KetQua
CREATE TABLE KetQua (
    MaSV varchar(10)  NOT NULL,
    MaMH varchar(10)  NOT NULL,
    DiemThi float(3)  NOT NULL,
    MonHoc_MaMH varchar(10)  NOT NULL,
    CONSTRAINT KetQua_pk PRIMARY KEY  (MaSV)
);

-- Table: Khoa
CREATE TABLE Khoa (
    MaKhoa varchar(10)  NOT NULL,
    TenKhoa nvarchar(20)  NOT NULL,
    SoCBGD varchar(10)  NOT NULL,
    CONSTRAINT Khoa_pk PRIMARY KEY  (MaKhoa)
);

-- Table: Lop
CREATE TABLE Lop (
    MaLop varchar(10)  NOT NULL,
    TenLop nvarchar(20)  NOT NULL,
    MaKhoa varchar(10)  NOT NULL,
    Khoa_MaKhoa varchar(10)  NOT NULL,
    CONSTRAINT Lop_pk PRIMARY KEY  (MaLop)
);

-- Table: MonHoc
CREATE TABLE MonHoc (
    MaMH varchar(10)  NOT NULL,
    TenMH nvarchar(20)  NOT NULL,
    SoTiet int  NOT NULL,
    SinhVien_MaSV varchar(10)  NOT NULL,
    CONSTRAINT MonHoc_pk PRIMARY KEY  (MaMH)
);

-- Table: SinhVien
CREATE TABLE SinhVien (
    MaSV varchar(10)  NOT NULL,
    HoTen nvarchar(20)  NOT NULL,
    GioiTinh varchar(3)  NOT NULL,
    NgaySinh date  NOT NULL,
    MaLop varchar(10)  NOT NULL,
    HocBong nvarchar(50)  NOT NULL,
    Tinh nvarchar(50)  NOT NULL,
    Lop_MaLop varchar(10)  NOT NULL,
    CONSTRAINT SinhVien_pk PRIMARY KEY  (MaSV)
);

-- foreign keys
-- Reference: KetQua_MonHoc (table: KetQua)
ALTER TABLE KetQua ADD CONSTRAINT KetQua_MonHoc
    FOREIGN KEY (MonHoc_MaMH)
    REFERENCES MonHoc (MaMH);

-- Reference: Lop_Khoa (table: Lop)
ALTER TABLE Lop ADD CONSTRAINT Lop_Khoa
    FOREIGN KEY (Khoa_MaKhoa)
    REFERENCES Khoa (MaKhoa);

-- Reference: MonHoc_SinhVien (table: MonHoc)
ALTER TABLE MonHoc ADD CONSTRAINT MonHoc_SinhVien
    FOREIGN KEY (SinhVien_MaSV)
    REFERENCES SinhVien (MaSV);

-- Reference: SinhVien_Lop (table: SinhVien)
ALTER TABLE SinhVien ADD CONSTRAINT SinhVien_Lop
    FOREIGN KEY (Lop_MaLop)
    REFERENCES Lop (MaLop);

-- End of file.


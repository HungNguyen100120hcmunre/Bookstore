---Xoa CSDL QLBansach neu da co
-----Tao CSDL QLBansach
create database QLBANSACH
use QLBANSACH
CREATE TABLE KHACHHANG
(
MaKH INT IDENTITY(1,1),
HoTen nVarchar(50) NOT NULL,
Taikhoan Varchar(50) UNIQUE,
Matkhau Varchar(50) NOT NULL,
Email Varchar(100) UNIQUE,
DiachiKH nVarchar(200),
DienthoaiKH Varchar(50),
Ngaysinh DATETIME
CONSTRAINT PK_Khachhang PRIMARY KEY(MaKH)
)
GO
Create Table CHUDE
(
MaCD int Identity(1,1),
TenChuDe nvarchar(50) NOT NULL,
CONSTRAINT PK_ChuDe PRIMARY KEY(MaCD)
)
GO
Create Table NHAXUATBAN
(
MaNXB int identity(1,1),
TenNXB nvarchar(50) NOT NULL,
Diachi NVARCHAR(200),
DienThoai VARCHAR(50),
CONSTRAINT PK_NhaXuatBan PRIMARY KEY(MaNXB)
)
Go
CREATE TABLE SACH
(
Masach INT IDENTITY(1,1),
Tensach NVARCHAR(100) NOT NULL,
Giaban Decimal(18,0) CHECK (Giaban>=0),
Mota NVarchar(Max),
Anhbia VARCHAR(50),
Ngaycapnhat DATETIME,
Soluongton INT,
MaCD INT,
MaNXB INT,
Constraint PK_Sach Primary Key(Masach),
Constraint FK_Chude Foreign Key(MaCD) References
CHUDE(MaCD),
Constraint FK_NhaXB Foreign Key(MaNXB)References

NHAXUATBAN(MANXB)

)
GO
CREATE TABLE TACGIA
(
MaTG INT IDENTITY(1,1),
TenTG NVARCHAR(50) NOT NULL,
Diachi NVARCHAR(100),
Tieusu nVarchar(Max),
Dienthoai VARCHAR(50),
CONSTRAINT PK_TacGia PRIMARY KEY(MaTG)
)
GO
CREATE TABLE VIETSACH
(
	MaTG INT,
	Masach INT,
	Vaitro nVarchar(50),
	Vitri nVarchar(50),
	CONSTRAINT PK_VietSach PRIMARY KEY(MaTG,Masach),
	Constraint FK_MaTG Foreign Key(MaTG) References TACGIA(MaTG),
	Constraint FK_Masach Foreign Key(Masach) References SACH(Masach),
)
GO

CREATE TABLE DONDATHANG
(
MaDonHang INT IDENTITY(1,1),
Dathanhtoan bit,
Tinhtranggiaohang bit,
Ngaydat Datetime,
Ngaygiao Datetime,
MaKH INT,
CONSTRAINT FK_Khachhang FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),

CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang)
)
Go

CREATE TABLE CHITIETDONTHANG
(
MaDonHang INT,
Masach INT,
Soluong Int Check(Soluong>0),
Dongia Decimal(18,0) Check(Dongia>=0),
CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,Masach),
CONSTRAINT FK_Donhang FOREIGN KEY (MaDonHang) REFERENCES DONDATHANG(MaDonHang),

CONSTRAINT FK_Sach FOREIGN KEY (Masach)

REFERENCES Sach(Masach)

)
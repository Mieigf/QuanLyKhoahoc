create database QuanLyKhoaHoc;
go
use QuanLyKhoaHoc;
go
create table BoPhanDaoTao (
MaBoPhan int primary key identity(1,1),
TenBoPhan nvarchar(100) not null
);
create table NhanVien (
MaNhanVien int primary key identity(1,1),
TenNhanVien nvarchar(100) not null,
ChuyenMon nvarchar(100),
ChucVu nvarchar(100)
);
create table KhoaHoc (
MaKhoaHoc int primary key identity(1,1),
TenKhoaHoc nvarchar(255) not null,
NgayBatDau date not null,
NgayKetThuc date not null,
NganSach decimal(10,2) not null,
MaQuanLy int not null,
MaBoPhan int not null,
foreign key (MaQuanLy) references NhanVien(MaNhanVien),
foreign key (MaBoPhan) references BoPhanDaoTao(MaBoPhan)
);
create table GiangVien (
MaGiangVien int primary key identity(1,1),
TenGiangVien nvarchar(100) not null,
LaGiangVienBenNgoai bit not null,
PhiGiangDay decimal(10,2) null
);
create table KhoaHoc_GiangVien (
MaKhoaHoc int,
MaGiangVien int,
primary key (MaKhoaHoc, MaGiangVien),
foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc),
foreign key (MaGiangVien) references GiangVien(MaGiangVien)
);
create table CoSoDaoTao (
MaCoSo int primary key identity(1,1),
TenCoSo nvarchar(255) not null,
DiaChi nvarchar(255) not null
);
create table KhoaHoc_BenNgoai (
MaKhoaHoc int primary key,
MaCoSo int not null,
HocPhiMotNguoi decimal(10,2),
TongChiPhiKhoaHoc decimal(10,2),
foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc),
foreign key (MaCoSo) references CoSoDaoTao(MaCoSo)
);
create table KhoaHoc_NhanVien (
MaNhanVien int,
MaKhoaHoc int,
primary key (MaNhanVien, MaKhoaHoc),
foreign key (MaNhanVien) references NhanVien(MaNhanVien),
foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc)
);
create table ChiPhiKhoaHoc (
MaChiPhi int primary key identity(1,1),
MaKhoaHoc int not null,
LoaiChiPhi nvarchar(100) not null,
SoTien decimal(10,2) not null,
foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc)
);
create table DanhGiaKhoaHoc (
MaDanhGia int primary key identity(1,1),
MaKhoaHoc int not null,
MaNhanVien int not null,
XepHang int check (XepHang between 1 and 5),
NhanXet nvarchar(max),
foreign key (MaKhoaHoc) references KhoaHoc(MaKhoaHoc),
foreign key (MaNhanVien) references NhanVien(MaNhanVien)
);

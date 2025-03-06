-- chèn dữ liệu vào tất cả các bảng 
-- bộ phận đào tạo
insert into BoPhanDaoTao (TenBoPhan)
select top 50 N'Bộ phận ' + cast(row_number() over (order by (select null)) as nvarchar) from master.dbo.spt_values;
-- nhân viên
insert into NhanVien (TenNhanVien, ChuyenMon, ChucVu)
select top 50 N'Nhân viên ' + cast(row_number() over (order by (select null)) as nvarchar),
N'Chuyên môn ' + cast(row_number() over (order by (select null)) as nvarchar),
N'Chức vụ ' + cast(row_number() over (order by (select null)) as nvarchar) from master.dbo.spt_values;
-- khóa học
insert into KhoaHoc (TenKhoaHoc, NgayBatDau, NgayKetThuc, NganSach, MaQuanLy, MaBoPhan)
select top 50 N'Khóa học ' + cast(row_number() over (order by (select null)) as nvarchar),
'2024-01-01', '2024-02-01', 1000000 + (row_number() over (order by (select null)) * 50000), 1, 1 from master.dbo.spt_values;
-- giảng viên
insert into GiangVien (TenGiangVien, LaGiangVienBenNgoai, PhiGiangDay)
select top 50 N'Giảng viên ' + cast(row_number() over (order by (select null)) as nvarchar),
cast(row_number() over (order by (select null)) % 2 as bit), 500000 + (row_number() over (order by (select null)) * 10000) from master.dbo.spt_values;
-- cơ sở đào tạo
insert into CoSoDaoTao (TenCoSo, DiaChi)
select top 50 N'Cơ sở ' + cast(row_number() over (order by (select null)) as nvarchar),
N'Địa chỉ ' + cast(row_number() over (order by (select null)) as nvarchar) from master.dbo.spt_values;
-- nhân viên tham gia khóa học
insert into KhoaHoc_NhanVien (MaNhanVien, MaKhoaHoc)
select top 50 1, row_number() over (order by (select null)) from master.dbo.spt_values;
-- chi phí khóa học
insert into ChiPhiKhoaHoc (MaKhoaHoc, LoaiChiPhi, SoTien)
select top 50 1, N'Loại chi phí ' + cast(row_number() over (order by (select null)) as nvarchar),
200000 + (row_number() over (order by (select null)) * 5000) from master.dbo.spt_values;
-- đánh giá khóa học
insert into DanhGiaKhoaHoc (MaKhoaHoc, MaNhanVien, XepHang, NhanXet)
select top 50 1, 1, (row_number() over (order by (select null)) % 5) + 1,
N'Nhận xét ' + cast(row_number() over (order by (select null)) as nvarchar) from master.dbo.spt_values;
-- khóa học - giảng viên
insert into KhoaHoc_GiangVien (MaKhoaHoc, MaGiangVien)
select top 50 row_number() over (order by (select null)), 
    (row_number() over (order by (select null)) % 50) + 1
from master.dbo.spt_values;
-- khóa học bên ngoài
insert into KhoaHoc_BenNgoai (MaKhoaHoc, MaCoSo, HocPhiMotNguoi, TongChiPhiKhoaHoc)
select top 50 
 row_number() over (order by (select null)), 
(row_number() over (order by (select null)) % 50) + 1, 
100000 + (row_number() over (order by (select null)) * 5000), 
5000000 + (row_number() over (order by (select null)) * 100000)
from master.dbo.spt_values;

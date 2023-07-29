/*=====================Create DataBase======================*/
if exists(select name from sys.databases where name='QuanLyDiemSV')
drop Database WS4
go
Create Database WS4
go

use WS4
go


/*=============DANH MUC KHOA==============*/


Create table DMKhoa
(
MaKhoa char(2) primary key,
TenKhoa nvarchar(30) not null,
)


/*==============DANH MUC SINH VIEN============*/


Create table DMSV
(
MaSV char(3) not null primary key,
HoSV nvarchar(15) not null,
TenSV nvarchar(7) not null,
Phai nchar(7),
NgaySinh datetime not null,
NoiSinh nvarchar(20),
MaKhoa char(2),
HocBong float,

)




/*===================MON HOC========================*/



create table DMMH
(
MaMH char(2) not null,
TenMH nvarchar(25) not null,
SoTiet tinyint
Constraint DMMH_MaMH_pk primary key(MaMH)
)



/*=====================KET QUA===================*/

Create table KetQua
(
MaSV char(3) not null,
MaMH char(2) not null,
LanThi tinyint,
Diem decimal(4,2),
Constraint KetQua_MaSV_MaMH_LanThi_pk primary key(MaSV,MaMH,LanThi)
)

/*==========================TAO KHOA NGOAI==============================*/
Alter table dmsv
add Constraint DMKhoa_MaKhoa_fk foreign key(MaKhoa)
References DMKhoa (MaKhoa)
Alter table KetQua
add constraint KetQua_MaSV_fk foreign key(MaSV)references DMSV (MaSV),
constraint DMMH_MaMH_fk foreign key(MaMH)references DMMH (MaMH)


/*==================NHAP DU LIEU====================*/

/*==============NHAP DU LIEU DMMH=============*/
Insert into DMMH(MaMH,TenMH,SoTiet)
values('01',N'Cơ Sở Dữ Liệu',45)
Insert into DMMH(MaMH,TenMH,SoTiet)
values('02',N'Trí Tuệ Nhân Tạo',45)
Insert into DMMH(MaMH,TenMH,SoTiet)
values('03',N'Truyền Tin',45)
Insert into DMMH(MaMH,TenMH,SoTiet)
values('04',N'Đồ Họa',60)
Insert into DMMH(MaMH,TenMH,SoTiet)
values('05',N'Văn Phạm',60)

/*==============NHAP DU LIEU DMKHOA=============*/
Insert into DMKhoa(MaKhoa,TenKhoa)
values('AV',N'Anh Văn')
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TH',N'Tin Học')
Insert into DMKhoa(MaKhoa,TenKhoa)
values('TR',N'Triết')
Insert into DMKhoa(MaKhoa,TenKhoa)
values('VL',N'Vật Lý')


/*==============NHAP DU LIEU DMSV=============*/


SET DATEFORMAT DMY
GO
Insert into DMSV
values('A01',N'Nguyễn Thị',N'Hải',N'Nữ','23/02/1990',N'Hà Nội','TH',130000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A02',N'Trần Văn',N'Chính',N'Nam','24/12/1992',N'Bình Định','VL',150000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A03',N'Lê Thu Bạch',N'Yến',N'Nữ','21/02/1990',N'TP Hồ Chí Minh','TH',170000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('A04',N'Trần Anh',N'Tuấn',N'Nam','20/12/1990',N'Hà Nội','AV',80000)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B01',N'Trần Thanh',N'Mai',N'Nữ','12/08/1991',N'Hải Phòng','TR',0)
Insert into DMSV(MaSV,HoSV,TenSV,Phai,NgaySinh,NoiSinh,MaKhoa,HocBong)
values('B02',N'Trần Thị Thu',N'Thủy',N'Nữ','02/01/1991',N'TP Hồ Chí Minh','AV',0)

/*==============NHAP DU LIEU BANG KET QUA=============*/

Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',1,3)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','01',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','02',2,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A01','03',1,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',1,4.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','01',2,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','03',1,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A02','05',1,9)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',1,2)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','01',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A03','03',2,4)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('A04','05',2,10)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','01',1,7)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',1,2.5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B01','03',2,5)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)

values('B02','02',1,6)
Insert into KetQua(MaSV,MaMH,LanThi,Diem)
values('B02','04',1,10)

--------------------------B------------------------
--9. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh viên, Tên 
--sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã sinh viên tăng dần. 

select MaSV,HoSV,TenSV,HocBong from DMSV
order by MASV asc

--10. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên, Phái, Ngày 
--sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ. 

select MaSV,HoSV,Phai,NgaySinh from DMSV
order by Phai 

--11. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông tin sẽ 
--được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần. 

select HoSV,NgaySinh,HocBong from DMSV
order by NgaySinh asc, hocbong desc
--12. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã môn, Tên 
--môn, Số tiết. 

select * from DMMH
Where TenMH like 'T%'

--13. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm các thông 
--tin: Họ tên sinh viên, Ngày sinh, Phái. 

select HoSV + ' '+TenSV as Ho_Ten_SV, NgaySinh,Phai from DMSV
where TenSV like '%I'
--14. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm các thông tin: 
--Mã khoa, Tên khoa. 

select MaKhoa,TenKhoa from DMKhoa 
where TenKhoa like '_N%'
--15. Liệt kê những sinh viên mà họ có chứa chữ Thị. 


Select HoSV,TenSV from DMSV 
where HoSV like N'%Thị%'

--16. Cho biết danh sách những sinh viên có ký tự đầu tiên của tên nằm trong khoảng từ a 
--đến m, gồm các thông tin: Mã sinh viên, Họ tên sinh viên, Phái, Học bổng. 

select MaSV,HoSV,Phai,HocBong from DMSV
where TenSV like '[A-M]%'


--17. Cho biết danh sách những sinh viên mà tên có chứa ký tự nằm trong khoảng từ a đến 
--m, gồm các thông tin: Họ tên sinh viên, Ngày sinh, Nơi sinh, Học bổng. Danh sách 
--được sắp xếp tăng dần theo họ tên sinh viên. 

select * from DMSV
select HoSV,NgaySinh,NoiSinh,HocBong from DMSV
where TenSV like '[A-M]%'
order by HoSV asc
--18. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các thông tin: Mã 
--sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự 
--Mã khoa giảm dần. 
select MaSV,HoSV + ' '+TenSV as Ho_Ten_SV,MaKhoa,HocBong from DMSV	
where HocBong> 100000
order by MaKhoa desc

--19. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm các thông 
--tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng. 

select HoSV,MaKhoa,NoiSinh,HocBong from DMSV	
where HocBong> 150000 and NoiSinh=N'Hà Nội'


--20. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông tin: Mã sinh 
--viên, Mã khoa, Phái. 

select MaSV,MaKhoa,Phai from DMSV
where MaKhoa='AV' or MaKhoa='VL'

--21. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày 05/06/1992 gồm 
--các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học bổng. 

select MaSV,NgaySinh,NoiSInh,HocBong from DMSV
where NgaySinh between '01/01/1991' and '06/05/1992'

--22. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các thông tin: Mã 
--sinh viên, Ngày sinh, Phái, Mã khoa. 


Select MaSV,NgaySinh,Phai,MaKhoa from DMSV
where HocBong between 80000 and 150000
--23. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông tin: Mã 
--môn học, Tên môn học, Số tiết. 

select * from DMMH
where SoTiet >30 and Sotiet<45

--24. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các thông tin: Mã 
--sinh viên, Họ tên sinh viên, tên khoa, Phái. 

Select MaSV,HoSV,MaKhoa,Phai from DMSV
where Phai='Nam' and (MaKhoa='AV' or MaKhoa='TH')

--25. Liệt kê những sinh viên nữ, tên có chứa chữ N--

Select tenSV from DMSV where TenSV like'%N%'

-----------------------------------------------C. Truy vấn sử dụng hàm: year, month, day, getdate, case, …. 
--26. Danh sách sinh viên có nơi sinh ở Hà Nội và sinh vào tháng 02, gồm các thông tin: Họ 
--sinh viên, Tên sinh viên, Nơi sinh, Ngày sinh.

select * from DMSV
select HoSV, TenSV, NoiSInh,NgaySinh from DMSV
where month(NgaySinh)=02 and NoiSinh like N'Hà Nội'
--27. Cho biết những sinh viên có tuổi lớn hơn 20, thông tin gồm: Họ tên sinh viên, Tuổi,Học bổng. 
select MaSV,HoSV + ' '+TenSV as Ho_Ten_SV,
datediff(year,NgaySinh,getdate()) as tuoi_SV
,HocBong from DMSV
where datediff(year,NgaySinh,getdate()) >20
--28. Danh sách những sinh viên có tuổi từ 20 đến 25, thông tin gồm: Họ tên sinh viên, Tuổi, 
--Tên khoa. 
select * from DMSV
select * from DMKhoa
select DMSV.HoSV + ' '+DMSV.TenSV as Ho_Ten_SV,
datediff(year,DMSV.NgaySinh,getdate()) as tuoi_SV
,DMKhoa.TenKhoa
from DMSV
inner join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
where datediff(year,DMSV.NgaySinh,getdate()) between 20 and 25
--29. Danh sách sinh viên sinh vào mùa xuân năm 1990, gồm các thông tin: Họ tên sinh viên, 
--Phái, Ngày sinh. 

select HoSV,Phai,NgaySinh from DMSV
where Year(Ngaysinh)=1990 and month(ngaysinh)<=3

--30. Cho biết thông tin về mức học bổng của các sinh viên, gồm: Mã sinh viên, Phái, Mã 
--khoa, Mức học bổng. Trong đó, mức học bổng sẽ hiển thị là “Học bổng cao” nếu giá trị 
--của field học bổng lớn hơn 500,000 và ngược lại hiển thị là “Mức trung bình” 
--Cách 1 dùng function
create function function_muc_hoc_bong(@HocBong int)
returns nvarchar(50)
as
begin	
	return case
	when @HocBong >500000
	then N'Học bổng cao'
	else N'Mức trung bình'
	end
end
select MaSV,Phai,MaKhoa,dbo.function_muc_hoc_bong(HocBong)
as Muc_hoc_bong from DMSV 

--Cách 2 dùng case when
select MaSV,Phai,MaKhoa, case when hocbong>500000 
then N'Học bổng cao'
else N'Mức trung bình' end 
as Muc_hoc_bong from DMSV
--D. Truy vấn sử dụng hàm kết hợp: max, min, count, sum, avg và gom 
--nhóm 
--32. Cho biết tổng số sinh viên của toàn trường

select count(MaSV) as Tong_SV_toan_Truong 
from DMSV
--33. Cho biết tổng sinh viên và tổng sinh viên nữ. 
--đây là cách viết gộp trong bảng

select count(MaSV) as tong_sv,count(case when Phai=N'Nữ' then MaSV else Null end) as tong_sv_nu from DMSV 

--34. Cho biết tổng số sinh viên của từng khoa. 

select MaKhoa, count(MaSV) as tong_sv_TungKhoa from DMSV
group by MaKhoa
--35. Cho biết số lượng sinh viên học từng môn. 


select distinct DMMH.MaMH,DMMH.TenMH,count( distinct KetQua.MaSV) as So_SV_Hoc
from DMMH
inner join Ketqua on DMMH.MaMH= KetQua.MaMH
group by DMMH.TenMH,DMMH.MaMH
--36. Cho biết số lượng môn học mà sinh viên đã học(tức tổng số môn học có torng bảng kq)

select count( distinct MaMH) as Tong_Cac_Mon_Hoc from KetQua
--37. Cho biết tổng số học bổng của mỗi khoa. 

select DMSV.MaKhoa,DMKhoa.TenKhoa,count(case when DMSV.HocBong > 0 then 1 else null end) as Tong_So_HocBong from DMSV
join DMKHoa on DMSV.MaKhoa=DMKhoa.MaKHoa
group by DMSV.MaKhoa,DMKhoa.TenKhoa
having count(DMSV.HocBong) >0

--38. Cho biết học bổng cao nhất của mỗi khoa. 


select DMKhoa.TenKhoa,max(DMSV.HocBong) as HocBong_Cao_Nhat from DMSV
 join DMKHoa on DMSV.MaKhoa=DMKhoa.MaKHoa
group by DMKhoa.TenKhoa
--39. Cho biết tổng số sinh viên nam và tổng số sinh viên nữ của mỗi khoa. 

select DMKhoa.TenKhoa,
count(case DMSV.Phai when N'Nữ' then 1 else null end) as So_SV_Nu, 
count(case DMSV.Phai when 'Nam' then 1 else null end) as So_SV_Nam
from DMSV
join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKHoa
group by DMKhoa.TenKhoa
--40. Cho biết số lượng sinh viên theo từng độ tuổi. 


select 
datediff(year,ngaysinh,getdate()) as Do_Tuoi, count(MaSV) as Tong_SV_Trong_do_tuoi
from DMSV 
group by datediff(year,ngaysinh,getdate())

--41. Cho biết những năm sinh nào có 2 sinh viên đang theo học tại trường. 

select 
Year(NgaySinh) As Nam, count(MaSV ) as so_SV
from DMSV 
group by year(ngaySInh)
Having count(MASV)=2


--42. Cho biết những nơi nào có hơn 2 sinh viên đang theo học tại trường. 


select 
MaKhoa , count(MaSV ) as so_SV
from DMSV 
group by MaKhoa
Having count(MAKhoa)>=2
--43. Cho biết những môn nào có trên 3 sinh viên dự thi. 

select DMMH.TenMH, count(distinct KetQua.MaSV) as so_lan_sv_thi
from DMMH
join KetQua on DMMH.MaMH=KetQua.MaMH
group by DMMH.TenMH
having count(distinct KetQua.MaSV) >3
--44. Cho biết những sinh viên thi lại trên 2 lần. 

select KetQua.MaSV,DMSV.TenSV,count(case when ketqua.LanThi =2 then 1 else null end) as So_Lan_thi from KetQua
inner join DMSV on KetQua.MaSV=DMSV.MaSV
group by KetQua.MaSV,DMSV.TenSV
having count(case when ketqua.LanThi =2 then 1 else null end) >=2

--45. Cho biết những sinh viên nam có điểm trung bình lần 1 trên 7.0 

select distinct KetQua.MaSV,DMSV.TenSV
from DMSV
join KetQua on KetQua.MaSV=DMSV.MaSV
where KetQua.LanThi=1 and KetQua.Diem>=7 and DMSV.Phai='Nam'
--46. Cho biết danh sách các sinh viên rớt trên 2 môn ở lần thi 1.

select MaSV ,count(MaSV) as so_mon_thi
from KetQua
where Lanthi = 1 and Diem<5 
group by MaSV	
having count(MaSV) >=2

--47. Cho biết danh sách những khoa có nhiều hơn 2 sinh viên nam 

select MaKhoa,count(MaSV) as so_SV from DMSV 
where Phai='Nam'
group by MaKhoa
having count(MaSV) >=2
--48. Cho biết những khoa có 2 sinh đạt học bổng từ 200.000 đến 300.000. 

select MaKhoa,count(MaSV) as so_SV from DMSV 
where HocBong between 200000 and 300000
group by MaKhoa
having count(maSV)>=2


--49. Cho biết số lượng sinh viên đậu và số lượng sinh viên rớt của từng môn trong lần thi 1. 

--làm từng bảng

create or alter procedure procedure_SV_NOTPass
@ma_MH int =-1
as
begin 
	select MaMH,count(case
	when Diem < 5
	then 1
	else null
	end) as SV_NOTPass
	from KetQua
where lanthi=1 and (MaMH=@ma_MH or @ma_MH=-1)
group by MaMH
end
procedure_SV_NOTPass @ma_MH=01
procedure_SV_NOTPass
create or alter procedure procedure_SV_Pass
@ma_MH int =-1
as
begin 
	select MaMH,count(case
	when Diem >=5
	then 1
	else null
	end) as SV_Pass
	from KetQua
where lanthi=1 and (MaMH=@ma_MH or @ma_MH=-1)
group by MaMH
end

procedure_SV_Pass @ma_MH=01
procedure_SV_Pass 
--Làm gộp

select MaMH,
count(case when Diem <5 then 1 else null end) 
as so_sv_NOTPASS,
count(case when Diem >=5 then 1 else null end) 
as so_sv_PASS 
from KetQua
where LanThi=1
group by maMH

--50. Cho biết số lượng sinh viên nam và số lượng sinh viên nữ của từng khoa. 
--trùng lại câu 39


select DMKhoa.TenKhoa,
count(case DMSV.Phai when N'Nữ' then 1 else null end) as So_SV_Nu, 
count(case DMSV.Phai when 'Nam' then 1 else null end) as So_SV_Nam
from DMSV
join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKHoa
group by DMKhoa.TenKhoa
--F. Truy vấn con trả về một giá trị 
--51. Cho biết sinh viên nào có học bổng cao nhất. 


select DMSV.tenSV,m.HocBong_lon_nhat  from DMSV 
inner join (select max(HocBong) as HocBong_lon_nhat from DMSV ) as m
on DMSV.HocBong=m.HocBong_lon_nhat
--52. Cho biết sinh viên nào có điểm thi lần 1 môn cơ sở dữ liệu cao nhất. 

select KetQua.MaSV,KetQua.LanThi,diem.Diem_thi_lan_1_max_CSDL from KetQua
inner join
(select  max(KetQua.Diem ) as Diem_thi_lan_1_max_CSDL from ketqua inner join DMMH on DMMH.MaMH=KetQua.MaMH
where DMMH.tenMH=N'Cơ Sở Dữ Liệu' ) as diem
on KetQua.Diem=diem.Diem_thi_lan_1_max_CSDL
where LanThi=1

--53. Cho biết sinh viên khoa anh văn có tuổi lớn nhất. 
select * from DMSV
select b3.* from
(select DMSV.*, datediff(year,ngaysinh,getdate()) as [tuoi_SV] from DMSV) as b3
inner join
(select max(b1.tuoi_SV) as max_tuoi_SV from
(select datediff(year,ngaysinh,getdate()) as tuoi_SV from DMSV) as b1) as b2 
on b3.tuoi_SV=b2.max_tuoi_SV
where b3.MaKhoa ='AV'

--or

--54. Cho biết khoa nào có đông sinh viên nhất. 

--cach 1:

select b3.TenKhoa,b3.so_sv from
(select DMKhoa.TenKhoa,count(DMSV.MaKhoa) as[so_sv] from DMKhoa inner join DMSV on DMKhoa.MaKhoa=DMSV.MaKhoa group by DMKhoa.TenKhoa) as b3
inner join (select max(b1.so_sv_tung_lop) as so_SV from
(select count(MaKhoa) as so_sv_tung_lop from DMSV group by MaKhoa)as b1) as b2 on b3.so_sv=b2.so_SV
--cach 2:

--55. Cho biết khoa nào có đông nữ nhất. 

select b3.TenKhoa,b3.so_sv from
(select DMKhoa.TenKhoa,count(case when Phai=N'Nữ' then 1 else null end) as[so_sv] from DMKhoa inner join DMSV on DMKhoa.MaKhoa=DMSV.MaKhoa group by DMKhoa.TenKhoa) as b3
inner join (select max(b1.so_sv_tung_lop) as so_SV from
(select count( case when Phai=N'Nữ' then 1 else null end) as so_sv_tung_lop from DMSV group by MaKhoa)as b1) as b2 on b3.so_sv=b2.so_SV
--56. Cho biết môn nào có nhiều sinh viên rớt lần 1 nhiều nhất. 

select b3.TenMH,b3.so_sv from
(select DMMH.TenMH,count(case when diem <5 then 1 else null end) as so_sv from ketqua inner join DMMH on DMMH.MaMH=KetQua.MaMH where KetQua.lanthi=1 group by DMMH.tenMH) as b3
inner join
(select max(b1.so_sv) as [so_sv] from
(select count(case when diem <5 then 1 else null end) as so_sv from ketqua where lanthi=1 group by MaMH ) as b1) as b2
on b3.so_sv=b2.so_sv
--57. Cho biết sinh viên không học khoa anh văn có điểm thi môn phạm lớn hơn điểm thi văn 
--phạm của sinh viên học khoa anh văn. 

select b2.MaSV,b2.HoSV,TenSV,MaKhoa,LanThi,MaMH,b2.Diem from
(select KetQua.MaSV, DMSV.HoSV,TenSV,MaKhoa,KetQua.LanThi,MaMH,Diem 
from DMSV inner join KetQua on DMSV.MaSV=KetQua.MaSV where MaMH=05)
as b2 inner join
(select min(KetQua.Diem) as Diem from KetQua inner join DMSV on KetQua.MaSV=DMSV.MaSV where KetQua.MaMH=05 and DMSV.MaKhoa='AV') as b1 on b2.Diem > b1.Diem
where b2.MaKhoa !='AV'

--G. Truy vấn con trả về nhiều giá trị, sử dụng lượng từ all, any, union, top. 

--58. Cho biết sinh viên có nơi sinh cùng với Hải. 

select * from
(select * from DMSV where tenSV!=N'Hải') as b2 
inner join
(select NoiSinh from DMSV where tenSV=N'Hải') as b1 on b2.NoiSinh=b1.NoiSinh
--59. Cho biết những sinh viên nào có học bổng lớn hơn tất cả học bổng của 
--sinh viên thuộc khoa anh văn 

select b2.TenSV, b2.HocBong from
(select DMSV.TenSV,DMSV.HocBong from DMSV
left join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
where DMKhoa.TenKhoa!=N'Anh Văn') as b2
inner join
(select max(b1.HocBong) as max_HocBong from
(select DMSV.TenSV,DMSV.HocBong from DMSV
left join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
where DMKhoa.TenKhoa=N'Anh Văn'
) as b1) as b3 on b2.HocBong>b3.max_HocBong


--60. Cho biết những sinh viên có học bổng lớn hơn bất kỳ học bổng của sinh viên học khóa anh văn 

select b2.TenSV, b2.HocBong from
(select DMSV.TenSV,DMSV.HocBong from DMSV
left join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
where DMKhoa.TenKhoa!=N'Anh Văn') as b2
inner join
(select min(b1.HocBong) as min_HocBong from
(select DMSV.TenSV,DMSV.HocBong from DMSV
left join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
where DMKhoa.TenKhoa=N'Anh Văn'
) as b1) as b3 on b2.HocBong>b3.min_HocBong

--61. Cho biết sinh viên nào có điểm thi môn cơ sở dữ liệu lần 2 lớn hơn tất cả điểm thi lần 1 
--môn cơ sở dữ liệu của những sinh viên khác. 


select b2.MaSV,LanThi,diem from
(select KetQua.MaSV,KetQua.LanThi,Diem from KetQua inner join DMMH on DMMH.MaMH=KetQua.MaMH
where DMMH.tenMH=N'Cơ Sở Dữ Liệu' and KetQua.LanThi=2) as b2
inner join
(select  max(KetQua.Diem ) as Diem_thi_lan_1_max_CSDL from ketqua inner join DMMH on DMMH.MaMH=KetQua.MaMH
where DMMH.tenMH=N'Cơ Sở Dữ Liệu' and LanThi=1) as diem
on b2.Diem > diem.Diem_thi_lan_1_max_CSDL

--62. Cho biết những sinh viên đạt điểm cao nhất trong từng môn.

select b2.* from
(select KetQua.MaSV,KetQua.MaMH,DMMH.TenMH,DMSV.TenSV,KetQua.Diem from KetQua inner join DMSV on KetQua.MaSV=DMSV.MaSV  inner join DMMH on KetQua.MaMH=DMMH.MaMH) as b2
inner join
(select MaMH, max(diem) as max_diem from KetQua group by MaMH) as b1 on b2.Diem=b1.max_diem and b2.MaMH=b1.MaMH
--63. Cho biết những khoa không có sinh viên học. 
select DMKhoa.MaKhoa,DMKhoa.TenKhoa,count(DMSV.MaKhoa) as SO_SV from DMSV right join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
group by DMKhoa.MaKhoa,DMKhoa.TenKhoa 
Having count(DMSV.MaKhoa) =0
--64. Cho biết sinh viên chưa thi môn cơ sở dữ liệu. 

select DMSV.TenSV,DMSV.MaSV from DMSV inner join
(select MaSV,count(case when MaMH=01 then 1 else null end) as a from KetQua 
group by MaSV
Having count(case when MaMH=01 then 1 else null end) =0) as b1
on DMSV.MaSV=b1.MaSV
--65. Cho biết sinh viên nào không thi lần 1 mà có dự thi lần 2. 

select KetQua.MaSV,DMSV.TenSV,KetQua.MaMH from KEtQua inner join
(select maSV,MaMH ,count(LanTHi) as lanthi from KEtQua group by MaSV,MaMH
Having count(LanThi) = 1) as b1 on  KetQua.MaSV=b1.MaSV and KetQua.MaMH=b1.MaMH
inner join DMSV on KetQua.MaSV=DMSV.MaSV
where KetQua.LanThi=2

--66. Cho biết môn nào không có sinh viên khoa anh văn học. 

select b1.MaSV,b2.TenSV,b1.MaMH,b1.TenMH from
(select distinct KetQua.MaSV,KetQua.MaMH,DMMH.TenMH from KetQua inner join DMMh on KetQua.MaMH=DMMH.MaMH) as b1
inner join 
(select DMSV.MaSV,DMSV.TenSV,DMKhoa.TenKhoa,DMSV.MaKhoa from DMSV inner join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa) as b2
on b1.MaSV=b2.MaSV
where b2.TenKhoa != N'Anh Văn'
--67. Cho biết những sinh viên khoa anh văn chưa học môn văn phạm. 

select distinct b3.MaSV from
(select b1.MaSV,b2.TenSV,b1.MaMH,count(case when b1.TenMH=N'Văn Phạm' then 1 else null end) as a  from
(select distinct KetQua.MaSV,KetQua.MaMH,DMMH.TenMH from KetQua inner join DMMh on KetQua.MaMH=DMMH.MaMH) as b1
inner join 
(select DMSV.MaSV,DMSV.TenSV,DMKhoa.TenKhoa,DMSV.MaKhoa from DMSV inner join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa) as b2
on b1.MaSV=b2.MaSV
where b2.TenKhoa = N'Anh Văn' 
group by b1.MaSV,b2.TenSV,b1.MaMH
having count(case when b1.TenMH=N'Văn Phạm' then 1 else null end) = 0) as b3

--68. Cho biết những sinh viên không rớt môn nào. 

select b1.* from 
(select distinct KetQua.MaSV,DMSV.TenSV,KetQua.MaMH from KetQua inner join DMSV on KetQua.MaSV=DMSV.MaSV where LanThi=1 and Diem >=5
union 
select distinct KetQua.MaSV,DMSV.TenSV,KetQua.MaMH from KetQua inner join DMSV on KetQua.MaSV=DMSV.MaSV where LanThi=2 and Diem >=5) as b1
inner join 
(select distinct KetQua.MaSV from KetQua inner join DMSV on KetQua.MaSV=DMSV.MaSV where LanThi=2 and Diem <5) as b2
on b1.MaSV != b2.MaSV
--69. Cho biết những sinh viên học khoa anh văn có học bổng và những sinh viên chưa bao 
--giờ rớt.


select distinct KetQua.MaSV,DMSV.TenSV,DMKhoa.TenKhoa,KetQua.MaMH from DMSV 
inner join KetQua on KetQua.MaSV=DMSV.MaSV 
inner join DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa
where KetQua.LanThi=1 and KetQua.Diem >=5 and DMKhoa.TenKhoa=N'Anh Văn' and DMSV.HocBong >0
--70. Cho biết khoa nào có đông sinh viên nhận học bổng nhất và khoa nào khoa nào có ít 
--sinh viên nhận học bổng nhất. 

select b3.* from
(select DMSV.MaKhoa,DMKhoa.TenKhoa,count(case when HocBong >0 then 1 else null end) as so_HB_Max from DMSV inner join
DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa group by DMSV.MaKhoa,DMKhoa.TenKhoa) as b3
inner join
(select max(b1.so_HB) as max_HB from
(select MaKhoa,count(case when HocBong >0 then 1 else null end) as so_HB from DMSV group by MaKhoa having count(case when HocBong >0 then 1 else null end) >0) as b1) as b2 on b3.so_HB_Max=b2.max_HB

select b3.* from
(select DMSV.MaKhoa,DMKhoa.TenKhoa,count(case when HocBong >0 then 1 else null end) as so_HB_Min from DMSV inner join
DMKhoa on DMSV.MaKhoa=DMKhoa.MaKhoa group by DMSV.MaKhoa,DMKhoa.TenKhoa) as b3
inner join
(select min(b1.so_HB) as min_HB from
(select MaKhoa,count(case when HocBong >0 then 1 else null end) as so_HB from DMSV group by MaKhoa having count(case when HocBong >0 then 1 else null end) >0) as b1) as b2 on b3.so_HB_min=b2.min_HB

--71. Cho biết 3 sinh viên có học nhiều môn nhất.


select b3.MaSV,TenSV from
(select KetQua.MaSV,DMSV.tenSV,count(distinct MaMH) as so_MH from KetQua inner join DMSV on KetQua.MaSV=DMSV.MaSV group by KetQua.MaSV,DMSV.tenSV ) as b3
inner join 
(select max(b1.so_MH)as so_Max_MH from
(select count(distinct MaMH) as so_MH from KetQua group by MaSV) as b1) as b2 on b3.so_MH=b2.so_Max_MH
group by b3.MaSV,b3.tenSV
/*==========================H. Truy vấn dùng phép chia =========================*/
--72. Cho biết những môn được tất cả các sinh viên theo học. 

--count số sv rồi count số sv học mỗi môn, rồi join 2 bảng lại đặt điều kiện môn nào có số sv học = tổng số sv là oke
select DMMh.TenMH from DMMH inner join 
(select b2.MaMH  from
(select count(MaSV) as tong_SV from DMSV ) as b1 inner join
(select MaMH,count( distinct MaSV ) as so_sv_moi_mon from KetQua group by MaMH) as b2 on b1.tong_SV=b2.so_sv_moi_mon) as b3 on DMMH.MaMH=b3.MaMH

--73. Cho biết những sinh viên học những môn giống sinh viên có mã số A02 học. 
select b7.MaSV from
(select b5.MaSV,count(b5.MaMH) as so_SV from
(select distinct KetQua.MaSV,KetQua.MaMH from KetQua inner join
(select  b1.MaSV from
(select MaSV, count(distinct case when MaSV!='A02' then MaMH else null end) so_sv from KetQua where MaSV !='A02' group by MaSV ) as b1
inner join
(select count(distinct case when MaSV='A02' then MaMH else null end)so_sv from KetQua) as b2 on b1.so_sv=b2.so_sv) as b3
on KetQua.MaSV=b3.MaSV) as b5 
inner join
(select distinct MaMH from KetQua where MaSV='A02') as b4 on b5.MaMH=b4.MaMH group by b5.MaSV) as b7
inner join
(select count(distinct MaMH) as so from KetQua where MaSV='A02') as b6 on b7.so_SV= b6.so

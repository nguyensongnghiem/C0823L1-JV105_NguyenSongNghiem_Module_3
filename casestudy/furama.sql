create database if not exists furama;
-- Tạo bảng vi_tri
create table vi_tri (
	ma_vi_tri INT  primary key auto_increment ,
    ten_vi_tri VARCHAR(45)    
);

-- Tạo bảng trinh_do
create table trinh_do (
	ma_trinh_do INT primary key auto_increment ,
    ten_trinh_do VARCHAR(45)    
);
create table bo_phan (
	ma_bo_phan INT primary key auto_increment ,
    ten_bo_phan VARCHAR(45)    
);
create table nhan_vien (
	ma_nhan_vien int primary key auto_increment ,
    ho_ten varchar(45),
    ngay_sinh date,
    so_cmnd varchar(45),
    luong double,
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45),
    ma_vi_tri int references vi_tri(ma_vi_tri),
    ma_trinh_do int references trinh_do(ma_trinh_do),
    ma_bo_phan int references bo_phan(ma_bo_phan)
);

create table dich_vu_di_kem (
	ma_dich_vu_di_kem INT primary key auto_increment ,
    ten_dich_vu_di_kem VARCHAR(45),
    gia DOUBLE,
    don_vi VARCHAR(10),
	trang_thai varchar(45)
);
create table loai_khach (
	ma_loai_khach INT primary key auto_increment ,
	ten_loai_khach varchar(45)	
);
create table khach_hang (
	ma_khach_hang int primary key auto_increment ,
    ma_loai_khach int references loai_khach(ma_loai_khach),
	ho_ten varchar(45),
    ngay_sinh date,
    gioi_tinh bit(1),
    so_cmnd varchar(45),
    so_dien_thoai varchar(45),
    email varchar(45),
    dia_chi varchar(45)
);

create table loai_dich_vu (
	ma_loai_dich_vu int primary key auto_increment ,
    ten_loai_dich_vu varchar(45)
);
create table kieu_thue (
	ma_kieu_thue int primary key auto_increment ,
    ten_kieu_thue varchar(45)
);
create table dich_vu (
	ma_dich_vu int primary key auto_increment ,
    ten_dich_vu varchar(45),
    dien_tich int,
    chi_phi_thue double,
    so_nguoi_toi_da int,
    ma_kieu_thue int references kieu_thue(ma_kieu_thue),
	ma_loai_dich_vu int references loai_dich_vu(ma_loai_dich_vu),
    tieu_chuan_phong varchar(45),
    mo_ta_tien_nghi_khac varchar(45),
    dien_tich_ho_boi double,
    so_tang int,
    dich_vu_mien_phi_di_kem text
);
create table hop_dong (
	ma_hop_dong int primary key auto_increment ,
    ngay_lam_hop_dong datetime,
    ngay_ket_thuc_hop_dong datetime,
    tien_dat_coc double,
    ma_nhan_vien int references nhan_vien(ma_nhan_vien),
    ma_khach_hang int references khach_hang(ma_khach_hang),
    ma_dich_vu int references dich_vu(ma_dich_vu)
); 
create table hop_dong_chi_tiet (
	ma_hop_dong_chi_tiet int primary key auto_increment ,
    ma_hop_dong int references hop_dong(ma_hop_dong),
    so_luong int,
    ma_dich_vu_di_kem int references dich_vu_di_kem(ma_dich_vu_di_kem)
);



-- NHẬP DỮ LIỆU 
-- table vi_tri
insert into vi_tri( ma_vi_tri, ten_vi_tri) values (1, "Quản Lý");
insert into vi_tri( ma_vi_tri, ten_vi_tri) values (2, "Nhân Viên");

-- trinh_do
insert into trinh_do( ma_trinh_do, ten_trinh_do) values (1, "Trung Cấp");
insert into trinh_do( ma_trinh_do, ten_trinh_do) values (2, "Cao Đẳng");
insert into trinh_do( ma_trinh_do, ten_trinh_do) values (3, "Đại Học");
insert into trinh_do( ma_trinh_do, ten_trinh_do) values (4, "Sau Đại Học");
-- bo_phan
insert into bo_phan( ma_bo_phan, ten_bo_phan) values (1, "Sale-Marketing");
insert into bo_phan( ma_bo_phan, ten_bo_phan) values (2, "Hành Chính");
insert into bo_phan( ma_bo_phan, ten_bo_phan) values (3, "Phục Vụ");
insert into bo_phan( ma_bo_phan, ten_bo_phan) values (4, "Quản Lý");
-- nhan_vien
insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_Phan) values 
("Nguyễn Văn An","1970-11-07","456231786",10000000,"0901234121","annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng",1,3,1),
("Lê Văn Bình","1997-04-09","654231234",7000000,"934212314","binhlv@gmail.com","22 Yên Bái, Đà Nẵng",1,2,2),
("Hồ Thị Yến","1995-12-12","999231723",14000000,"0412352315","thiyen@gmail.com","K234/11 Điện Biên Phủ, Gia Lai",1,3,2),
("Nguyễn Bỉnh Phát","1999-12-09","454363232",6000000,"0902341231","phatphat@gmail.com","43 Yên Bái, Đà Nẵng",2,1,1),
("Khúc Nguyễn An Nghi","2000-11-08","964542311",7000000,"0978653213","annghi20@gmail.com","294 Nguyễn Tất Thành, Đà Nẵng",2,2,3),
("Nguyễn Hữu Hà","1993-01-01","534323231",8000000,"0941234553","nhh0101@gmail.com","4 Nguyễn Chí Thanh, Huế",2,3,2),
("Nguyễn Hà Đông","1989-09-03","234414123",9000000,"0642123111","donghanguyen@gmail.com","213 Hàm Nghi, Đà Nẵng",2,4,4),
("Tòng Hoang","1982-09-03","256781231",6000000,"0245144444","hoangtong@gmail.com","111 Hùng Vương, Hà Nội",2,4,4),
("Nguyễn Công Đạo","1994-01-08","755434343",8000000,"0988767111","nguyencongdao12@gmail.com","6 Hoà Khánh, Đồng Nai",2,3,2)
;

-- loai_khach
insert into loai_khach(ten_loai_khach) values ("Diamond"), ("Platinium"), ("Gold"), ("Silver"), ("Member");


-- khach_hang
insert into khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi,  ma_loai_khach) values 
("Nguyễn Thị Hào","1970-11-07",0,"643431213","0945423362","thihao07@gmail.com","23 Nguyễn Hoàng, Đà Nẵng",5),
("Phạm Xuân Diệu","1992-08-08",1,"865342123","0954333333","xuandieu92@gmail.com","K77/22 Thái Phiên, Quảng Trị",3),
("Trương Đình Nghệ","1990-02-27",1,"488645199","0373213122","nghenhan2702@gmail.com","K323/12 Ông Ích Khiêm, Vinh",1),
("Dương Văn Quan","1981-07-08",1,"543432111","0490039241","duongquan@gmail.com","K453/12 Lê Lợi, Đà Nẵng",1),
("Hoàng Trần Nhi Nhi","1995-12-09",0,"795453345","0312345678","nhinhi123@gmail.com","224 Lý Thái Tổ, Gia Lai",4),
("Tôn Nữ Mộc Châu","2005-12-06",0,"732434215","988888844","tonnuchau@gmail.com","37 Yên Thế, Đà Nẵng",4),
("Nguyễn Mỹ Kim","1984-04-08",0,"856453123","912345698","kimcuong84@gmail.com","K123/45 Lê Lợi, Hồ Chí Minh",1),
("Nguyễn Thị Hào","1999-04-08",0,"965656433","0763212345","haohao99@gmail.com","55 Nguyễn Văn Linh, Kon Tum",3),
("Trần Đại Danh","1994-07-01",1,"432341235","0643343433","danhhai99@gmail.com","24 Lý Thường Kiệt, Quảng Ngãi",1),
("Nguyễn Tâm Đắc","1989-07-01",1,"344343432","0987654321","dactam@gmail.com","22 Ngô Quyền, Đà Nẵng",2);

insert into kieu_thue(ten_kieu_thue) values ("year"), ("month"), ("day"), ("hour");

insert into loai_dich_vu(ten_loai_dich_vu) values ("Villa"), ("House"), ("Room");



insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,dien_tich_ho_boi,so_tang,dich_vu_mien_phi_di_kem,ma_kieu_thue,ma_loai_dich_vu) values
('Villa Beach Front',25000,1000000,10,'vip','Có hồ bơi',500,4,null,3,1),('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp',4,3),('Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,null,3,1),
('House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,null,3,2),('Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,'1 Xe máy',4,3);

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai) values 
('Karaoke',10000,'giờ','tiện nghi, hiện tại'),('Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
('Thuê xe đạp',20000,'chiếc','tốt'),('Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),('Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc_hop_dong,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu) values
('2020-12-08','2020-12-08',0,3,1,3),('2020-07-14','2020-07-21',200000,7,3,1),
('2021-03-15','2021-03-17',50000,3,4,2),('2021-01-14','2021-01-18',100000,7,5,5),
('2021-07-14','2021-07-15',0,7,2,6),('2021-06-01','2021-06-03',0,7,7,6),
('2021-09-02','2021-09-05',100000,7,4,4),('2021-06-17','2021-06-18',150000,3,4,1),
('2020-11-19','2020-11-19',0,3,4,3),('2021-04-12','2021-04-14',0,10,3,5),
('2021-04-25','2021-04-25',0,2,2,1),('2021-05-25','2021-05-27',0,7,10,1);

insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem) values
(5,2,4),(8,2,5),(15,2,6),(1,3,1),(11,3,2),(1,1,3),(2,1,2),(2,12,2);

-- SQL CƠ BẢN

-- Câu 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.

select * 
from nhan_vien 
where ((ho_ten like "H%") or (ho_ten like "T%") or (ho_ten like "K%"));

select * 
from nhan_vien 
where ((ho_ten like "H%") or (ho_ten like "T%") or (ho_ten like "K%")) and length(ho_ten)<=11;

-- Câu 3 

select *
from khach_hang
where (timestampdiff(YEAR,ngay_sinh,CURDATE()) between 17 and 51) and (instr(dia_chi,"Quảng Trị") <>0 or instr(dia_chi,"Đà Nẵng") <>0) ;

select ho_ten, timestampdiff(YEAR,ngay_sinh,CURDATE()) as age
from khach_hang
where (timestampdiff(YEAR,ngay_sinh,CURDATE()) between 17 and 51) and (instr(dia_chi,"Quảng Trị") <>0 or instr(dia_chi,"Đà Nẵng") <>0) ;

select ho_ten, (datediff(CURDATE(),ngay_sinh)/365.25) as age
from khach_hang
where (timestampdiff(YEAR,ngay_sinh,CURDATE()) between 17 and 51) and (instr(dia_chi,"Quảng Trị") <>0 or instr(dia_chi,"Đà Nẵng") <>0) 
order by age desc; 


-- Câu 4

select k.ho_ten, count(h.ma_hop_dong) as so_hop_dong , l.ten_loai_khach
from hop_dong h
join khach_hang k on k.ma_khach_hang = h.ma_khach_hang
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
group by h.ma_khach_hang
having l.ten_loai_khach = "Diamond"
order by so_hop_dong desc;


-- câu 5
select k.ma_khach_hang, k.ho_ten, h.ma_hop_dong  , d.ten_dich_vu, d.chi_phi_thue as chi_phi_thue, dk.ten_dich_vu_di_kem
from khach_hang k
left join hop_dong h on h.ma_khach_hang = k.ma_khach_hang
left join hop_dong_chi_tiet hc on hc.ma_hop_dong = h.ma_hop_dong
left join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
left join dich_vu_di_kem dk on dk.ma_dich_vu_di_kem = hc.ma_dich_vu_di_kem
;

select k.ma_khach_hang, k.ho_ten, h.ma_hop_dong, h.ngay_lam_hop_dong, d.ten_dich_vu, d.chi_phi_thue as chi_phi_thue, 
	group_concat(dk.ten_dich_vu_di_kem separator ",") as dich_vu_kem_theo, sum(dk.gia*hc.so_luong)+chi_phi_thue as tong_chi_phi
from khach_hang k
left join hop_dong h on h.ma_khach_hang = k.ma_khach_hang
left join hop_dong_chi_tiet hc on hc.ma_hop_dong = h.ma_hop_dong
left join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
left join dich_vu_di_kem dk on dk.ma_dich_vu_di_kem = hc.ma_dich_vu_di_kem
group by h.ma_hop_dong
;


select k.ma_khach_hang, k.ho_ten, lk.ten_loai_khach, h.ma_hop_dong, h.ngay_lam_hop_dong, d.ten_dich_vu, 
	group_concat(dk.ten_dich_vu_di_kem separator ",") as dich_vu_kem_theo, sum(dk.gia*hc.so_luong)+chi_phi_thue as tong_chi_phi
from khach_hang k
left join hop_dong h on h.ma_khach_hang = k.ma_khach_hang
left join hop_dong_chi_tiet hc on hc.ma_hop_dong = h.ma_hop_dong
left join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
left join dich_vu_di_kem dk on dk.ma_dich_vu_di_kem = hc.ma_dich_vu_di_kem
left join loai_khach lk on lk.ma_loai_khach = k.ma_loai_khach
group by h.ma_hop_dong;

-- Câu 6
select d.ma_dich_vu,d.ten_dich_vu, d.chi_phi_thue,d.dien_tich, l.ten_loai_dich_vu
from dich_vu d
left join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
left join loai_dich_vu l on l.ma_loai_dich_vu = d.ma_loai_dich_vu 
where h.ngay_lam_hop_dong not between "2021-03-31" and current_date()
group by d.ma_dich_vu ;


-- Câu 7

select d.ma_dich_vu,d.ten_dich_vu, d.chi_phi_thue,d.dien_tich, l.ten_loai_dich_vu, h.ngay_lam_hop_dong
from dich_vu d
left join hop_dong h on d.ma_dich_vu = h.ma_dich_vu
left join loai_dich_vu l on l.ma_loai_dich_vu = d.ma_loai_dich_vu 
;

SELECT dich_vu.ma_dich_vu, dich_vu.ten_dich_vu, dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu,dich_vu.so_nguoi_toi_da
from dich_vu
left JOIN loai_dich_vu ON dich_vu.ma_loai_dich_vu = loai_dich_vu.ma_loai_dich_vu
WHERE  dich_vu.ma_dich_vu in (
        SELECT distinct ma_dich_vu
        FROM hop_dong
        WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2020
)
and dich_vu.ma_dich_vu not in (
        SELECT distinct ma_dich_vu
        FROM hop_dong
        WHERE YEAR(hop_dong.ngay_lam_hop_dong) = 2021
) ;

-- Câu 8
select distinct k.ho_ten
from khach_hang k;
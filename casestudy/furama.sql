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



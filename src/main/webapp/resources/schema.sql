CREATE USER 'auctionuser'@'%' IDENTIFIED BY 'mysql';

CREATE DATABASE `auctiondb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

GRANT Alter ON auctiondb.* TO 'auctionuser'@'%';
GRANT Create ON auctiondb.* TO 'auctionuser'@'%';
GRANT Create view ON auctiondb.* TO 'auctionuser'@'%';
GRANT Delete ON auctiondb.* TO 'auctionuser'@'%';
GRANT Drop ON auctiondb.* TO 'auctionuser'@'%';
GRANT Grant option ON auctiondb.* TO 'auctionuser'@'%';
GRANT Index ON auctiondb.* TO 'auctionuser'@'%';
GRANT Insert ON auctiondb.* TO 'auctionuser'@'%';
GRANT References ON auctiondb.* TO 'auctionuser'@'%';
GRANT Select ON auctiondb.* TO 'auctionuser'@'%';
GRANT Show view ON auctiondb.* TO 'auctionuser'@'%';
GRANT Trigger ON auctiondb.* TO 'auctionuser'@'%';
GRANT Update ON auctiondb.* TO 'auctionuser'@'%';
GRANT Alter routine ON auctiondb.* TO 'auctionuser'@'%';
GRANT Create routine ON auctiondb.* TO 'auctionuser'@'%';
GRANT Create temporary tables ON auctiondb.* TO 'auctionuser'@'%';
GRANT Execute ON auctiondb.* TO 'auctionuser'@'%';
GRANT Lock tables ON auctiondb.* TO 'auctionuser'@'%';
GRANT Grant option ON auctiondb.* TO 'auctionuser'@'%';

DROP TABLE IF EXISTS member;
CREATE TABLE member (
	mno	bigint NOT NULL auto_increment,
	id varchar(100)	NOT NULL,
	email varchar(100) NOT NULL,
	pwd	varchar(100) NOT NULL,
	nick_name varchar(100) NOT NULL,
	grade int default '1',
	report_count int default '0',
	member_img varchar(1000) default '0',
	reg_at datetime	default current_timestamp,
	del_at datetime	default NULL,
	primary key(mno)
) default CHARSET=utf8mb4;

DROP TABLE IF EXISTS product;
CREATE TABLE product (
	pno	bigint NOT NULL auto_increment,
	category varchar(100) NOT NULL,
	pname varchar(100) NOT NULL,
	description text NOT NULL,
	read_count int default 0,
	writer bigint NOT NULL,
	product_img	varchar(3000) NOT NULL,
	status	tinyint	default 0,
	reserve_price bigint NOT NULL,
	highest_price bigint default 0,
	end_time datetime NOT NULL,
    reg_at datetime default current_timestamp,
	mod_at datetime default current_timestamp,
	primary key(pno)
)default CHARSET=utf8mb4;

DROP TABLE IF EXISTS image_file;
CREATE TABLE image_file (
	uuid varchar(256) NOT NULL,
	save_dir varchar(1000) NOT NULL,
	image_name varchar(1000) NOT NULL,
	image_size bigint NOT NULL,
	pno	bigint default NULL,
	mno	bigint default NULL,
	reg_at datetime default current_timestamp,
	primary key(uuid)
) default CHARSET=utf8mb4;

DROP TABLE IF EXISTS buy_bid;
CREATE TABLE buy_bid (
	bno	bigint NOT NULL auto_increment,
	buyer bigint NOT NULL,
	pno	bigint NOT NULL,
	bid_price int NOT NULL,
	bid_status tinyint default 0,
	bid_at datetime default current_timestamp,
	primary key(bno)
)default CHARSET=utf8mb4;

DROP TABLE IF EXISTS question;
CREATE TABLE question (
	qno bigint NOT NULL auto_increment,
	pno bigint NOT NULL references product(pno) on delete cascade,
	parent bigint default 0,
	content text NOT NULL,
	writer bigint NOT NULL,
	reg_at datetime default current_timestamp,
	mod_at datetime default current_timestamp,
	is_deleted tinyint default 0,
	is_answer tinyint default 0,
	primary key (qno)
) default CHARSET=utf8mb4;

DROP TABLE IF EXISTS interest;
CREATE TABLE interest (
	ino	bigint NOT NULL auto_increment,
	mno	bigint NOT NULL,
	pno	bigint NOT NULL,
	primary key(ino)
) default CHARSET=utf8mb4;

DROP TABLE IF EXISTS chat;
CREATE TABLE chat (
	cno	bigint NOT NULL auto_increment,
	content	text NOT NULL,
	read_chk tinyint NOT NULL,
	send_nick bigint NOT NULL,
	recv_nick bigint NOT NULL,
	room bigint NOT NULL,
	send_at	datetime default current_timestamp,
	primary key(cno)
) default CHARSET=utf8mb4;

DROP TABLE IF EXISTS review;
CREATE TABLE review (
	rvno bigint	NOT NULL auto_increment,
	pno	bigint NOT NULL,
	send_mno bigint NOT NULL,
	recv_mno bigint NOT NULL,
	content text NOT NULL,
	score int NOT NULL,
	reg_at datetime	default current_timestamp,
	primary key(rvno)
) default CHARSET=utf8mb4;

DROP TABLE IF EXISTS report;
CREATE TABLE report (
	rpno bigint NOT NULL auto_increment,
	mno bigint NOT NULL,
	target_mno bigint NOT NULL,
	report_title varchar(1000) NOT NULL,
	report_content text NOT NULL,
	reg_at datetime default current_timestamp,
	primary key(rpno)
) default CHARSET=utf8mb4;

--ALTER TABLE chat ADD constraint fk_send_nick foreign key (send_nick) references member(mno);
--ALTER TABLE chat ADD constraint fk_recv_nick foreign key (recv_nick) references member(mno);
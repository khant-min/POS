SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Voucher;




/* Create Tables */

CREATE TABLE Admin
(
	admin_id int NOT NULL AUTO_INCREMENT,
	name varchar(25),
	email varchar(20) NOT NULL,
	password varchar(20),
	created_at date,
	updated_at date,
	PRIMARY KEY (admin_id)
);


CREATE TABLE Category
(
	category_id int NOT NULL AUTO_INCREMENT,
	category_name varchar(25),
	product_id int NOT NULL,
	PRIMARY KEY (category_id)
);


CREATE TABLE Customer
(
	customer_id int NOT NULL AUTO_INCREMENT,
	address varchar(40),
	name varchar(25),
	phone_no varchar(10),
	email varchar(20),
	password varchar(25),
	created_at date,
	updated_at date,
	PRIMARY KEY (customer_id)
);


CREATE TABLE Payment
(
	payment_id int NOT NULL AUTO_INCREMENT,
	amount int,
	quantity int,
	customer_id int NOT NULL,
	product_id int NOT NULL,
	voucher_id int NOT NULL,
	PRIMARY KEY (payment_id)
);


CREATE TABLE Product
(
	product_id int NOT NULL AUTO_INCREMENT,
	name varchar(25),
	discount varchar(25),
	description varchar(100),
	price int,
	img varchar(30),
	created_at date,
	updated_at date,
	category_id int NOT NULL,
	PRIMARY KEY (product_id)
);


CREATE TABLE Voucher
(
	voucher_id int NOT NULL AUTO_INCREMENT,
	name varchar(20),
	date date,
	payment_status int,
	total_amount int,
	PRIMARY KEY (voucher_id)
);



/* Create Foreign Keys */

ALTER TABLE Product
	ADD FOREIGN KEY (category_id)
	REFERENCES Category (category_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Payment
	ADD FOREIGN KEY (customer_id)
	REFERENCES Customer (customer_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Payment
	ADD FOREIGN KEY (product_id)
	REFERENCES Product (product_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE Payment
	ADD FOREIGN KEY (voucher_id)
	REFERENCES Voucher (voucher_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;




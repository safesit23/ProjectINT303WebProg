/**************Table structure for table account *******************/
DROP TABLE account;

CREATE TABLE account (
  accountId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1),
  username varchar(50) NOT NULL,
  password varchar(40) NOT NULL,
  firstName varchar(50) NOT NULL,
  lastName varchar(30) NOT NULL,
  nickname varchar(30) NOT NULL,
  sex char(1) check (sex in ('F','M')) NOT NULL,
  dob date,
  phone varchar(50) NOT NULL,
  address varchar(250) DEFAULT NULL,
  province varchar(50) DEFAULT NULL,
  postalCode varchar(5) DEFAULT NULL,
  country varchar(50) DEFAULT NULL,
  activatekey varchar(40) NOT NULL,
  activatedate timestamp,

  CONSTRAINT account_accId_pk PRIMARY KEY (accountid),
  CONSTRAINT account_username_uk unique (username)
) ;

/*Data for table account */
insert into account(username,password,firstName,lastName,nickname,sex,phone) values 
('test@test.com','test','FirstName','LastName','Admin','M','0123456789');


/*********************Table structure for table product *********************/
DROP TABLE  shoe;

CREATE TABLE shoe (
  shoeId varchar(10) NOT NULL,
  shoeName varchar(70) NOT NULL,
  color varchar(15) NOT NULL,
  shoeType varchar(20) NOT NULL,
  brand varchar(20) NOT NULL,
  price int NOT NULL,

  CONSTRAINT shoe_shoeId_pk PRIMARY KEY (shoeId),
) ;

/*Data for the table product */
insert  into product(shoeId,shoeName,color,shoeType,brand,price) values 
('NI001SH200','NikeAir','black','running','nike',3000),




/********************Table structure for table payment ********************/

DROP TABLE payment;

CREATE TABLE payment (
  paymentId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1001, INCREMENT BY 1),
  paymentDate date NOT NULL,
  paymentMethod varchar(20) NOT NULL,
  paymentAmount decimal(10,2) NOT NULL,

  CONSTRAINT payment_paymentId_pk PRIMARY KEY (paymentId)
) ;

/*Data for the table payment */
insert into payment(paymentDate,paymentMethod,paymentDate,amount) values 
('2018-10-14','credit card',5000.50);


/*******************Table structure for table order *****************/
DROP TABLE orders;

CREATE TABLE orders (
  orderId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 6013001, INCREMENT BY 1),
  orderDate date NOT NULL,
  shipTo address varchar(250) NOT NULL,
  requiredDate date NOT NULL,
  shippedDate date DEFAULT NULL,
  status varchar(15) NOT NULL,
  comments clob,
  accountId int NOT NULL,
  CONSTRAINT orders_orderId_pk PRIMARY KEY (orderId),
  CONSTRAINT orders_accountId_fk FOREIGN KEY (accountId) REFERENCES account (accountId)
) ;

/*Data for the table orders */

insert  into orders(orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber) values 
(10100,'2003-01-06','2003-01-13','2003-01-10','Shipped',NULL,363),
(10101,'2003-01-09','2003-01-18','2003-01-11','Shipped','Check on availability.',128);







/*Table structure for table productline */

DROP TABLE productline;

CREATE TABLE productline (
  productLine varchar(50) NOT NULL,
  textDescription varchar(4000) DEFAULT NULL,
  htmlDescription clob,
  image blob,
  PRIMARY KEY (productLine)
) ;

/*Data for the table productlines */

insert  into productline(productLine,textDescription,htmlDescription,image) values 
('Classic Cars','Attention car enthusiasoffice.',NULL,NULL),
('Vintage Cars','Our Vintage Car models realistically portray automobile office.',NULL,NULL);

/*Table structure for table orderdetails */

DROP TABLE orderdetail;

CREATE TABLE orderdetail (
  orderNumber int NOT NULL,
  productCode varchar(15) NOT NULL,
  quantityOrdered int NOT NULL,
  priceEach decimal(10,2) NOT NULL,
  orderLineNumber smallint NOT NULL,
  PRIMARY KEY (orderNumber,productCode),
  CONSTRAINT orderdetails_ibfk_1 FOREIGN KEY (orderNumber) REFERENCES orders (orderNumber),
  CONSTRAINT orderdetails_ibfk_2 FOREIGN KEY (productCode) REFERENCES product (productCode)
) ;

/*Data for the table orderdetails */

insert  into orderdetail (orderNumber,productCode,quantityOrdered,priceEach,orderLineNumber) values 
(10100,'S18_1749',30,136.00,3);



/********************Table structure for table sizestock ********************/
DROP TABLE sizespecific;
CREATE table sizespecific(
  shoeId varchar(10) NOT NULL,
  shoeSize int NOT NULL,
  CONSTRAINT stocksize_sIdSize_pk PRIMARY KEY (shoeId,shoeSize)
);






/*end of statements */
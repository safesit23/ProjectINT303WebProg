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


/********************Table structure for table payment ********************/

DROP TABLE payment;

CREATE TABLE payment (
  customerNumber int NOT NULL,
  checkNumber varchar(50) NOT NULL,
  paymentDate date NOT NULL,
  amount decimal(10,2) NOT NULL,
  PRIMARY KEY (customerNumber,checkNumber),
  CONSTRAINT payments_ibfk_1 FOREIGN KEY (customerNumber) REFERENCES customer (customerNumber)
) ;

/*Data for the table payments */

insert  into payment(customerNumber,checkNumber,paymentDate,amount) values 
(103,'HQ336336','2004-10-19',6066.78);


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


/*Table structure for table product */

DROP TABLE  product;

CREATE TABLE product (
  productCode varchar(15) NOT NULL,
  productName varchar(70) NOT NULL,
  productLine varchar(50) NOT NULL,
  productScale varchar(10) NOT NULL,
  productVendor varchar(50) NOT NULL,
  productDescription clob NOT NULL,
  quantityInStock smallint NOT NULL,
  buyPrice decimal(10,2) NOT NULL,
  MSRP decimal(10,2) NOT NULL,
  PRIMARY KEY (productCode),
  CONSTRAINT products_ibfk_1 FOREIGN KEY (productLine) REFERENCES productline (productLine)
) ;

/*Data for the table products */

insert  into product(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP) values 
('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','Min Lin Diecast','This ttention.',7933,48.81,95.70),







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
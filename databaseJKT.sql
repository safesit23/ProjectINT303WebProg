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
insert into account(username,password,firstName,lastName,nickname,sex,phone,activatekey) values 
('test@test.com','test','FirstName','LastName','Admin','M','0123456789','activatekey');


/*********************Table structure for table shoe *********************/
DROP TABLE  shoe;

CREATE TABLE shoe (
  shoeId varchar(10) NOT NULL,
  shoeName varchar(70) NOT NULL,
  color varchar(15) NOT NULL,
  shoeType varchar(20) NOT NULL,
  shoeType2 varchar(10) check (shoeType2 in ('MEN','WOMEN','ALL')) NOT NULL,
  brand varchar(20) NOT NULL,
  price int NOT NULL,

  CONSTRAINT shoe_shoeId_pk PRIMARY KEY (shoeId)
) ;

/*Data for the table shoe */
insert  into shoe(shoeId,shoeName,color,shoeType,shoeType2,brand,price) values
('NI001SH200','Nike01','black','running','MEN','nike',1000),
('NI002SH200','Nike02','white','sport','WOMEN','nike',2000),
('NI003SH200','Nike03','black','training','ALL','nike',3000),
('NI004SH200','Nike04','white','running','ALL','nike',4000),
('AD005SH200','Adidas01','black','running','MEN','adidas',5000),
('AD006SH200','Adidas02','white','running','MEN','adidas',6000),
('FL007SH200','Fila01','black','running','WOMEN','fila',8000),
('NE008SH200','NewBalance01','white','running','ALL','new balance',8000),
('SK009SH200','skechers01','black','running','WOMEN','skechers',9000),
('SK010SH200','skechers02','white','running','MEN','skechers',9990);

/********************Table structure for table sizeSpecific ********************/
DROP TABLE sizeSpecific;

CREATE table sizeSpecific(
  shoeId varchar(10) NOT NULL,
  shoeSize int NOT NULL,
  CONSTRAINT sizeSpecific_sIdSize_pk PRIMARY KEY (shoeId,shoeSize),
  CONSTRAINT sizeSpecific_shoeId_fk FOREIGN KEY (shoeId) REFERENCES shoe(shoeId)
);

/*Data for the table sizeSpecific */
insert into sizeSpecific(shoeId,shoeSize) values
('NI001SH200',7),
('NI001SH200',9),
('NI001SH200',10),
('NI002SH200',7),
('NI002SH200',8),
('NI002SH200',9),
('NI002SH200',10),
('NI002SH200',11),
('NI003SH200',8),
('NI003SH200',9),
('NI003SH200',10),
('NI004SH200',8),
('NI004SH200',9),
('NI004SH200',10),
('NI004SH200',11),
('AD005SH200',8),
('AD005SH200',9),
('AD005SH200',10),
('AD005SH200',12),
('AD006SH200',7),
('AD006SH200',9),
('AD006SH200',10),
('FL007SH200',7),
('FL007SH200',9),
('FL007SH200',10),
('NE008SH200',10),
('NE008SH200',11),
('NE008SH200',12),
('SK009SH200',9),
('SK009SH200',10),
('SK009SH200',11),
('SK009SH200',12),
('SK010SH200',7),
('SK010SH200',8);




/*******************Table structure for table orders *****************/
DROP TABLE orders;

CREATE TABLE orders (
  orderId int NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 6013001, INCREMENT BY 1),
  orderDate date NOT NULL,
  shipTo varchar(250) NOT NULL,
  shippedDate date NOT NULL,
  totalPrice decimal(10,2) NOT NULL,
  accountId int NOT NULL,
  CONSTRAINT order_orderId_pk PRIMARY KEY (orderId),
  CONSTRAINT order_accountId_fk FOREIGN KEY (accountId) REFERENCES account (accountId)
) ;

/*Data for the table orders */
insert into orders(orderDate,shipTo,shippedDate, totalPrice,accountId) values
('2018-11-01','BangkokTH','2018-11-08',1000,1);


/*********************Table structure for table orderDetail *********************/
DROP TABLE orderDetail;

CREATE TABLE orderDetail (
  orderId int NOT NULL,
  shoeId varchar(10) NOT NULL,
  shoeSize int NOT NULL,
  quantity int NOT NULL,
  price decimal(10,2) NOT NULL,
  CONSTRAINT orderdetail_orderId_pk PRIMARY KEY (orderId,shoeId,shoeSize),
  CONSTRAINT orderdetail_orderId_fk1 FOREIGN KEY (orderId) REFERENCES orders (orderId),
  CONSTRAINT orderdetail_shoeId_fk2 FOREIGN KEY (shoeId) REFERENCES shoe (shoeId)
) ;

/*Data for the table orderDetail */
insert  into orderDetail (orderId,shoeId,shoeSize,quantity,price) values
(6013001,'NI001SH200',9,1,3000);

/*********************Table structure for table voucher *********************/
DROP TABLE voucher;

CREATE TABLE voucher (
  voucherId varchar(10) NOT NULL,
  voucherValue int NOT NULL,
  minSpend int DEFAULT 0,
  validate varchar(5) check (validate in ('true','false')) DEFAULT 'true',
  comment varchar(40) DEFAULT NULL,

  CONSTRAINT voucher_vId_pk PRIMARY KEY (voucherId)
);

insert  into voucher(voucherId,voucherValue,minSpend) values
('NEW100',100,1500);
/*end of statements */
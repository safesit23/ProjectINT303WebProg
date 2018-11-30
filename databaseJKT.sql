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
insert into account(username,password,firstName,lastName,nickname,sex,phone,activatekey,activatedate) values 
('test@test.com','98f6bcd4621d373cade4e832627b4f6','FirstName','LastName','Admin','M','0123456789','activatekey','2018-11-22 11:55:58.881');


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
('NI001SH200','Nike_Epic_React_Flyknit','pure_platinum','running','WOMEN','nike',5500),
('NI002SH200','Nike_Epic_React_Flyknit','black','running','MEN','nike',5500),
('NI003SH200','Nike_Epic_React_Flyknit','grey','running','WOMEN','nike',5800),
('NI004SH200','Nike_Epic_React_Flyknit','navy','running','MEN','nike',5500),
('NI097SH200','Nike_Quest','metallic','running','MEN','nike',2700),
('NI098SH200','Nike_Oceania_Textile','black','lifestyle','WOMEN','nike',2300),
('NI099SH200','Nike_Air_Zoom_Pegasus_35_GPX_RS','black/white ','running','WOMEN','nike',5000),
('NI100SH200','Nike_Epic_React_Flyknit','black','running','WOMEN','nike',5500),
('NI101SH200','Nike_Vapor_12_Elite_(FG)','blue','sport','ALL','nike',8500),
('NI102SH200','Nike_Quest','black','running','WOMEN','nike',2700),



('FL007SH200','Fila_Riley','navy/pink','running','WOMEN','fila',1990),
('FL038SH200','Fila_Tadeo','gray','sport','MEN','fila',1990),
('FL039SH200','Fila_Tyler','gray','sport','MEN','fila',1590),
('FL040SH200','Fila_SP-Tex_Space','Turquoise','sport','WOMEN','fila',1590),
('FL041SH200','Fila_SP-Tex_Space ','orange','sport','WOMEN','fila',1590),
('FL042SH200','Fila_Disruptor','white/navy','lifestyle','WOMEN','fila',1990),
('FL043SH200','Fila_Robin','white/blue','sport','WOMEN','fila',1790),
('FL044SH200','Fila_SP-Tex_Space','navy','sport','MEN','fila',1590),
('FL045SH200','Fila_Ryan','peach','running','WOMEN','fila',1790),
('FL046SH200','Fila_Rae','orange','sport','WOMEN','fila',1990),
 

('NE067SH200','NewBalance_M996CFISL_D_MIUS','gray/navy','lifestyle','MEN','new balance',3996),
('NE068SH200','NewBalance_CT10','cream','lifestyle','WOMEN','new balance',1990),
('NE069SH200','NewBalance_CRT300RN_D_COURT','black','lifestyle','MEN','new balance',2950),
('NE070SH200','NewBalance_AM617CEL_617','white/green','lifestyle','MEN','new balance',2490),
('NE071SH200','NewBalance_AM617SOX_2E_SKATE','blur/red','lifestyle','MEN','new balance',2490),
('NE072SH200','NewBalance_Fresh_Foam_Cruz_Sport','white','running','WOMEN','new balance',2990),
('NE073SH200','NewBalance_247_Deconstructed','white','lifestyle','MEN','new balance',4290),
('NE074SH200','NewBalance_AM617BRU_2E_SKATE','black','lifestyle','MEN','new balance',2490),
('NE075SH200','NewBalance_CT10','black','lifestyle','WOMEN','new balance',1990),
('NE076SH200','NewBalance_CT10','black','lifestyle','MEN','new balance',1990),



('SK009SH200','skechers_Gorun_Mojo-Inspirate','charcoal','running','WOMEN','skechers',2790),
('SK010SH200','skechers_Lites_3.0','black/tan','lifestyle','WOMEN','skechers',3495),
('SK123SH200','skechers_Gorun_Mojo-Inspirate','black/white','running','WOMEN','skechers',2790),
('SK124SH200','skechers_Lites_3.0','tan','lifestyle','WOMEN','skechers',3495),
('SK125SH200','skechers_Microburst_Botanical_Paradise_WA','taupe','lifestyle','WOMEN','skechers',2550),
('SK126SH200','skechers_Wave_Lite-Good_Nature','dark_natural','lifestyle','WOMEN','skechers',2490),
('SK127SH200','skechers_Go_Run_600-Reactor','navy/grey','running','WOMEN','skechers',2750),
('SK128SH200','skechers_Modern_Cool-Plutonic','black','lifestyle','MEN','skechers',1690),
('SK129SH200','skechers_Meridian','rose','lifestyle','WOMEN','skechers',2790),
('SK130SH200','skechers_Wave-Lite-Magical_Adventure','gray','running','WOMEN','skechers',2490),


('AD005SH200','Adidas_Adilette_Comfort','black','lifestyle','MEN','adidas',1300),
('AD006SH200','Adidas_Pureboost_Go','white','running','WOMEN','adidas',4500),
('AD011SH200','Adidas_Ultraboost_LTD','black/white','running','MEN','adidas',8000),
('AD012SH200','Adidas_Pureboost_Go','red','running','WOMEN','adidas',4500),
('AD013SH200','Adidas_Pureboost_Go','maroon','running','MEN','adidas',4500),
('AD014SH200','Adidas_Ultraboost_LTD','black','running','MEN','adidas',8000),
('AD015SH200','Adidas_Pureboost X','pearl','running','WOMEN','adidas',5000),
('AD016SH200','Adidas_Ultraboost','green','running','WOMEN','adidas',6500),
('AD017SH200','Adidas_Ultraboost','black','running','MEN','adidas',6500),
('AD018SH200','Adidas_Ultraboost_LTD','black/white','running','MEN','adidas',8000);

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
('NI001SH200',8),
('NI001SH200',9),
('NI001SH200',10),

('NI002SH200',8),
('NI002SH200',10),

('NI003SH200',9),
('NI003SH200',10),
('NI003SH200',11),

('NI004SH200',8),
('NI004SH200',9),
('NI004SH200',10),
('NI004SH200',11),

('NI097SH200',10),
('NI097SH200',11),

('NI098SH200',7),
('NI098SH200',8),
('NI098SH200',9),
('NI098SH200',10),

('NI099SH200',9),
('NI099SH200',10),

('NI100SH200',9),

('NI101SH200',10),
('NI101SH200',12),

('NI102SH200',7),
('NI102SH200',9),





('FL007SH200',8),
('FL007SH200',9),
('FL007SH200',10),

('FL038SH200',10),
('FL038SH200',11),

('FL039SH200',6),
('FL039SH200',7),
('FL039SH200',8),
('FL039SH200',9),
('FL039SH200',10),
('FL039SH200',11),
('FL039SH200',12),

('FL040SH200',6),
('FL040SH200',7),
('FL040SH200',8),
('FL040SH200',9),
('FL040SH200',10),
('FL040SH200',11),
('FL040SH200',12),

('FL041SH200',8),
('FL041SH200',9),
('FL041SH200',10),
('FL041SH200',12),

('FL042SH200',9),
('FL042SH200',10),
('FL042SH200',11),

('FL043SH200',9),

('FL044SH200',9),
('FL044SH200',10),
('FL044SH200',11),

('FL045SH200',10),
('FL045SH200',11),
('FL045SH200',12),

('FL046SH200',6),
('FL046SH200',7),
('FL046SH200',10),





('NE067SH200',6),
('NE067SH200',7),
('NE067SH200',8),
('NE067SH200',9),

('NE068SH200',7),
('NE068SH200',8),
('NE068SH200',9),
('NE068SH200',10),
('NE068SH200',11),

('NE069SH200',6),
('NE069SH200',7),
('NE069SH200',9),
('NE069SH200',12),

('NE070SH200',9),
('NE070SH200',10),
('NE070SH200',11),

('NE071SH200',7),
('NE071SH200',8),
('NE071SH200',9),
('NE071SH200',10),
('NE071SH200',11),
('NE071SH200',12),

('NE072SH200',12),

('NE073SH200',11),

('NE074SH200',6),
('NE074SH200',7),
('NE074SH200',8),
('NE074SH200',9),
('NE074SH200',10),
('NE074SH200',11),

('NE075SH200',6),
('NE075SH200',7),
('NE075SH200',8),

('NE076SH200',9),



('SK009SH200',6),
('SK009SH200',7),
('SK009SH200',8),
('SK009SH200',9),
('SK009SH200',10),
('SK009SH200',11),

('SK010SH200',8),
('SK010SH200',9),
('SK010SH200',10),

('SK123SH200',9),

('SK124SH200',6),
('SK124SH200',7),
('SK124SH200',8),
('SK124SH200',11),

('SK125SH200',7),
('SK125SH200',8),
('SK125SH200',9),
('SK125SH200',10),

('SK126SH200',10),
('SK126SH200',12),

('SK127SH200',9),
('SK127SH200',10),
('SK127SH200',11),
('SK127SH200',12),

('SK128SH200',6),
('SK128SH200',7),
('SK128SH200',8),
('SK128SH200',9),
('SK128SH200',10),
('SK128SH200',11),

('SK129SH200',7),
('SK129SH200',8),
('SK129SH200',9),
('SK129SH200',10),
('SK129SH200',11),
('SK129SH200',12),

('SK130SH200',6),
('SK130SH200',7),
('SK130SH200',8),
('SK130SH200',9),
('SK130SH200',10),
('SK130SH200',11),



('AD005SH200',8),
('AD005SH200',9),
('AD005SH200',10),

('AD006SH200',9),
('AD006SH200',10),
('AD006SH200',11),
('AD006SH200',12),

('AD011SH200',6),
('AD011SH200',7),
('AD011SH200',8),
('AD011SH200',9),

('AD012SH200',6),
('AD012SH200',7),
('AD012SH200',8),
('AD012SH200',10),

('AD013SH200',8),
('AD013SH200',9),
('AD013SH200',10),
('AD013SH200',11),
('AD013SH200',12),

('AD014SH200',7),
('AD014SH200',8),
('AD014SH200',9),
('AD014SH200',10),
('AD014SH200',11),
('AD014SH200',12),

('AD015SH200',6),
('AD015SH200',7),
('AD015SH200',8),
('AD015SH200',9),
('AD015SH200',10),
('AD015SH200',11),
('AD015SH200',12),

('AD016SH200',7),
('AD016SH200',8),
('AD016SH200',9),
('AD016SH200',10),
('AD016SH200',11),
('AD016SH200',12),


('AD017SH200',9),
('AD017SH200',10),
('AD017SH200',11),

('AD018SH200',8),
('AD018SH200',9),
('AD018SH200',10),
('AD018SH200',11);




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
('JKT100',100,1500),
('JKT200',200,2500),
('JKT300',300,3000);
/*end of statements */
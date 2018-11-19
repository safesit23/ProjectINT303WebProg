# [ProjectINT303WebProg : JKT Shop](https://github.com/safesit23/ProjectINT303WebProg/)

## Initial Project

To begin this project:
* Clone the repo: `https://github.com/safesit23/ProjectINT303WebProg.git`

### Project Structure
```
ProjectINT303WebProg/
└── databaseJKT.sql
└── ProjectJKTShop/
    ├── web/
    │   ├── css             : เขียน css
    │   ├── bootstrap
    │   ├── images/
    |   |      ├── content  : เก็บภาพที่ใช้ตามหน้าต่างๆ
    |   |      ├── carousel : เก็บภาพ Promotion
    |   |      └── shoes    : เก็บภาพสินค้าทั้งหมด
    │   ├── include/
    |   |      ├── header.jsp
    |   |      ├── navbar.jsp
    |   |      └── footer.jsp
    │   ├── index.jsp
    │   └── Page.jsp       (หน้า JSP ทุกหน้า)
    └── src/java/
        ├── model
        ├── servlet
        └── controller
```

## Database
* Database Name: projectint303
* UserName/Password: app
* Execute SQL Command sql: [databaseJKT](https://github.com/safesit23/ProjectINT303WebProg/blob/master/databaseJKT.sql)

### Table
Have 6 Table:
* Account         
* shoe           
* sizeSpecific
* orders
* orderDetail
* voucher

### Data

#### Shoe
- Brand: nike, adidas, fila, skechers, new balance
- Insert `('shoeId','shoeName','color','type','type2','brand','price')`
- example : `('NI001SH200','NikeAir','black','running','MEN','nike',3000)`

#### SizeSpecific
- example : `('NI001SH200',7)`

#### Voucher Table
- example : 
`insert  into voucher(voucherId,voucherValue,minSpend) values
('NEW100',100,1500);`

## TOOLS (For project)
### [Material](https://material.io/tools/icons/?style=baseline)
for icon in website
* Example: `<i class="material-icons">person</i>`
* Change color to white: `class="md-light"`

### [fontawesome](https://fontawesome.com/icons?d=gallery)

### [Bootstrap v4.1.3](https://getbootstrap.com)


## Development & Product Management
### [Sourcetree](https://www.sourcetreeapp.com) or [GithubDesktop](https://desktop.github.com)
1. Allow to use Branch DEV Only
2. Every Commit must have prefix
  * [ADD] for add new file
  * [UPDATE] for edit in file (add/update/remove code)
  * [REMOVE] for remove file
3. Should commit-->pull-->config-->commt-->push

### [Trello](https://trello.com/b/EAqZi1hF/projectint303webpro)
for viewing todolist that you must be done
1. Now has 6 list : todopage,todo, doing, done, problem, resolve problem
2. color : RED-hard, Orange-normal, Green-Easy, Violet-Important
3. You can move card to update work

### [Figma](https://www.figma.com/files/team/639718251727099957/INT303-Webprog)
for watching wireframe of this web site.

### [Google Drive](https://drive.google.com/drive/folders/1iK_DfumIu-DqvwigPUIg_xvcU_yJVufW?usp=sharing)
for upload picture or add file if you cannot use git and use to write Proposal document

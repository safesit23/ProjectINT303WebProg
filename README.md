# [ProjectINT303WebProg : JKT Shop](https://github.com/safesit23/ProjectINT303WebProg/)

[![Preview](pic)]

## Download and Installation

To begin this project:
* Clone the repo: `https://github.com/safesit23/ProjectINT303WebProg.git`

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


## TOOLS
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

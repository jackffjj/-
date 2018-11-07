drop database bookstore;

create database bookstore character set gb2312;

use bookstore;

set names gb2312;

/*==============================================================*/
/* DBMS name:      MySQL 5.7                                */
/* Created on:     2017-7-4 上午 10:38:13                        */
/*==============================================================*/
drop table if exists book;
drop table if exists catalog;
drop table if exists orderitem;
drop table if exists orders;
drop table if exists user;
/*==============================================================*/
/* Table: book                                                  */
/*==============================================================*/
create table book
(
   bookid           		int auto_increment not null,
   catalogid            	int not null,
   bookname           	varchar(20) not null,
   price                	int not null,
   picture              	varchar(30) not null,
   primary key (bookid)
)default charset=gb2312;
/*==============================================================*/
/* Table: catalog                                               */
/*==============================================================*/
create table catalog
(
   catalogid           	int auto_increment not null,
   catalogname          	varchar(20) not null,
   primary key (catalogid)
)default charset=gb2312;
/*==============================================================*/
/* Table: orderitem                                             */
/*==============================================================*/
create table orderitem
(
   orderitemid          	int auto_increment not null,
   bookid               	int not null,
   orderid              	int not null,
   quantity             	int not null,
   primary key (orderitemid)
)default charset=gb2312;
/*==============================================================*/
/* Table: orders                                                */
/*==============================================================*/
create table orders
(
   orderid              	int auto_increment not null,
   userid               	int not null,
   orderdate            	timestamp not null,
   primary key (orderid)
)default charset=gb2312;
/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   userid               	int auto_increment not null,
   username             	varchar(20) not null,
   password             	varchar(20) not null,
   sex                  	varchar(4),
   age                  	int,
   primary key (userid)
)default charset=gb2312;

alter table book add constraint FK_Relationship_3 foreign key (catalogid)
      references catalog (catalogid) on delete restrict on update restrict;
alter table orderitem add constraint FK_Relationship_2 foreign key (orderid)
      references orders (orderid) on delete restrict on update restrict;
alter table orderitem add constraint FK_Relationship_4 foreign key (bookid)
      references book (bookid) on delete restrict on update restrict;
alter table orders add constraint FK_Relationship_1 foreign key (userid)
      references user (userid) on delete restrict on update restrict;

INSERT INTO catalog VALUES(1, '新书推荐');
INSERT INTO catalog VALUES(2, 'Web开发');
INSERT INTO catalog VALUES(3, '数据库应用');

INSERT INTO book VALUES(1, 1, 'Android实用教程', 45, 'Android.jpg');
INSERT INTO book VALUES(2, 2, 'ASP.NET项目开发教程', 45, 'ASP.NET.jpg');
INSERT INTO book VALUES(3, 2, 'Java EE基础实用教程（第2版）', 49, 'JavaEE.jpg');
INSERT INTO book VALUES(4, 2, 'Java EE实用教程（第2版）', 53, 'JavaEE2.jpg');
INSERT INTO book VALUES(5, 3, 'MySQL教程', 44, 'MySQL.jpg');
INSERT INTO book VALUES(6, 3, 'MySQL实用教程（第2版）', 59, 'MySQL2.jpg');
INSERT INTO book VALUES(7, 3, 'Oracle实用教程（11g版）', 49, 'Oracle11g.jpg');
INSERT INTO book VALUES(8, 3, 'Oracle实用教程（12c版）', 49, 'Oracle12c.jpg');
INSERT INTO book VALUES(9, 1, 'Qt 5开发及实例（第3版）', 99, 'Qt.jpg');
INSERT INTO book VALUES(10, 3, 'SQL Server实用教程（第4版）', 49, 'SQL Server.jpg');
INSERT INTO book VALUES(11, 1, 'Visual C++实用教程（第5版）', 59, 'VC++.jpg');

INSERT INTO user VALUES('gouwei','123456','male',22);
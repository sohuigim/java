#날짜 : 2024/07/08
#이름 : 김소희
#내용 : SQL 연습문제 1 실습하기

#실습 1-1
create database `shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on `shop`.* to 'shop'@'%';
flush privileges;

#실습 1-2
create table `Customer` (
	`custid`	VARCHAR(10) primary key,
	`name`	VARCHAR(10) not null,
	`hp`	CHAR(13),
	`addr`	VARCHAR(100),
	`rdate` datetime not null
);

drop table `customer`;

create table `Product`(
	`prodNo` int primary key,
    `prodName` VARCHAR(10) NOT NULL,
    `stock` int default 0,
    `price` int,
    `company` VARCHAR(20) NOT NULL
    );
    
CREATE TABLE `Order` (
	`orderNo` int primary key,
	`orderId` varchar(10) not null,
	`orderProduct` int not null,
	`orderCount` int default 1,
	`orderDate` datetime not null
	);

#실습 1-3
insert into `Customer` values ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
insert into `Customer` values ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
insert into `Customer` values ('c103', '장보고', '010-1234-1003', '완도군 정산면', '2022-01-03');
insert into `Customer` values ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
insert into `Customer` values ('c105', '이성계', null, null, '2022-01-05');
insert into `Customer` values ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
insert into `Customer` values ('c107', '허준', null, null, '2022-01-07');
insert into `Customer` values ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
insert into `Customer` values ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
insert into `Customer` values ('c110', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');


insert into `Product` values (1, '새우깡', 5000, 1500, '농심');
insert into `Product` values (2, '초코파이', 2500, 2500, '오리온');
insert into `Product` values (3, '포카칩', 3600, 1700, '오리온');
insert into `Product` values (4, '양파링', 1250, '1800', '오리온');
insert into `Product` values (5, '죠리퐁', 2200, null, '크라운');
insert into `Product` values (6, '마카렛트', 3500, 3500, '롯데');
insert into `Product` values (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

INSERT INTO `Order` VALUES (1,  'c102', 3, 2, '2022-07-01 13:15:10');
INSERT INTO `Order` VALUES (2,  'c101', 4, 1, '2022-07-01 14:16:11');
INSERT INTO `Order` VALUES (3,  'c108', 1, 1, '2022-07-01 17:23:18');
INSERT INTO `Order` VALUES (4,  'c109', 6, 5, '2022-07-02 10:46:36');
INSERT INTO `Order` VALUES (5,  'c102', 2, 1, '2022-07-03 09:15:37');
INSERT INTO `Order` VALUES (6,  'c101', 7, 3, '2022-07-03 12:35:12');
INSERT INTO `Order` VALUES (7,  'c110', 1, 2, '2022-07-03 16:55:36');
INSERT INTO `Order` VALUES (8,  'c104', 2, 4, '2022-07-04 14:23:23');
INSERT INTO `Order` VALUES (9,  'c102', 1, 3, '2022-07-04 21:54:34');
INSERT INTO `Order` VALUES (10, 'c107', 6, 1, '2022-07-05 14:21:03');

select * from `Order`;

#실습 1-4
select * from `Customer`;
#실습 1-5
select `custid`,`name`, `hp` from `Customer`;
#실습 1-6
select * from `Product`;
#실습 1-7
select `company` from `Product`;
#실습 1-8
select distinct`company` from `Product`;
#실습 1-9
select `prodName`,`price` from `Product`;
#실습 1-10
select `prodName`, `price` +500 as `조정단가` from `Product`;
#실습 1-11
select `prodName`, `stock`, `price` from `Product` where `company` ='오리온';
#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `OrderId` = 'c102';
#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` WHERE `OrderId` = 'c102'
AND `orderCount` >= 2;
#실습 1-14
select * from `Product` Where `price` between 1000 and 2000 ;
#실습 1-15
select custid, name, hp, addr from customer where name like '김%';
#실습 1-16
select custid, name, hp, addr from customer where name like '__';
#실습 1-17
select * from `customer` where `hp` is null;
#실습1-18
select 
	*
from `customer` where `addr` is not null;
#실습1-19
select 
	*
from `customer`
order by `rdate` desc;
#실습1-20
select * from `order` where `orderCount` >= 3
order by `orderCount` desc, `orderProduct` asc;
#실습1-21
select AVG(`price`) from `product`;
#실습1-22
select SUM(`stock`) as `재고량 합계` from `product` where `company` = '농심';
#실습1-23
select count(*) as `고객수` from `customer`;
#실습1-24
select count(distinct `company`) as `제조업체 수` from `product`;
#실습1-25
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

select 
	`orderProduct` as `주문 상품번호`,
    SUM(`orderCount`) as `총 주문수량`
from `order` group by `orderProduct`;

#실습1-26
select 
	`company` as `제조업체`,
	count(*) as `제품수`,
    max(`price`) as `최고가`    
 from `product` group by `company`;

#실습1-27
select 
	`company` as `제조업체`,
    count(*) as `제품수`,
    max(`price`) as `최고가`

from `product` 
group by `company`
having `제품수` >= 2;

#실습1-28
select 
	`orderProduct`,
    `orderId`,
    SUM(`orderCount`) as `총 주문수량`
    
from `order` 
group by `orderId`, `orderProduct`;

#실습1-29
select 
	a.orderId,
    b.prodName
from `order` as a
join `product` as b
on a.orderProduct = b.prodNo
where `orderId`='c102';

#실습1-30
select `orderid`, `name`, `prodName`, `orderDate` from `Order` as a
join `Customer` as b on a.orderId = b.custId
join `Product` as c on a.orderProduct = c.prodNo
where
	substr(`orderDate`, 1, 10) = '2022-07-03';
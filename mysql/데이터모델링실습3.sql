-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema shopping
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shopping` DEFAULT CHARACTER SET utf8 ;
USE `shopping` ;

-- -----------------------------------------------------
-- Table `shopping`.`Sellers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Sellers` (
  `sellerNo` INT NOT NULL,
  `sellerBizName` VARCHAR(45) NOT NULL,
  `sellerPhone` VARCHAR(20) NOT NULL,
  `sellerManager` VARCHAR(20) NOT NULL,
  `sellerAddr` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`sellerNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Categories` (
  `cateNo` INT NOT NULL,
  `cateName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cateNo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Products` (
  `prodNo` INT NOT NULL,
  `cateNo` INT NOT NULL,
  `prodName` VARCHAR(20) NOT NULL,
  `prodPrice` INT NOT NULL,
  `prodStock` INT NOT NULL DEFAULT 0,
  `prodSold` INT NULL DEFAULT 0,
  `prodDiscount` TINYINT NULL DEFAULT 0,
  `sellerNo` INT NOT NULL,
  PRIMARY KEY (`prodNo`, `cateNo`),
  INDEX `fk_Products_Sellers1_idx` (`sellerNo` ASC) VISIBLE,
  INDEX `fk_Products_Categories1_idx` (`cateNo` ASC) VISIBLE,
  UNIQUE INDEX `prodNo_UNIQUE` (`prodNo` ASC) VISIBLE,
  CONSTRAINT `fk_Products_Sellers1`
    FOREIGN KEY (`sellerNo`)
    REFERENCES `shopping`.`Sellers` (`sellerNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Products_Categories1`
    FOREIGN KEY (`cateNo`)
    REFERENCES `shopping`.`Categories` (`cateNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Users` (
  `userId` VARCHAR(20) NOT NULL,
  `userName` VARCHAR(20) NOT NULL,
  `userBirth` CHAR(10) NOT NULL,
  `userGender` CHAR(1) NOT NULL,
  `userHp` CHAR(13) NOT NULL,
  `userEmail` VARCHAR(45) NULL,
  `userPoint` INT NULL DEFAULT 0,
  `userLevel` TINYINT NULL DEFAULT 1,
  `userAddr` VARCHAR(100) NULL,
  `userRegDate` DATETIME NULL,
  PRIMARY KEY (`userId`),
  UNIQUE INDEX `userEmail_UNIQUE` (`userEmail` ASC) VISIBLE,
  UNIQUE INDEX `userHp_UNIQUE` (`userHp` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Orders` (
  `orderNo` CHAR(11) NOT NULL,
  `userId` VARCHAR(20) NOT NULL,
  `orderTotalPrice` INT NOT NULL,
  `orderAddr` VARCHAR(255) NOT NULL,
  `orderStatus` TINYINT NULL DEFAULT 0,
  `orderDate` DATETIME NOT NULL,
  PRIMARY KEY (`orderNo`, `userId`),
  INDEX `fk_Orders_Users_idx` (`userId` ASC) VISIBLE,
  UNIQUE INDEX `orderNo_UNIQUE` (`orderNo` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Users`
    FOREIGN KEY (`userId`)
    REFERENCES `shopping`.`Users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`Carts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Carts` (
  `cartNo` INT NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(20) NOT NULL,
  `prodNo` INT NOT NULL,
  `cartProdCount` INT NULL DEFAULT 1,
  `cartProdDate` DATETIME NULL,
  PRIMARY KEY (`cartNo`, `userId`, `prodNo`),
  INDEX `fk_Carts_Users1_idx` (`userId` ASC) VISIBLE,
  INDEX `fk_Carts_Products1_idx` (`prodNo` ASC) VISIBLE,
  CONSTRAINT `fk_Carts_Users1`
    FOREIGN KEY (`userId`)
    REFERENCES `shopping`.`Users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carts_Products1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `shopping`.`Products` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`Points`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`Points` (
  `pointNo` INT NOT NULL AUTO_INCREMENT,
  `userId` VARCHAR(20) NOT NULL,
  `point` INT NOT NULL,
  `pointDesc` VARCHAR(45) NOT NULL,
  `pointDate` DATETIME NOT NULL,
  PRIMARY KEY (`pointNo`, `userId`),
  INDEX `fk_Points_Users1_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `fk_Points_Users1`
    FOREIGN KEY (`userId`)
    REFERENCES `shopping`.`Users` (`userId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `shopping`.`OrderItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shopping`.`OrderItems` (
  `itemNo` INT NOT NULL AUTO_INCREMENT,
  `orderNo` CHAR(11) NOT NULL,
  `prodNo` INT NOT NULL,
  `itemPrice` INT NOT NULL,
  `itemDiscount` TINYINT NOT NULL,
  `itemCount` INT NULL DEFAULT 1,
  PRIMARY KEY (`itemNo`, `orderNo`, `prodNo`),
  INDEX `fk_OrderItems_Orders1_idx` (`orderNo` ASC) VISIBLE,
  INDEX `fk_OrderItems_Products1_idx` (`prodNo` ASC) VISIBLE,
  CONSTRAINT `fk_OrderItems_Orders1`
    FOREIGN KEY (`orderNo`)
    REFERENCES `shopping`.`Orders` (`orderNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItems_Products1`
    FOREIGN KEY (`prodNo`)
    REFERENCES `shopping`.`Products` (`prodNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET foreign_key_checks = 0;

insert into Users (userId, userName, userBirth, userGender, userHp, userEmail, userPoint, userLevel, userAddr, userRegDate)
values
('user1', '김유신', '1976-01-21', 'M', '010-1101-1976', 'kimys@naver.com', 0, 1, '서울', '2022-01-10 10:50:12'),
('user2', '계백', '1975-06-11', 'M', '010-1102-1975', null, 1000, 1, '서울', '2022-01-10 10:50:12'),
('user3', '김춘추', '1989-05-30', 'M', '010-1103-1989', null, 1200, 2, '서울', '2022-01-10 10:50:12'),
('user4', '이사부', '1979-04-13', 'M', '010-2101-1979', 'leesabu@gmail.com', 2600, 1, '서울', '2022-01-10 10:50:12'),
('user5', '장보고', '1966-09-12', 'M', '010-2104-1966', 'jangbg@naver.com', 9400, 4, '대전', '2022-01-10 10:50:12'),
('user6', '선덕여왕', '1979-07-28', 'M', '010-3101-1979', 'gueen@naver.com', 1600, 2, '대전', '2022-01-10 10:50:12'),
('user7', '강감찬', '1984-06-15', 'F', '010-4101-1984', 'kang@daum.net', 800, 0, '대구', '2022-01-10 10:50:12'),
('user8', '신사임당', '1965-10-21', 'M', '010-5101-1965', 'sinsa@gmail.com', 1500, 1, '대구', '2022-01-10 10:50:12'),
('user9', '이이', '1972-11-28', 'F', '010-6101-1972', 'leelee@nate.com', 3400, 3, '부산', '2022-01-10 10:50:12'),
('user10', '허난설헌', '1992-09-07', 'F', '010-7103-1992', null, 4100, 3, '광주', '2022-01-10 10:50:12');

insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user1', 1000, '회원가입 1000 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user1', 6000, '상품구매 5% 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user3', 2835, '상품구매 5% 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user7', 3610, '상품구매 5% 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user5', 3000, '이벤트 응모 3000 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user2', 1000, '회원가입 1000 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user2', 2000, '이벤트 응모 2000 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user2', 2615, '상품구매 5% 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user3', 1500, '이벤트 응모 1500 적립', now());
insert into `Points` (`userId`, `point`, `pointDesc`, `pointDate`) values ('user6', 15840, '상품구매 2% 적립', now());

insert into `Categories` values (10, '여성의류패션');
insert into `Categories` values (11, '남성의류패션');
insert into `Categories` values (12, '식품·생필품');
insert into `Categories` values (13, '취미·반려견');
insert into `Categories` values (14, '홈·문구');
insert into `Categories` values (15, '자동차·공구');
insert into `Categories` values (16, '스포츠·건강');
insert into `Categories` values (17, '컴퓨터·가전·디지털');
insert into `Categories` values (18, '여행');
insert into `Categories` values (19, '도서');

insert into sellers (sellerNo, sellerBizName, sellerPhone, sellerManager, sellerAddr) values
(10001, '(주)다팔아', '02-201-1976', '정우성', '서울'),
(10002, '판매의민족', '02-102-1975', '이정재', '서울'),
(10003, '멋남', '031-103-1989', '원빈', '경기'),
(10004, '스타일살아', '032-201-1979', '이나영', '경기'),
(10005, '(주)삼성전자', '02-214-1966', '장동건', '서울'),
(10006, '복실이옷짱', '051-301-1979', '고소영', '부산'),
(10007, '컴퓨존(주)', '055-401-1984', '유재석', '대구'),
(10008, '(주)LG전자', '02-511-1965', '강호동', '서울'),
(10009, '굿바디스포츠', '070-6101-1972', '조인성', '부산'),
(10010, '누리푸드', '051-710-1992', '강동원', '부산');

insert into orders(orderno,userid,ordertotalprice,orderaddr,orderstatus,orderdate)
values
('22010210001', 'user2' , 52300  ,'서울시 마포구 121' ,1, '2022-01-10 10:50:12'),
('22010210002', 'user3' , 56700  ,'서울시 강남구 21-1' ,1, '2022-01-10 10:50:12'),
('22010210010', 'user4' , 72200  ,'서울시 강서구 큰대로 38' ,2, '2022-01-10 10:50:12'),
('22010310001', 'user5' , 127000 ,'경기도 광주시 초월로 21' ,1, '2022-01-10 10:50:12'),
('22010310100', 'user1' , 120000 ,'경기도 수원시 120번지' ,0, '2022-01-10 10:50:12'),
('22010410101', 'user6' , 792000 ,'부산시 남구 21-1' ,2, '2022-01-10 10:50:12'),
('22010510021', 'user7' , 92200  ,'부산시 부산진구 56 10층', 4, '2022-01-10 10:50:12'),
('22010510027', 'user8' , 112000 ,'대구시 팔달로 19', 3, '2022-01-10 10:50:12'),
('22010510031', 'user10', 792000 ,'대전시 한밭로 24-1 ',2, '2022-01-10 10:50:12'),
('22010710110', 'user9' , 94500  ,'광주시 충열로 11 ',1, '2022-01-10 10:50:12');

insert into products (prodNo, cateNo, sellerNo, prodName, prodStock, prodPrice,prodsold, prodDiscount) values
(100101, 11, 10003, '반팔티 L~2XL',          869,    25000    ,132, 20),
(100110, 10, 10004, '트레이닝 통바지',          1602,    38000    ,398, 15),
(110101, 10, 10003, '신상 여성운동화',          160,    76000    ,40, 5),
(120101, 12, 10010, '암소 1등급 구이셋트 1.2kg',    null,    150000    ,87, 15),
(120103, 12, 10010, '바로구이 부채살 250g',       null,    21000    ,61, 10),
(130101, 13, 10006, '[ANF] 식스프리 강아지 사료',    58,    56000    ,142, 0),
(130112, 13, 10006, '중대형 사계절 강아지옷',       120,    15000    ,80, 0),
(141001, 14, 10001, '라떼 2인 소파/방수 패브릭',     null,    320000    ,42, 0),
(170115, 17, 10007, '지포스 3080 그래픽카드',    28,    900000    ,12, 12),
(160103, 16, 10009, '치닝디핑 33BR 철봉',       32,    120000    ,28, 0);

insert into OrderItems (orderNo, prodNo, itemPrice, itemDiscount, itemCount)
values
(22010210001, 100110, 38000, 15, 1),
(22010210001, 100101, 25000, 20, 1),
(22010210002, 120103, 21000, 10, 3),
(22010310001, 130112, 15000, 0, 1),
(22010310001, 130101, 56000, 0, 2),
(22010210010, 110101, 76000, 5, 1),
(22010310100, 160103, 120000, 0, 1),
(22010410101, 170115, 900000, 12, 1),
(22010510021, 110101, 76000, 5, 1),
(22010510027, 130101, 56000, 0, 2),
(22010510021, 100101, 25000, 20, 1),
(22010510031, 170115, 900000, 12, 1),
(22010710110, 120103, 21000, 10, 5);


insert into Carts (userId, prodNo, cartProdCount, cartProdDate) values
('user1', 100101, 1, '2022-01-10 10:50:12'),
('user1', 100110, 2, '2022-01-10 10:50:12'),
('user3', 120103, 1, '2022-01-10 10:50:12'),
('user4', 130112, 1, '2022-01-10 10:50:12'),
('user5', 130101, 1, '2022-01-10 10:50:12'),
('user2', 110101, 3, '2022-01-10 10:50:12'),
('user2', 160103, 1, '2022-01-10 10:50:12'),
('user2', 170115, 1, '2022-01-10 10:50:12'),
('user3', 110101, 1, '2022-01-10 10:50:12'),
('user6', 130101, 1, '2022-01-10 10:50:12');

#문제1. 모든 장바구니 내역에서 고객명, 상품명, 상품수량을 조회하시오. 단 상품수량 2건이상만 조회 할 것
select
	userName,
	prodName,
	cartProdCount
FROM Carts as a
join Users as b on a.userId = b.userId
join Products as c on a.prodNo = c.prodNo
where cartProdCount >= 2 ;

#문제2. 모든 상품내역에서 상품번호, 상품카테고리명, 상품명, 상품가격, 판매자이름, 판매자 연락처를 조회하시오.
select
	prodNo,
    cateName,
    prodName,
    prodPrice,
    sellerManager,
    sellerPhone
FROM 
    Products as a
    join Categories as b on a.cateNo = b.cateNo
    join Sellers as c on a.sellerNo = c.sellerNo;

#문제3. 모든 고객의 아이디, 이름, 휴대폰, 현재포인트, 적립포인트 총합을 조회하시오. 단 적립포인트 내역이 없으면 0으로 출력
SELECT 
	a.`userId`,
	`userName`,
	`userHp`,
	`userPoint`,
	IF(SUM(`point`) IS NULL, 0, SUM(`point`)) AS `적립포인트 총합`
FROM `Users` AS a
LEFT JOIN `Points` AS b ON a.userId = b.userId
GROUP BY a.`userId`;

#문제4. 모든 주문의 주문번호, 주문자 아이디, 고객명, 주문가격, 주문일자를 조회하시오. 단 주문금액에 10만원 이상, 큰 금액순으로 조회, 금액이 같으면 이름이 사전순으로 될것
SELECT
	a.orderNo,
	a.userId,
	b.userName,
	a.orderTotalPrice,
	a.orderDate 
FROM `Orders` AS a
JOIN `Users` AS b ON a.userId = b.userId
WHERE `orderTotalPrice` >= 100000
ORDER BY `orderTotalPrice` DESC, `userName` ASC;

#문제5. 모든 주문의 주문번호, 주문자 아이디, 고객명, 상품명, 주문일자를 조회하시오. 주문번호는 중복 없이 상품명은 구분자 ,로 나열할것
SELECT
	a.orderNo,
	c.userId,
	c.userName,
	GROUP_CONCAT(`prodName` SEPARATOR ',') AS `상품명`,
	`orderDate`
FROM `Orders` AS a
JOIN `OrderItems` AS b ON a.orderNo = b.orderNo
JOIN `Users` AS c ON a.userId = c.userId
JOIN `Products` AS d ON b.prodNo=d.prodNo
GROUP BY a.`orderNo`;

#문제6. 모든 상품의 상품번호, 상품명, 상품가격, 할인율, 할인된 가격을 조회하시오. 
select 
	*,
    floor(`prodPrice` * (1 - `prodDiscount` / 100)) as `할인가`
from `products`;

#문제7. 고소영이 판매하는 모든 상품의 상품번호, 상품명, 상품가격, 재고수량, 판매자이름을 조회하시오.
SELECT 
	a.prodNo,
	a.prodName,
	a.prodPrice,
	a.prodStock,
	b.sellerManager
FROM `Products` AS a
JOIN `Sellers` AS b ON a.sellerNo=b.sellerNo
WHERE b.sellerManager='고소영';

#문제8. 아직 상품을 판매하지 않은 판매자의 판매자번호, 판매자상호, 판매자 이름, 판매자 연락처를 조회하시오.
SELECT 
	a.sellerNo,
	a.sellerBizName,
	a.sellerManager,
	a.sellerPhone
FROM `Sellers` AS a
LEFT JOIN `Products` AS b ON a.sellerNo = b.sellerNo
WHERE `prodNo` IS NULL;

#문제9. 모든 주문상세내역 중 개별 상품 가격과 개수 그리고 할인율이 적용된 가격을 구하고 그 가격으로 주문별 총합을 구해서 주문별 총합이 10만원이상 그리고 큰 금액 순으로 `주문번호`, `최종총합`을 조회하시오.
select
	`orderNo` as `주문번호`,
	sum(`할인가` * `itemCount`) as `최종총합`
from
	(select
			*,
			 floor(`itemPrice`-(`itemPrice`*(`itemDiscount`/100))) as `할인가`
	from `OrderItems`) as a
group by `orderNo`
having `최종총합` >=100000
order by `최종총합` desc;

#문제10. 장보고 고객이 주문했던 모든 상품명을 `고객명`, `상품명`으로 조회하시오. 단 상품명은 중복 안됨, 상품명은 구분자 , 로 나열
SELECT 
	`userName`,
	GROUP_CONCAT(`prodName` SEPARATOR ',')
FROM `Orders` AS a
JOIN `Users` AS b ON a.userId=b.userId
JOIN `OrderItems` AS c ON a.orderNo=c.orderNo
JOIN `Products` AS d ON d.prodNo=c.prodNo
WHERE `userName` = '장보고';


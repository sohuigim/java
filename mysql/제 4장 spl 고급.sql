#이름 : 김소희
#내용 : sql 고급

#실습 4-1

create table `member`(
	`uid` varchar(10) primary key,
    `name` varchar(10) not null,
    `hp` varchar(13) unique not null,
    `pos`varchar(10) default '사원',
    `dep` tinyint,
    `rdate` datetime not null
    );
    
create table `department` (
	`depNO` tinyint primary key,
    `name` varchar(10) not null,
    `tel` char(12) not null
    );
    
create table `sales` (
	`no` int auto_increment primary key,
    `uid` varchar(10) not null,
    `year` year not null,
    `month` tinyint not null,
    `sale` int
    );

# 4-2 

insert into `member` values ('a101', '박혁거세', '010-1234-1001', '부장', '101', now());
insert into `member` values ('a102', '김유신', '010-1234-1002', '차장', '101', now());
insert into `member` values ('a103', '김춘추', '010-1234-1003', '사원', '101', now());
insert into `member` values ('a105','강감찬','010-1234-1004','대리','102', now());
insert into `member` values ('a106','이성계','010-1234-1005','과장','102', now());
insert into `member` values ('a104','장보고','010-1234-1006','차장','103', now());
insert into `member` values ('a107','정철','010-1234-1007','차장','103', now());
insert into `member` values ('a108','이순신','010-1234-1008','부장','104', now());
insert into `member` values ('a109','허균','010-1234-1009','부장','104', now());
insert into `member` values ('a110','정약용','010-1234-1010','사원','105', now());
insert into `member` values ('a111','박지원','010-1234-1011','사원','105', now());


insert into `department` values ('101', '영업1부', '051-512-1001');
insert into `department` values ('102', '영업2부', '051-512-1002');
insert into `department` values ('103','영업3부', '051-512-1003');
insert into `department` values ('104','영업4부', '051-512-1004');
insert into `department` values ('105','영업5부', '051-512-1005');
insert into `department` values ('106','영업지원부', '051-512-1006');
insert into `department` values ('107','인사부', '051-512-1007');

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 1,  98100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 1, 136000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 1,  80100);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2018, 1,  78000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 1,  93000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2018, 2,  23500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2018, 2, 126000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2018, 2,  18500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2018, 2,  19000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2018, 2,  53000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a101', 2019, 1,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 1, 109000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 1, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 1,  53500);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2019, 1,  24000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2019, 2, 160000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2019, 2, 101000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2019, 2,  43000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2019, 2,  24000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2019, 2, 109000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 1, 201000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 1,  63000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 1,  74000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a106', 2020, 1, 122000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a107', 2020, 1, 111000);

INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a102', 2020, 2, 120000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a103', 2020, 2,  93000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a104', 2020, 2,  84000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a105', 2020, 2, 180000);
INSERT INTO `Sales` (`uid`, `year`, `month`, `sale`) VALUES ('a108', 2020, 2,  76000);


# 실습 4-3
SELECT * FROM `Member` WHERE `name`='김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김_ _';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

# 실습 4-4
SELECT * FROM `Sales` ORDER BY `sale`;
SELECT * FROM `Sales` ORDER BY `sale` ASC;
SELECT * FROM `Sales` ORDER BY `sale`DESC;
SELECT * FROM `member` ORDER BY `name`;
SELECT * FROM `member` ORDER BY `name` DESC;
SELECT * FROM `member` ORDER BY `RDATE` ASC;
SELECT * FROM `Sales` where `sale` > 50000 ORDER BY `SALE` DESC;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5
SELECT * FROM Sales limit 3;
SELECT * FROM Sales limit 0, 3;
SELECT * FROM Sales limit 1, 2;
SELECT * FROM Sales limit 5, 3;
SELECT * FROM Sales order by `sale` DESC limit 3, 5;

#실습 4-6
select sum(sale) AS `합계` FROM `sales`;
select avg(sale) as `평균` from `sales`;
select max(sale) as `최대값` from `sales`;
select min(sale) as `최소값` from `sales`;


select count(*) as `갯수` from `sales`;
select concat('Hello', 'World') as `결과`;
select concat(`uid`,`name`,`hp`) from `member` where `uid` = 'a108';
select now();
insert into `member` values ('a112', '유관순', '010-1234-1012', '대리', 107, now());
select * from `member`;

#실습 4-7
select
	sum(sale) as `2018년 1월 매출의 총합`
from sales
where year=2018
	and month=1;

#실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합과 평균
select
	sum(sale) as `총합`,
	avg(sale) as `평균`
from `sales`
where
	`year`=2019
	and `month`=2
	and `sale` >= 50000;
    
#실습 4-9 2020년 전체 매출 가운데 최저, 최고, 매출
select
	min(sale) as `최저 매출`,
    max(sale) as `최고 매출`
from `sales`
where
	`year`=2020;
    
#실습 4-10
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SELECT * FROM `Sales` ;

SELECT * FROM `Sales` GROUP BY `uid`;
SELECT * FROM `Sales` GROUP BY `year`;
SELECT * FROM `Sales` GROUP BY `uid`, `year`;

SELECT COUNT(*) AS `건수` FROM `Sales` GROUP BY 'uid';

SELECT `uid`, SUM(sale) AS `합계` FROM `Sales` GROUP BY `uid`;
SELECT `uid`, AVG(sale) AS `평균` FROM `Sales` GROUP BY `uid`;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`, `year`
ORDER BY `year` ASC, `합계` DESC;

SELECT `uid`, `year`, SUM(sale) AS `합계`
FROM `Sales`
WHERE `sale` >= 50000
GROUP BY `uid`, `year`
ORDER BY `합계` DESC;


#실습 4-11
SELECT `uid`, SUM(sale) AS `합계`
FROM `Sales`
GROUP BY `uid`
HAVING `합계` >= 200000;

select `uid`, SUM(sale) AS `합계`
from `sales`
where `sale` >= 100000
group by `uid`, `year`
having `합계` >= 200000
order by `합계` desc;

#실습 4-12
select * from `sales2`;

create table `sales2` like `sales`;
insert into `sales2` select * from `sales`;

set sql_safe_updates=0; # 조건 없이 update 모드 해제
update `sales2` set `year` = `year` + 3;

select * from `sales` union select * from `sales2`;

select * from `sales` where `sale` >= 100000
union
select * from `sales2` where `sale` >= 100000;

select `uid`,`year`,`sale` from sales
union
select `uid`, `year`,`sale` from sales2;

select `uid`, `year`,SUM(sale) as `합계`
from `sales`
group by `uid`, `year`
union
select `uid`, `year`, sum(sale) as `합계`
from `sales2`
group by `uid`, `year`
order by `year` asc, `합계` desc;

#실습 4-13
select * from `sales`
inner join `member` on `sales`.uid = `member`.uid;
select * from `member` inner join `department` on `member`.dep = `department`.depNO;

select * from `sales` as a 
join `member` as b
on a.uid = b.uid;
select * from `sales` as a 
join `member` as b
using (`uid`);
# 위 둘 같음
select * from `member` as a
join `department` as b
on a.dep = b.depNO;

select * from `sales` as a, `member` as b where a.uid = b.uid;
select * from `member` as a, `department` as b where a. dep = b.depNO;

select a. `no`, a.`uid`, `sale`,`name`,`pos`
from `sales` as a
join `member` as b on a.`uid` = b.`uid`;

select 
	a. `no`,
	a.`uid`,
    a.`sale`,
    b.`name`,
    b.`pos`
from `sales` as a
join `member` as b
using (`uid`);

select
a. `no`,
a.`uid`, `sale`,`name`,`pos`
from `sales` as a
join `member` as b using (uid);

select
a. `no`,
a. `uid`, `sale`, `name`, `pos`
from `sales` as a
join `member` as b on a.`uid` = b.`uid`
where `sale` >= 100000;

SELECT
a.`no`,
a.`uid`,
b.`name`,
b.`pos`, `year`, SUM(`sale`) AS `합계`
FROM `Sales` AS a
JOIN `Member` AS b
ON a.uid = b.uid
GROUP BY a.`uid`, a.`year` HAVING `합계` >= 100000
ORDER BY a.`year` ASC, `합계` DESC;

select * from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNO;

select
a. `no`,
a. `uid`,
a. `sale`,
b. `name`,
c. `name`
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNO;


SELECT
a.`no`,
a.`uid`,
a.`sale`,
b.`name`,
b.`pos`,
c.`name`
FROM `Sales` AS a
JOIN `Member` AS b
ON a.uid = b.uid
JOIN `Department` AS c
ON b.dep = c.depNo
WHERE `sale` > 100000
ORDER BY `sale` DESC;

#실습 4-14
select * from `sales` as a
left join `member` as b
on a.`uid` = b.`uid`;

select * from `sales` as a
right join `member` as b
on a.`uid` = b.`uid`;

SELECT a.no, a.uid, `sale`, `name`, `pos` FROM Sales AS a
left JOIN Member AS b USING(uid);

SELECT a.no, a.uid, `sale`, `name`, `pos` FROM Sales AS a
RIGHT JOIN Member AS b USING(uid);

#실습 4-15 모든 직원의 아이디, 이름, 직급, 부서명을 조회하시오.
select
	`uid`,
	a.`name` as`직원명` ,
    `pos`,
	b.`name` as `부서명`
	FROM `member` AS a
	JOIN `department` AS b
	ON a.dep = b.depNO;

select 
	`uid` as `아이디`,
	a. `name` as `직원명` ,
	`pos` as `직급`,
	b. `name` as `부서명`
from `member` as a
join `department` as b
on a.dep = b.depNo;
    
#실습 4-16 '김유신' 직원의 2019년도 매출의 합을 조회하시오.
select
a.`uid`,
    `name`,
	SUM(`sale`) as `2019년도 매출합`
from `sales`as a
join `member` as b
on a.uid = b.uid
where
	`year` = 2019 and
    `name` = '김유신';
    
select
	a.`uid`as `아이디`,
	`name` as `이름`,
	sum(`sale`)as `2019년도 매출합`
from `sales` as a
join `member` as b
on a.uid = b.uid
where
	`year` = 2019 and
    `name` = '김유신';

#실습 4-17 2019년 50,000이상 매출에 대해 직원별 매출의 합이 100,000원 이상인 직원이름, 부서명, 직급, 년도, 매출 합을 조회하시오. 단 매출 합이 큰 순서부터 정렬

select
	b. `name` as `이름` ,
    c. `name` as `부서명`,
	`pos` as `직급`, 
	`year`as `년도`,
sum(`sale`) as `합계`
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
where `year` = 2019 and `sale` >= 50000
group by a.`uid`
having `합계` >= 100000
order by `합계` desc;

select
	b. `name`,
    c. `name`,
    `pos`,
    `year`,
	sum(`sale`) as `합계`
from `sales` as a
join `member` as b on a.uid = b.uid
join `department` as c on b.dep = c.depNo
where `year`=2019 and `sale` >= 50000
group by a.`uid`
having `합계` >= 100000
order by `합계` desc
limit 2;

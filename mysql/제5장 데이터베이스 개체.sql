# 이름 : 김소희 
# 내용 : 제5장 데이터베이스 개체

#실습 5-1
SHOW INDEX FROM `User1`;
SHOW INDEX FROM `User2`;
SHOW INDEX FROM `User3`;

#실습 5-2
CREATE INDEX `idx_user1_uid` ON `User1`(`uid`);
ANALYZE TABLE `User1`;

CREATE INDEX `idx_user1_uid` ON `User2`(`uid`);

CREATE INDEX `idx_user1_uid` ON `User3`(`uid`);

select * FROM `user5`;
insert into `user5` (`name`, `gender`, `age`, `addr`) select `name`, `gender`, `age`, `addr` from `user5`;

update `user5` set `name`='홍길동' where `seq`=3;
update `user5` set `name`='안중근' where `seq`=100000000;

drop table `user5`;

select count(*) from `user5`;
select * FROM `user5` where `seq`='안중근';
# 인덱스로 찾으면 빠름

select * FROM `user5` where `name`='홍길동';
select * FROM `user5` where `name`='안중근';

create index `idx_user5_name` on `user5` (`name`);
analyze table `user5`;
# 이렇게 설정 후 찾으면 빨라짐

delete from `user5` where `seq` > 5;
# 실행후 용량 높으니 딜리트하기

#실습 5-4 view
create view `vw_user1` as (select `name`,`hp`,`age` from `user1`);
create view `vw_user4_age_under30` as (select*from `user4` where `age` < 30);
create view `vw_member_with_sales` as (
	select
		a. `uid` as `직원아이디`,
        b. `name` as `직원이름`,
        b. `pos` as `직급`,
        c. `name` as `부서명`,
        a. `year` as `매출년도`,
        a. `month` as `월`,
        a. `sale` as `매출액`
	from `sales` as a
    join `member` as b on a.uid = b.uid
    join `department` as c on b.dep = c.depNO
    );

#실습 5-5
select*from `vw_user1`;
select*from `vw_user_2_age_under30`;

#실습 5-6
drop view `vw_user1`;
drop view `vw_user4_age_under30`;

#실습 5-7
DELIMITER $$
	CREATE PROCEDURE proc_test1()
	BEGIN
		SELECT * FROM `Member`;
		SELECT * FROM `Department`;
	end $$
	delimiter ;

call proc_test1();

#실습 5-8
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10))
	BEGIN
		SELECT * FROM `Member` WHERE `name`=_userName;
	END $$
	DELIMITER ;
CALL proc_test2('김유신');

DELIMITER $$
	CREATE PROCEDURE proc_test3(IN _pos VARCHAR(10), IN _dep TINYINT)
	BEGIN
		SELECT * FROM `Member` WHERE `pos`=_pos AND `dep`=_dep;
	END $$
	DELIMITER ;
CALL proc_test3('차장', 101);

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _pos VARCHAR(10), OUT _count INT)
	BEGIN
		SELECT COUNT(*) INTO _count FROM `Member` WHERE `pos`=_pos ;
	END $$
	DELIMITER ;

CALL proc_test4('대리',@_count);
SELECT CONCAT('_count : ', @_count);

#실습 5-9

DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
	BEGIN
		DECLARE userId VARCHAR(10);
		select `uid` into userId from `Member` where `name` = _name;
		select * from `Sales` where `uid`=userId;
	END $$
	DELIMITER ;
    
CALL proc_test5('김유신');
        
#실습 5-10

DELIMITER $$
	CREATE PROCEDURE proc_test8()
	BEGIN
	# 변수 선언
	DECLARE total INT DEFAULT 0;
	DECLARE price INT;
	DECLARE endOfRow BOOLEAN DEFAULT false;

	# 커서 선언
	DECLARE salesCursor CURSOR FOR
		SELECT `sale` FROM `Sales`;
	
    # 반복 조건
	DECLARE CONTINUE HANDLER
		FOR NOT FOUND SET endOfRow = TRUE;
	# 커서 열기
	OPEN salesCursor;

	cursor_loop: LOOP
		FETCH salesCursor INTO price;
	
    IF endOfRow THEN
		LEAVE cursor_loop;
	END IF;
    
	SET total = total + price;
END LOOP;

SELECT total AS '전체 합계';

CLOSE salesCursor;
END $$
DELIMITER ;

CALL proc_test8();

#실습 5-11
set global log_bin_trust_function_creators=on;

DELIMITER $$
	CREATE FUNCTION func_test1(_userid VARCHAR(10)) RETURNS INT
	BEGIN
		DECLARE total INT;
		SELECT SUM(sale) INTO total FROM sales WHERE uid=_userid;
        
        RETURN total;
	END $$
    DELIMITER ;
    
select func_test1('a101');

USE studydb;
SHOW TABLES;

DELIMITER $$
	CREATE FUNCTION func_test2(_sale INT) returns double
    begin
		declare bonus double;
        
        if (_sale >= 100000) then
			set bonus = _sale * 0.1;
		else
			set bonus = _sale * 0.005;
		end if;
        
	return bonus;
    end $$
    delimiter ;
    
select
	`uid`,
    `year`,
    `month`,
    `sale`,
    func_test2(`sale`) as `bonus`
from `sales`;
    
    
#날짜 : 2024/07/19
#이름 : 김소희
#내용 : 8장 정규화 실습하기

#실습 8-1
update `bank_account` set `a_balance` = 100000 where `a_no` = '101-11-1001';
select * from `bank_account` ;

start transaction; -- 트랜잭션 시작

select*from `bank_account`;
update `bank_account` set
							`a_balance` = `a_balance` - 10000
                            where
								`a_no` = '101-11-1001';

update `bank_account` set
							`a_balance` = `a_balance` + 10000
                            where
							`a_no` = '101-11-1212';
                            
commit; -- 작업 확정(트랜잭션 종료)

select * from `bank_account` ;
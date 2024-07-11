#날짜 : 24/07/11
#이름 : 김소희
#내용 : SQL 연습문제 4
CREATE DATABASE `Theater`;
CREATE USER 'theater'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Theater.* TO 'theater'@'%';
FLUSH PRIVILEGES;
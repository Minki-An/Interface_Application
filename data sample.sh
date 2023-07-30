데이터베이스는 mairadb 사용하였습니다. 


CREATE USER 'gasida'@'localhost' IDENTIFIED BY 'qwe123';
GRANT ALL PRIVILEGES ON *.* TO 'gasida'@'%' IDENTIFIED BY 'qwe123';

CREATE DATABASE userinfo;  # 회원 정보 db
CREATE DATABASE products;  # 상품 정보 db 

use userinfo;
CREATE TABLE userinfo (username CHAR(8),password NVARCHAR(10),name NVARCHAR(10),phone CHAR(11) NOT NULL,address NVARCHAR(90),email CHAR(25),birthdate NVARCHAR(15) # 회원 정보 테이블
use products;
CREATE TABLE products(id CHAR(8),name NVARCHAR(15),store NVARCHAR(20),storeId CHAR(8),price CHAR(10),img NVARCHAR(90)); # 상품 정보 테이블 
CREATE TABLE orders (order_id CHAR(8), name NVARCHAR(15),store NVARCHAR(20), price CHAR(10));  # 주문 목록 테이블 


# 사용자 정보 DB userinfo

INSERT INTO userinfo VALUES ('john123', 'abcd1234', 'John Doe', '01234567890', '123 Main Street, City', 'john.doe@example.com', '1990-05-15');
INSERT INTO userinfo VALUES ('jane456', 'qwertyuiop', 'Jane Smith', '98765432100', '456 Oak Avenue, Town', 'jane.smith@example.com', '1985-12-20');
INSERT INTO userinfo VALUES ('sam007', 'p@ssw0rd', 'Sam Johnson', '55512345678', '789 Maple Lane, Village', 'sam.johnson@example.com', '1998-08-01');
INSERT INTO userinfo VALUES ('testuser', 'test1234', 'Test User', '11122223333', 'Test Address, Test City', 'test.user@example.com', '2000-01-01');


# 상품정보 DB products

INSERT INTO products VALUES ('1', '맥도날드 햄버거', '한국 맥도날드', '100', '8700', 'https://joinc-edu.s3.ap-northeast-2.amazonaws.com/docker-msa/ham-01.jpeg');
INSERT INTO products VALUES ('2', '좋은날 떡복이', '좋은음식', '101', '5000', 'https://joinc-edu.s3.ap-northeast-2.amazonaws.com/docker-msa/tteokbokki.jpeg');
INSERT INTO products VALUES ('3', '우리 돈까스', '우리돈', '102', '11000', 'https://joinc-edu.s3.ap-northeast-2.amazonaws.com/docker-msa/pork_cutlet.jpg');
INSERT INTO products VALUES ('4', '빅맥 세트', '롯데리아', '103', '15000', 'https://joinc-edu.s3.ap-northeast-2.amazonaws.com/docker-msa/ham-02.jpeg');
INSERT INTO products VALUES ('5', '블랙알리오', '푸라닭', '104', '17900', 'https://interface-app-image.s3.ap-northeast-2.amazonaws.com/9969DE435D0ECFD004.jpg');
INSERT INTO products VALUES ('6', '와퍼 세트', '버거킹', '105', '8500', 'https://interface-app-image.s3.ap-northeast-2.amazonaws.com/B.jpg');
INSERT INTO products VALUES ('7', '치즈 핫도그', '명량 핫도그', '106', '3000', 'https://interface-app-image.s3.ap-northeast-2.amazonaws.com/hotdog.jpg');
INSERT INTO products VALUES ('8', '콤비네이션 피자', '피자헛', '107', '20000', 'https://interface-app-image.s3.ap-northeast-2.amazonaws.com/pizza.jpg');

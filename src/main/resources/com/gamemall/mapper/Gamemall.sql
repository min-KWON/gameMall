/*
�ۼ��� : �ڱ⵿
������ : 2019-03-06
������Ʈ�� : ���θ�
*/
DROP TABLE MBSP_TBL;

-- �ѱ� ������ ũ��?
SELECT LENGTHB('ȫ') FROM DUAL;

--1.ȸ������ ���̺�
CREATE TABLE MBSP_TBL(
        MBSP_ID             VARCHAR2(15),
        MBSP_NAME           VARCHAR2(30)            NOT NULL,
        MBSP_EMAIL          VARCHAR2(50)            NOT NULL,
        MBSP_PASSWORD       CHAR(60)               NOT NULL,        -- ��й�ȣ ��ȣȭ ó��.
        MBSP_ZIPCODE        CHAR(5)                 NOT NULL,
        MBSP_ADDR           VARCHAR2(100)            NOT NULL,
        MBSP_DEADDR         VARCHAR2(100)            NOT NULL,
        MBSP_PHONE          VARCHAR2(15)            NOT NULL,
        MBSP_NICK           VARCHAR2(30)            NOT NULL UNIQUE,
        MBSP_RECEIVE        CHAR(1)  default 'y'                NOT NULL,
        MBSP_POINT          NUMBER DEFAULT 0        NOT NULL,
        MBSP_LASTLOGIN      DATE                    NULL,
        MBSP_DATESUB        DATE DEFAULT SYSDATE    NOT NULL,
        MBSP_UPDATEDATE     DATE DEFAULT SYSDATE    NOT NULL
);

ALTER TABLE MBSP_TBL
ADD CONSTRAINT PK_MBSP_ID PRIMARY KEY (MBSP_ID);


SELECT * FROM MBSP_TBL;
DELETE FROM MBSP_TBL;

-- ȸ�����

--1)ȸ������
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user01','ȫ�浿','user01@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�1','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user02','�̽¿�','user02@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�2','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user03','�����','user03@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�3','N');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user04','������','user04@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�4','Y');   
INSERT INTO mbsp_tbl (mbsp_id,mbsp_name,mbsp_email, mbsp_password,mbsp_zipcode,mbsp_addr,mbsp_deaddr,mbsp_phone,mbsp_nick,mbsp_receive) 
VALUES ('user05','����ȣ','user05@abc.co.kr','1111','55555','����� ���α� â�ŵ�','�׸�����Ʈ 100��100ȣ','010-5555-5555','�ù�5','N');   

COMMIT;

--2)���̵� �ߺ�üũ
-- ����Ÿ ���� �� ���
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user01'; -- ���̵� ���Ұ���
-- ����Ÿ ���� �� �� ���
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = 'user06'; -- ���̵� ��밡��

SELECT COUNT(MBSP_ID) FROM MBSP_TBL WHERE MBSP_ID = 'user01';  -- 0 OR 1 �������.

--3)ȸ������
--3.1)��й�ȣȮ��
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.2) ȸ������ ����������
SELECT MBSP_ID, MBSP_NAME, MBSP_PASSWORD, MBSP_ZIPCODE, MBSP_ADDR, MBSP_DEADDR, MBSP_PHONE, MBSP_NICK, MBSP_RECEIVE, MBSP_POINT, MBSP_DATESUB, MBSP_UPDATEDATE, MBSP_LASTLOGIN
FROM MBSP_TBL
WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--3.3) ȸ������ �����ϱ�
UPDATE MBSP_TBL
    SET MBSP_PASSWORD = ?, MBSP_ZIPCODE = ?, MBSP_ADDR = ?, MBSP_DEADDR = ?, MBSP_PHONE = ?, MBSP_RECEIVE = ?
WHERE MBSP_ID = ?;

--4) ȸ������ �����ϱ�
--4.1) ��й�ȣ Ȯ��
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--4.2) �����ϱ�
DELETE FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

--5)���̵�׺�й�ȣã��
--5.1)���̵� ã��(���� ����)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_NAME = '�����' AND MBSP_EMAIL = 'user03@abc.co.kr';
--5.2)��й�ȣ ã��(���� ����)
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = 'user03' AND MBSP_EMAIL = 'user03@abc.co.kr';


--6)�α��� ���(��й�ȣ�� ��ȣȭ ó�� �� ��쿡�� �����߻�)
SELECT MBSP_ID FROM MBSP_TBL WHERE MBSP_ID = ? AND MBSP_PASSWORD = ?;

-- ��й�ȣ ��ȣȭ �� ���
SELECT MBSP_PASSWORD FROM MBSP_TBL WHERE MBSP_ID = ?;

-- ��� �÷����� ��ȣȭ �� ����Ÿ�� �о�ͼ�, ���ϴ� �޼��带 ���Ͽ� �۾��ϰԵȴ�.


--2.ī�װ��� ���̺�

DROP TABLE CATEGORY_TBL;
CREATE TABLE CATEGORY_TBL(
        CAT_CODE            NUMBER    PRIMARY KEY,    -- ī�װ��� �ڵ�
        CAT_PRTCODE         NUMBER    NULL,           -- ����ī�װ��� �ڵ�
        CAT_NAME            VARCHAR2(50)    NOT NULL,
        FOREIGN KEY(CAT_PRTCODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);

-- / -> /

-- 1�� ī�װ��� : Action(1) Role-Playing(2) 'Strategy(3) Adventure(4) Simulatuion(5) Sports&#38;Racing(6) ACC(7)
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (1,NULL,'Action');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (2,NULL,'Role-Playing');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (3,NULL,'Strategy');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (4,NULL,'Adventure');        
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (5,NULL,'Simulatuion');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (6,NULL,'Sports&#38;Racing');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (7,NULL,'ACC');    

-- 1��ī�װ��� Action : 1
-- 2�� ī�װ��� : 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (8,1,'Arcade&#38;Rhythm');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (9,1,'Fighting');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (10,1,'Shooter');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (11,1,'Hack&#38;Slash');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (12,1,'Platformer&#38;Runner');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
VALUES (13,1,'Third-Person&#38;Shooter');

-- 1��ī�װ��� Role-Playing : 2
-- 2��ī�װ��� : ������� û���� ������ ����� �ݹ���
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (14,2,'ActionRPG');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (15,2,'AdventureRPG');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (16,2,'JRPG');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (17,2,'Party-Based');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (18,2,'RRogue-Like');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (19,2,'StrategyRPG');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (20,2,'Turn-Based');    
    
-- 1��ī�װ��� Strategy : 3
-- 2��ī�װ��� : ���/���̳� ������ üũ/���� û���� ��Ʈ������ 

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (21,3,'Card&#38;Board');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (22,3,'City&#38;Settlement');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (23,3,'Grand&#38;4X'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (24,4,'Military');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (25,4,'Real-Time||''||Strategy');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (26,4,'Tower||''||Defense');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (27,4,'Turn-Based||''||Strategy');    
    
    
-- 1��ī�װ��� Adventure : 4
-- 2��ī�װ��� : 

INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (28,4,'Adventunre||''||RPG');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (29,4,'Casual');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (30,4,'Hidden||''||Object'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (30,4,'Metroidvania');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (30,4,'Puzzle'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (31,4,'Story||''||Rich');  
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (32,4,'Visual||''||Novel');    
    
-- 1��ī�װ��� Simulatuion : 5
-- 2��ī�װ��� : ����Ŀ�� ����/���� Ű���̽Ź�/��â ������/�ɸ�/����
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (33,5,'Bulding&#38;Automation');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (34,5,'Dating');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (35,5,'Farming&#38;Crafting');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (36,5,'Hobby&#38;Job');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (37,5,'Life&#38;Immersive');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (38,5,'Sandboc&#38;Physics');    
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (39,5,'Space&#38;Flight');      
   
-- 1��ī�װ��� Sports&#38;Racing : 6
-- 2��ī�װ��� : 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (40,6,'All||''||Sports'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (41,6,'Fishing&#38;Hunting');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (42,6,'Indivisual||''||Sports');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (43,6,'Racing');   
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (44,6,'Racing||''||Sim'); 
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (45,6,'Sports||''||Sim');     
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (46,6,'Team||''||Sports');     
    
    
-- 1��ī�װ��� ACC : 7
-- 2��ī�װ��� : �縻/��Ÿ�� ���� ���÷�/�尩 ���̿��� ��Ʈ/�ð� ��Ÿ
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (47,7,'Anime');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (48,7,'Horror');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (49,7,'Mystery&#38;Detective');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (50,7,'Open||''||World');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (51,7,'Space');
INSERT INTO category_tbl (cat_code,cat_prtcode,cat_name) 
    VALUES (52,7,'Survival');
    
COMMIT;

-- 1��ī�װ��� ���
SELECT * FROM category_tbl WHERE cat_prtcode IS NULL;

-- 1��ī�װ��� TOP �� 2��ī�װ��� ���.
SELECT * FROM category_tbl WHERE cat_prtcode = ?;


-- 2��ī�װ��� ���� ����϶�.
SELECT * FROM category_tbl WHERE cat_prtcode IS NOT NULL;



SELECT * FROM category_tbl;
COMMIT;
ROLLBACK;

SELECT 055 FROM DUAL;  -- �÷��� NUMBER
SELECT '055' FROM DUAL; -- �÷��� VARCHAR2(10)
    
--3.��ǰ���� ���̺�
DROP TABLE PRODUCT_TBL;

/*
����Ÿ�� �����Ѵٴ� �������ǿ���
���̺��� �÷��� 
    NOT NULL -> NUL �� ���� ����
    NULL -> NOT NULL �� ���� �Ұ���

*/
DROP TABLE PRODUCT_TBL;
CREATE TABLE PRODUCT_TBL(
        PRO_NUM             NUMBER  CONSTRAINT  PK_PRO_NUM         PRIMARY KEY,
        CAT_CODE            NUMBER            NULL,
        PRO_NAME            VARCHAR2(50)            NOT NULL,
        PRO_PRICE           NUMBER                  NOT NULL,
        PRO_DISCOUNT        NUMBER                  NOT NULL,
        PRO_PUBLISHER       VARCHAR2(50)            NOT NULL,
        PRO_CONTENT         VARCHAR2(4000)  /* CLOB */                  NOT NULL,       -- ������ 4000BYTE �ʰ������Ǵ�?
        PRO_UP_FOLDER       VARCHAR(50)             NOT NULL,
        PRO_IMG             VARCHAR(50)             NOT NULL,  -- ��¥������ΰ� �����Ͽ� �����̸�����
        PRO_AMOUNT          NUMBER                  NOT NULL,
        PRO_BUY             CHAR(1)                 NOT NULL,
        PRO_DATE            DATE DEFAULT SYSDATE    NOT NULL,
        PRO_UPDATEDATE      DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(CAT_CODE) REFERENCES CATEGORY_TBL(CAT_CODE)
);

-- ��ǰ���� �̹����� ������ �ٸ� ��� ������ ���̺��� ����(����)
-- ��ǰ���� �÷��� �������͸� �̿��� �±��ڵ� ������ ����ȴ�.

-- PRO_CONTENT�÷��� CLOB ����Ÿ Ÿ���� �񱳸��ɾ ��������.
SELECT * FROM product_tbl ORDER BY PRO_CONTENT ASC;

drop SEQUENCE seq_product_tbl;
create SEQUENCE seq_product_tbl;
-- ��ǰ����۾�
-- pro_up_folder �÷� : ���ε������� ���� ��¥�����̸�.   �ü���� ��α�����  ����1) /2023/04/06/   ����2)\2023\04\06\ ��������


-- 1��ī�װ��� : TOP (�ڵ� : 1)
-- 2��ī�װ��� : ����Ƽ(�ڵ� : 8)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder, pro_amount,pro_buy) 
VALUES (1,8,'A',10000,0.1,'����','��¼����¼��','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (2,14,'A',10000,0.1,'����','��¼����¼��','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (3,19,'A',10000,0.1,'����','��¼����¼��','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (4,24,'A',10000,0.1,'����','��¼����¼��','\2023\04\06\','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_up_folder,pro_amount,pro_buy) 
VALUES (5,31,'A',10000,0.1,'����','��¼����¼��','\2023\04\06\','abc.gif',10,'Y');

-- 2��ī�װ��� : ��Ʈ(�ڵ� : 9)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (6,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (7,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (8,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (9,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (10,'9','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- 2��ī�װ��� : ������&�ĵ�Ƽ(�ڵ� : 10)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (11,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (12,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (13,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (14,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (15,'10','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- 2��ī�װ��� : ������Ƽ(�ڵ� : 11)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (16,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (17,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (18,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (19,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (20,'11','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');


-- 2��ī�װ��� : ����(�ڵ� : 12)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (21,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (22,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (23,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (24,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (25,'12','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

-- 2��ī�װ��� : ����Ƽ&7��Ƽ(�ڵ� : 13)
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (26,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code, pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (27,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (28,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (29,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');
INSERT INTO product_tbl (pro_num,cat_code,pro_name,pro_price,pro_discount,pro_publisher,pro_content,pro_img,pro_amount,pro_buy) 
VALUES (30,'13','A',10000,0.1,'����','��¼����¼��','abc.gif',10,'Y');

COMMIT;


/*********************************************************************
-- ��ǰ����Ʈ ���
*/

-- 1�� ī�װ����� ��ǰ��� ��ȸ.  ��) TOP(1) 1��ī�װ��� ����
SELECT * FROM product_tbl WHERE cat_code IN (SELECT cat_code FROM  category_tbl WHERE CAT_PRTCODE = ? );

SELECT * FROM product_tbl WHERE cat_code IN (SELECT cat_code FROM  category_tbl WHERE CAT_PRTCODE = 1 );

-- 2�� ī�װ����� ��ǰ��� ��ȸ.
SELECT * FROM product_tbl WHERE cat_code = ?;

SELECT * FROM product_tbl WHERE cat_code = 8;




-- ��ǰ�󼼼���
/*
��ǰ����Ʈ���� ��ǰ �ϳ��� �����Ͽ��� �� ������ ������

*/
SELECT * FROM product_tbl WHERE PRO_NUM = ?;

SELECT * FROM product_tbl WHERE PRO_NUM = 1;

DROP TABLE CART_TBL;
--4.��ٱ��� ���̺�
CREATE TABLE CART_TBL(
        CATE_CODE        NUMBER          PRIMARY KEY,
        PRO_NUM         NUMBER          NOT NULL,
        MBSP_ID         VARCHAR2(15)    NOT NULL,
        CATE_AMOUNT      NUMBER          NOT NULL,
        FOREIGN KEY(PRO_NUM) REFERENCES PRODUCT_TBL(PRO_NUM),
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);




-- �α����� ���¿��� ��ٱ��� ����
SELECT * FROM CART_TBL WHERE MBSP_ID = ?;

-- ��ǰ������������ ��ٱ��� ��� - MERGE �������.
/*
����? ��ٱ��Ͽ� ������ ��ǰ�� �����ϸ�, ������ ����(������Ʈ)�۾� : UPDATE
                            �������� ������, ��ǰ�� ��ٱ��Ͽ� �߰� : INSERT
*/
MERGE
    INTO CART_TBL C
USING DUAL
    ON (C.MBSP_ID = ?) AND (C.PRO_NUM = ?)
 WHEN MATCHED THEN
    UPDATE
        SET C.CAT_AMOUNT = C.CAT_AMOUNT + ?
 WHEN NOT MATCHED THEN
    INSERT (C.CAT_CODE, C.PRO_NUM, C.MBSP_ID, C.CAT_AMOUNT)
    VALUES ( ?, ?, ?, ?);
    
    
-- ��ٱ��Ͽ� ���ϻ�ǰ�� �����ϴ� �� ���θ� Ȯ��    
SELECT COUNT(*) FROM CART_TBL WHERE (C.MBSP_ID = ?) AND (C.PRO_NUM = ?);

SELECT C.CAT_CODE FROM CART_TBL WHERE (C.MBSP_ID = ?) AND (C.PRO_NUM = ?);
    
    
    

INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (1,1,'user01', 2 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (2,5,'user01', 3 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (3,7,'user01', 5 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (4,12,'user02', 1 );
INSERT INTO cart_tbl (cat_code,pro_num,mbsp_id,cat_amount) VALUES (5,30,'user02', 2 );

SELECT * FROM cart_tbl;
COMMIT;

/*
�ֹ��ϱ�
  - 1)��ٱ��� ����ϰ� ��ٱ��Ͽ��� ����.
  - 2)��ٱ��� ��� ���ϰ�, �ٷα���.
 
*/
-- ��ٱ��� ����Ʈ ��ȸ
SELECT rownum, P.pro_img, P.pro_name, P.pro_price, C.cat_amount, P.pro_price * C.cat_amount as unitprice
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- ��ü�ݾ� : 100000
SELECT SUM(P.pro_price * C.cat_amount) as totalprice
FROM product_tbl p INNER JOIN cart_tbl c
ON p.pro_num = c.pro_num
WHERE c.MBSP_ID = 'user01';

-- ��ٱ��Ͽ��� ��������
-- ������ ��������
UPDATE cart_tbl
    SET CAT_AMOUNT = 10
WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;
-- ����!!!!(������ ����)
UPDATE cart_tbl
    SET CAT_AMOUNT = CAT_AMOUNT + 10
WHERE CAT_CODE = 1;

-- ��ٱ��� ��ǰ���� ( CAT_CODE : ��ٱ����ڵ� )
DELETE FROM cart_tbl WHERE CAT_CODE = 1;

SELECT * FROM cart_tbl WHERE CAT_CODE = 1;
COMMIT;

-- ��ٱ��� ���� : �α��� �� ����� ����Ÿ�� �����ؾ� �Ѵ�.(����)
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';


-- �����ϱ� : Ʈ�����ó��.
/*
�ֹ����̺� : �ֹ���, �����(������) �� 
�ֹ������̺� : ���� ��ǰ����
��ٱ������̺� : �α��� ������� ��ǰ���� ����
ȸ�����̺� ����Ʈ ����.
*/
DROP TABLE ORDER_TBL;
--5.�ֹ����� ���̺�
CREATE TABLE ORDER_TBL(
        ORD_CODE            NUMBER                  PRIMARY KEY,
        MBSP_ID             VARCHAR2(15)            NOT NULL,
        ORD_NAME            VARCHAR2(30)            NOT NULL,
        ORD_ADDR_NUM        CHAR(5)                 NOT NULL,
        ORD_ADDR_BASIC      VARCHAR2(50)            NOT NULL,
        ORD_ADDR_DETAIL     VARCHAR2(50)            NOT NULL,
        ORD_TEL             VARCHAR2(20)            NOT NULL,
        ORD_PRICE           NUMBER                  NOT NULL,  -- ���ֹ��ݾ�. ����
        ORD_REGDATE         DATE DEFAULT SYSDATE    NOT NULL,
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID)
);

DROP TABLE ORDETAIL_TBL;
--6.�ֹ��� ���̺�
CREATE TABLE ORDETAIL_TBL(
        ORD_CODE        NUMBER      NOT NULL REFERENCES ORDER_TBL(ORD_CODE),
        PRO_NUM         NUMBER      NOT NULL REFERENCES PRODUCT_TBL(PRO_NUM),
        DT_AMOUNT       NUMBER      NOT NULL,
        DT_PRICE        NUMBER      NOT NULL,  -- ������ȭ
        PRIMARY KEY (ORD_CODE ,PRO_NUM) 
);

-- ���ֹ��ݾ�
SELECT ORD_CODE, SUM(DT_AMOUNT * DT_PRICE) FROM ORDETAIL_TBL WHERE ORD_CODE = ?;

/*

��ٱ��� -> �ֹ��ϱ� Ŭ�� �� -> �ֹ����� ������

*/
-- �ֹ����� ������ ����

-- �ֹ��� ���� ����
SELECT  *
FROM mbsp_tbl
WHERE mbsp_id = 'user01';



/*
Ʈ�����(����ó������)����� �����ؾ� �Ǵ°��?
�ϳ��� ��ɿ� ������ �۾��� �� ���(INSERT, UPDATE, DELETE, MERGE ��)
*/


/*
�ֹ������� �Է� �� �ֹ��ϱ� ������ �� ��� �������� �۾��� ���ÿ� �̷������.

Ʈ�����(����ó������)����� �����ؾ��Ѵ�.
- �ֹ����� �Է�(�ֹ����̺�, �ֹ������̺�)
- ����Ʈ ����
- ��ٱ��� ����
- ����

*/

-- �ֹ����� ���.   1)������(SQL �������)���� Ʈ��������� �۾�  2) ���ν������� Ʈ����� ���� �۾�
--��ٱ��� ��������
SELECT * FROM cart_tbl WHERE mbsp_id = 'user01';

--1)�ֹ����̺� 
INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
VALUES (1,'user01','ȫ�浿','10050','����ϵ� ��â','����� 100��','010-555-5555',20000);

--2)�ֹ������̺� - ��ǰ���� ����Ÿ ����

INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 5, 3, 1000);
INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
VALUES (1, 7, 5, 1000);

--3)��ٱ������̺�
DELETE FROM cart_tbl WHERE mbsp_id = 'user01';

--4) ����Ʈ ���
UPDATE mbsp_tbl
SET mbsp_point = mbsp_point + 50    -- 50 ����Ʈ ��
WHERE mbsp_id = 'user01';

COMMIT;

-- �ֹ����� ��ȸ ����Ʈ

SELECT * FROM ORDER_TBL;
SELECT * FROM ORDETAIL_TBL;

-- ��ǰ, �ֹ�, �ֹ��� ������ �̿��� �ֹ�������ȸ
SELECT rownum, OD.ORD_REGDATE, P.PRO_NAME , OT.DT_AMOUNT * OT.DT_PRICE  as SALEPRICE
FROM ORDER_TBL od   INNER JOIN ORDETAIL_TBL ot
ON od.ord_code = ot.ord_code
INNER JOIN PRODUCT_TBL p
ON OT.PRO_NUM = P.PRO_NUM
WHERE od.mbsp_id = 'user01';


-- ���� 4���� �۾��� ���ν����� ����(Ʈ����� ����)
CREATE OR REPLACE PROCEDURE UDP_ORDERINFO_PROCESS
(
    p_ord_code          IN    order_tbl.ord_code%TYPE,
    p_mbsp_id           IN    mbsp_tbl.mbsp_id%TYPE,
    p_ord_name          IN    order_tbl.ord_name%TYPE,
    p_ord_addr_num      IN    order_tbl.ord_addr_num%TYPE,
    p_ord_addr_basic    IN    order_tbl.addr_basic%TYPE,
    p_ord_addr_detail   IN    order_tbl.ord_addr_detail%TYPE,
    p_ord_tel           IN    order_tbl.ord_tel%TYPE,
    p_ord_price         IN    order_tbl.ord_price%TYPE,
    
    
    /*
    �Ʒ� 3���� �Ű������� ��ٱ����� ��ǰ������ŭ ����Ÿ�� �����ؾ� �Ѵ�.
    ��) ��ٱ��� ����Ÿ 3�� �� ��� �Ű������� ���� 3���� ������ ������ �Ѵ�.
    */
    p_pro_num           IN    ,
    p_dt_amount         IN      ,
    p_dt_price          IN      ,
    
    
    
    p_mbsp_point        IN     mbsp_tbl.mbsp_point%TYPE 
)
IS

BEGIN
    --1)�ֹ����̺� �Է�
    INSERT INTO order_tbl (ord_code,mbsp_id,ord_name,ord_addr_num,ord_addr_basic,ord_addr_detail,ord_tel,ord_price) 
        VALUES (1,p_mbsp_id,'ȫ�浿','10050','����ϵ� ��â','����� 100��','010-555-5555',20000);
    --2)�ֹ������̺� �Է�   
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 5, 3, 1000);
    INSERT INTO ordetail_tbl (ord_code,pro_num,dt_amount,dt_price) 
    VALUES (1, 7, 5, 1000);
    
    --3)��ٱ������̺� ����
    DELETE FROM cart_tbl WHERE mbsp_id = 'user01';
    
    --4)ȸ�����̺� ����Ʈ ����
    UPDATE mbsp_tbl
        SET mbsp_point = mbsp_point - 50    -- 50 ����Ʈ ��
    WHERE mbsp_id = 'user01';

    COMMIT;
    
    EXCEPTION WHEN OTHERS THEN
        ROLLBACK;
END;

DROP TABLE REVIEW_TBL;
--7.���� ���̺�
CREATE TABLE REVIEW_TBL(
        REW_NUM         NUMBER                      PRIMARY KEY,
        MBSP_ID         VARCHAR2(15)                NOT NULL,
        PRO_NUM         NUMBER                      NOT NULL,
        REW_CONTENT     VARCHAR2(200)               NOT NULL,
        REW_SCORE       NUMBER                      NOT NULL,
        REW_REGDATE     DATE DEFAULT SYSDATE        NOT NULL,
        FOREIGN KEY(MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID),
        FOREIGN KEY(PRO_NUM) REFERENCES PRODUCT_TBL(PRO_NUM)
);

--��ǰ�ı� �Է�
SELECT * FROM ORDETAIL_TBL;

INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (1, 'user01',5,'�����ϴ�.', 4 );
INSERT INTO review_tbl (rew_num,mbsp_id,pro_num,rew_content,rew_score)
    VALUES (2, 'user01',7,'���� ����.', 5 );
    
    
COMMIT;    
SELECT * FROM  review_tbl; 

-- ��ǰ�󼼼���(�պκ�)/ ��ǰ�ı�(�޺κ�)

SELECT * FROM PRODUCT_TBL WHERE PRO_NUM = 5;

SELECT * FROM review_tbl WHERE PRO_NUM = 5;

DROP TABLE BOARD_TBL;

--8.�Խ��� ���̺�

CREATE SEQUENCE BOARD_NUM_SEQ;
CREATE TABLE BOARD_TBL(
        BRD_NUM         NUMBER  CONSTRAINT PK_BOARD_BRD_NUM  PRIMARY KEY,
        MBSP_ID         VARCHAR2(15)            NOT NULL,
        BRD_TITLE       VARCHAR2(100)           NOT NULL,
        BRD_CONTENT     VARCHAR2(4000)          NOT NULL,
        BRD_REGDATE     DATE DEFAULT SYSDATE    NOT NULL
       
);

-- ����Ű �߰�
ALTER TABLE BOARD_TBL ADD CONSTRAINT FK_BOARD_MBSP_ID
FOREIGN KEY (MBSP_ID) REFERENCES MBSP_TBL(MBSP_ID);

--9.������(ADMIN)���̺�
CREATE TABLE ADMIN_TBL (
    ADMIN_ID    VARCHAR2(15)    PRIMARY KEY,
    ADMIN_PW    CHAR(60)    NOT NULL,
    ADMIN_VISIT_DATE    DATE
);


INSERT INTO ADMIN_TBL VALUES('admin', '$2a$10$dQFCMr0udCI865eG6SoIcOaNr3Y/dgBX.R4qf6rX5KA3jciSnnNjG',sysdate);

-- �ε��� ��Ʈ ��������
-- BOARD_TBL �Խ������̺� ���̵����� �۾�
INSERT INTO BOARD_TBL(BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
VALUES(BOARD_NUM_SEQ.NEXTVAL, 'USER01', '����1', '����1', SYSDATE);


INSERT INTO BOARD_TBL(BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE)
SELECT BOARD_NUM_SEQ.NEXTVAL, 'USER04', '����4', '����4', SYSDATE FROM BOARD_TBL;

COMMIT;


/*
�ε��� ��Ʈ ���ɾ�
INDEX : ��������.  INDEX_ASC
INDEX_DESC : ��������
*/
-- order by  �������
SELECT * FROM BOARD_TBL ORDER BY BRD_NUM DESC;

-- �ε��� ��Ʈ �������
SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM )  */
    BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM 
    BOARD_TBL b;
    
SELECT /*+ INDEX_ASC(b PK_BOARD_BRD_NUM )  */
    BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM 
    BOARD_TBL b;
    
-- �ε������� Ʋ�� ���   K_BOARD_BRD_NUM -> K_BOARD_BRD_NUM2 
SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM2 )  */
BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM 
    BOARD_TBL b;


-- ����¡���� ����.
-- Ű���� ROWNUM ���
SELECT * FROM BOARD_TBL WHERE ROWNUM <= 10 ORDER BY BRD_NUM DESC;

SELECT * FROM BOARD_TBL WHERE ROWNUM >= 5 AND ROWNUM <=10; -- ��°���� ����. ROWNUM ���ۿ��� ������.

-- ���� ���ۿ��� ������ �ζ��� �並 ���
-- ������ 1 Ŭ��
SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM ( 
        SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM )  */ 
            ROWNUM RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
            FROM BOARD_TBL b
    )
WHERE RN >=1 AND RN <=3;

-- ������ 2 Ŭ��
SELECT RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
FROM ( 
        SELECT /*+ INDEX_DESC(b PK_BOARD_BRD_NUM )  */
            ROWNUM RN, BRD_NUM, MBSP_ID, BRD_TITLE, BRD_CONTENT, BRD_REGDATE
            FROM BOARD_TBL b
    )
WHERE RN >=4 AND RN <=6;














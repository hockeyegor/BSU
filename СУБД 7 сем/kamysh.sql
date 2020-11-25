-- "C##BSU".BANK definition

CREATE TABLE "C##BSU"."BANK" 
   (  "MFO" NUMBER(*,0), 
  "NAME" VARCHAR2(100), 
  "ADDRESS" VARCHAR2(100), 
  "UNP" NUMBER(*,0), 
  "BANK_CODE" NUMBER(*,0), 
   CONSTRAINT "BANK_PK" PRIMARY KEY ("BANK_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
   CONSTRAINT "BANK_UN" UNIQUE ("MFO", "UNP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##BSU".PAYMENT_ORDER definition

CREATE TABLE "C##BSU"."PAYMENT_ORDER" 
   (  "ID" NUMBER(*,0), 
  "NUMBER" NUMBER(*,0), 
  "ORD_DATE" DATE NOT NULL ENABLE, 
  "SUM" NUMBER(38,0) NOT NULL ENABLE, 
  "ORDER" NUMBER(*,0), 
  "PAYMENT_CODE" VARCHAR2(100), 
  "AIM" VARCHAR2(100), 
  "ID_PAYER" NUMBER(38,0) NOT NULL ENABLE, 
  "ID_DEST" NUMBER(38,0) NOT NULL ENABLE, 
   CONSTRAINT "PAYMENT_ORDER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##BSU".CHECKING_ACCOUNT definition

CREATE TABLE "C##BSU"."CHECKING_ACCOUNT" 
   (  "ID" NUMBER(*,0) NOT NULL ENABLE, 
  "NUMBER" NUMBER(*,0), 
  "BANK_CODE" NUMBER(*,0), 
  "STATUS" NUMBER(*,0), 
  "PAYMENT" NUMBER(*,0), 
  "BALANCE" NUMBER(38,0) DEFAULT 0, 
   CONSTRAINT "CHECKING_ACCOUNT_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
   CONSTRAINT "CHECKING_ACCOUNT_UN" UNIQUE ("NUMBER", "BANK_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
   CONSTRAINT "FK_BANK" FOREIGN KEY ("BANK_CODE")
    REFERENCES "C##BSU"."BANK" ("BANK_CODE") ON DELETE CASCADE ENABLE, 
   CONSTRAINT "FK_PAYMENT_ORDER" FOREIGN KEY ("PAYMENT")
    REFERENCES "C##BSU"."PAYMENT_ORDER" ("ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


-- "C##BSU".COUNTERPARTY definition

CREATE TABLE "C##BSU"."COUNTERPARTY" 
   (  "ID" NUMBER(*,0) NOT NULL ENABLE, 
  "UNP" NUMBER(*,0), 
  "NAME" VARCHAR2(100) NOT NULL ENABLE, 
  "ADDRESS" VARCHAR2(100) NOT NULL ENABLE, 
  "CHECKING_ACCOUNT" NUMBER(*,0) NOT NULL ENABLE, 
   CONSTRAINT "COUNTERPARTY_UN" UNIQUE ("UNP")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
   CONSTRAINT "COUNTERPARTY_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
   CONSTRAINT "FK_CHECKING_ACCOUNT" FOREIGN KEY ("CHECKING_ACCOUNT")
    REFERENCES "C##BSU"."CHECKING_ACCOUNT" ("ID") ON DELETE CASCADE ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;



INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(852907409, 'MTB BANK', 'PERVOMAUSKAYA 67', 587555319, 131);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(486744317, 'BELWEB BANK', 'KOZLOVA 18', 796243194, 171);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(754773562, 'BELGAZPROM BANK', 'TIMIRYAZEVA 1', 647107927, 181);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(508885784, 'BELAGRO BANK', 'KOLKOVA 4', 714116403, 191);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(582118400, 'SBER BANK', 'EVREMOVA 34', 813602189, 201);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(453851746, 'TINKOFF BANK', 'KOLESNIKOVA 54', 328615544, 211);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(126907075, 'RUSSIA  BANK', 'PETROVA 93', 725912731, 221);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(713635585, 'BELARUS BANK', 'RYKOVA 17', 581188224, 231);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(457035210, 'BSB BANK', 'ESENINA 122', 932658964, 241);
INSERT INTO "C##BSU".BANK (MFO, NAME, ADDRESS, UNP, BANK_CODE) VALUES(517659681, 'PRIVAT BANK', 'LENINA 15', 995685736, 251);

INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (1,554646,221,'Y',1);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (2,222565,201,'Y',2);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (3,264984,201,'Y',3);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (4,569763,201,'Y',4);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (5,478595,201,'Y',5);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (6,569858,201,'Y',6);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (7,336987,131,'Y',7);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (8,226799,131,'Y',8);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (9,257771,131,'Y',9);
INSERT INTO "C##BSU".CHECKING_ACCOUNT (ID,"NUMBER",BANK_CODE,STATUS,PAYMENT) VALUES (10,569848,171,'Y',10);

INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (1,554698,TIMESTAMP '2020-09-08 00:00:00.000000',1000,1,NULL,'payment',1);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (2,478333,TIMESTAMP '2020-09-08 00:00:00.000000',450,2,NULL,'payment',2);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (3,477898,TIMESTAMP '2020-09-08 00:00:00.000000',1000,3,NULL,'payment',3);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (4,123355,TIMESTAMP '2020-09-08 00:00:00.000000',450,4,NULL,'payment',1);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (5,555555,TIMESTAMP '2020-09-08 00:00:00.000000',450,1,NULL,'payment',2);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (6,556465,TIMESTAMP '2020-09-09 00:00:00.000000',1000,1,NULL,'payment',3);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (7,554569,TIMESTAMP '2020-09-09 00:00:00.000000',8000,2,NULL,'payment',4);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (8,478994,TIMESTAMP '2020-09-09 00:00:00.000000',7995,2,NULL,'payment',5);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (9,232554,TIMESTAMP '2020-09-10 00:00:00.000000',1000,1,NULL,'payment',6);
INSERT INTO "C##BSU".PAYMENT_ORDER (ID,"NUMBER","ORD_DATE",SUM,"ORDER",PAYMENT_CODE,AIM,ID_PAYEER) VALUES (10,665494,TIMESTAMP '2020-09-10 00:00:00.000000',1548,1,NULL,'payment',7);

INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (1,NULL,'Mark Bulah','Esenina 22',1);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (2,NULL,'Egor Kamysh','Slobodskaya 1',2);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (3,NULL,'Alex Syndic','Petrova 94',3);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (4,NULL,'Evgenue Kovalchuk','Zernova 11',4);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (5,NULL,'Lubov Karacharova','Lutinskaya 93',5);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (6,NULL,'Mihail Ladutsko','Lenina 94',6);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (7,NULL,'Yuriu Usovich','Adamova 42',7);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (8,NULL,'Vadim Gladkiu','Kosmonavtov 6',8);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (9,NULL,'Pavel Kirvason','Kozlova 11',9);
INSERT INTO "C##BSU".COUNTERPARTY (ID,UNP,NAME,ADDRESS,CHECKING_ACCOUNT) VALUES (10,NULL,'Taras Yermakov','Ermakova 9',10);
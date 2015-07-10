drop table usercredential;
drop table loginhistory;
drop table kandycustomerinfo;
DROP TABLE EVENTCREATION;
drop table kandylogindetail;
drop table agentcredential;
drop table agentloginhistory;

DROP SEQUENCE LOGIN_SEQ; 
DROP SEQUENCE EVENT_SEQ;

create table usercredential(
userid varchar2(10),
username varchar2(20),
password varchar2(30)
);


create table agentcredential(
userid varchar2(10),
username varchar2(20),
password varchar2(30),
role varchar2(2)
);



create table loginhistory(
loginid INTEGER NOT NULL,
userid varchar2(1000),
logintime timestamp,
logouttime timestamp);

create table kandylogindetail(
userid varchar2(10),
kandyuserid varchar2(20),
logintime timestamp,
logouttime timestamp);


create table agentloginhistory(
loginid INTEGER NOT NULL,
userid varchar2(1000),
logintime timestamp,
logouttime timestamp);

create table kandycustomerinfo(
kandyusername varchar2(60),
password varchar2(60), 
apikey varchar2(100));

CREATE TABLE EVENTCREATION(
EVENTID VARCHAR2(20),
MAILID VARCHAR2(60),
EVENTDATE DATE,
EVENTTIME varchar2(4));

Insert into USERCREDENTIAL (USERID,USERNAME,PASSWORD) values ('mdmans','Mansoor MohammedAli','1');
Insert into USERCREDENTIAL (USERID,USERNAME,PASSWORD) values ('basha54','Basha Abdul','1');
Insert into USERCREDENTIAL (USERID,USERNAME,PASSWORD) values ('ramesh','Ramesh Paulraj','1');

Insert into KANDYCUSTOMERINFO (KANDYUSERNAME,PASSWORD,APIKEY) values ('user001','reset@123','DAK5aa3e878df1d46ca9f83e27ad0dfba1f');
Insert into KANDYCUSTOMERINFO (KANDYUSERNAME,PASSWORD,APIKEY) values ('user002','reset@123','DAK5aa3e878df1d46ca9f83e27ad0dfba1f');
Insert into KANDYCUSTOMERINFO (KANDYUSERNAME,PASSWORD,APIKEY) values ('user003','reset@123','DAK5aa3e878df1d46ca9f83e27ad0dfba1f');

Insert into AGENTCREDENTIAL (USERID,USERNAME,PASSWORD,ROLE) values ('agent','Hari Ram','1' ,'1');
Insert into AGENTCREDENTIAL (USERID,USERNAME,PASSWORD,ROLE) values ('admin','Shaik Adil','1','2');

CREATE SEQUENCE  "LOGIN_SEQ"  MINVALUE 1 MAXVALUE 100 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "EVENT_SEQ"  MINVALUE 1 MAXVALUE 100 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
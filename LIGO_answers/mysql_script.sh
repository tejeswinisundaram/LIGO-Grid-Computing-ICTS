#!/bin/bash
mysql -u root -p$pwd<< EOF
show databases;
create database if not exists dogmatix;
show databases;
use mysql;
grant all on dogmatix.* to 'ligo'@'localhost' identified by 'ligo';
show grants for 'ligo'@'localhost';
use dogmatix;
select database();
CREATE TABLE IF NOT EXISTS ligo_users( Name char(20) NOT NULL, Email varchar(30) NOT NULL, primary key(Email));
DESCRIBE ligo_users;
INSERT INTO ligo_users values ('Albert','albert@dogmatix.icts.res.in');
INSERT INTO ligo_users values ('Einstein','einstein@dogmatix.icts.res.in');
select * from ligo_users;
EOF

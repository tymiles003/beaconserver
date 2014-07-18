-- database     = mysql
-- encodeing    = utf-8

-- set default encoding
SET character_set_client        = utf8;  
SET character_set_connection    = utf8;  
SET character_set_database      = utf8;  
SET character_set_results       = utf8;  
SET character_set_server        = utf8; 

-- create database
create database beacon;

-- change database
use beacon;

-- create table

-- table user
create table user(
    id              bigint(20) unsigned     not null primary key auto_increment,
    username        varchar(60)             not null,
    passwd          varchar(64)             not null,
    usertype        int(8)                  not null,
    realname        varchar(64),
    tel             varchar(20),
    email           varchar(64),
    url             varchar(128),
    company         varchar(250)            not null,
    remark          longtext,
    registertime    datetime                not null default now(),
    lastlogintime   datetime                not null default now(),

    /* convert ip to int(10) with ip2long, otherwise use long2ip */
    lastloginip     int(10),    
    lastloginaddr   longtext,

    /* 0=PC 1=Android 2=iPhone 3=Other */
    lastloginmode   int(8),

    /* reserved info */
    property        longtext
);

-- table usermeta
create table usermeta(
    metaid          bigint(20) unsigned     not null primary key auto_increment,
    uid             bigint(20) unsigned     not null,
    meta_key        varchar(255)            not null,
    meta_value      longtext                not null,

    /* reserved info */
    property        longtext
);

-- table beacon
create table beacon(
    id              bigint(20) unsigned     not null primary key auto_increment,
    beaconname      varchar(60)             not null,
    userid          bigint(20) unsigned     not null,
    mac             varchar(17),
    company         varchar(255)            not null,

    /* this beacon belongs which plan */
    planid          bigint(20) unsigned,

    floor           int(8)                  not null,
    x               int(8)                  not null,
    y               int(8)                  not null,
    description     longtext,

    /* reserved info */
    property        longtext
);

-- table promotion
create table promotion(
    id              bigint(20) unsigned     not null primary key auto_increment,
    type            int(8)                  not null,
    beaconid        bigint(20) unsigned     not null,
    title           varchar(255)            not null,
    company         varchar(255)            not null,

    /* split with space, such as "computer keyboard mouse" */
    keyword         varchar(255),
    starttime       datetime                not null,
    endtime         datetime                not null,
    imageurl        varchar(255)            not null,
    content         longtext,

    /* reserved info */
    property        longtext
);

-- table plan
create table plan(
    id              bigint(20) unsigned     not null primary key auto_increment,
    name            varchar(50)             not null,
    uid             bigint(20) unsigned     not null,

    /* reserved info */
    property        longtext
);

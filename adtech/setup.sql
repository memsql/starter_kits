drop database if exists adtech;
create database adtech;
use adtech;

create table events (
   user_id int
   ,event_name varchar(128)
   ,advertiser varchar(128)
   ,campaign int(11)
   ,gender varchar(128)
   ,income varchar(128)
   ,page_url varchar(128)
   ,country varchar(128)
   ,total_cost float
   ,created_date date
   ,key adtmidx (user_id, event_name, advertiser, campaign) using clustered columnstore
   ,shard key user_id (user_id)
);

create or replace pipeline load_events as
load data s3 'reference-solutions.memsql.com/events-large.tsv.gz'
config '{"region": "us-east-1"}'
credentials '{"aws_access_key_id": "", "aws_secret_access_key": ""}'
into table events;
start pipeline load_events;

create reference table campaigns (
   campaign_id int not null
  ,campaign_name varchar(255) character set utf8 collate utf8_general_ci
  ,end_date date
  ,is_active_now boolean
  ,primary key (campaign_id)
);

create or replace pipeline load_campaigns as
load data s3 'reference-solutions.memsql.com/campaigns-large.tsv.gz'
config '{"region": "us-east-1"}'
credentials '{"aws_access_key_id": "", "aws_secret_access_key": ""}'
skip duplicate key errors
into table campaigns;
start pipeline load_campaigns;

create table networks (
   network_id integer not null
  ,network_name varchar(128) not null
  ,primary key (network_id)
);

create or replace pipeline load_networks as
load data s3 'reference-solutions.memsql.com/networks-large.tsv.gz'
config '{"region": "us-east-1"}'
credentials '{"aws_access_key_id": "", "aws_secret_access_key": ""}'
skip duplicate key errors
into table networks;
start pipeline load_networks;

create table platforms (
   platform_id integer not null
  ,network_name varchar(128) not null
  ,primary key (platform_id)
);

create or replace pipeline load_platforms as
load data s3 'reference-solutions.memsql.com/platforms-large.tsv.gz'
config '{"region": "us-east-1"}'
credentials '{"aws_access_key_id": "", "aws_secret_access_key": ""}'
skip duplicate key errors
into table platforms;
start pipeline load_platforms;

create table commissions (
   commission_id int not null default'0',
  ,network_id integer not null
  ,event_time datetime not null
  ,advertiser_name text not null
  ,campaign_id integer
  ,commission_amount decimal(9,2) not null
  ,platform_id integer
);

create table daily_profit (
   event_date date not null
  ,platform_1 decimal(9,2) default 0
  ,platform_2 decimal(9,2) default 0
);

create table metrics (
   event_date date not null
  ,impressions integer default 0
  ,spend decimal(9,2) deault 0
  ,campaign_id integer not null
  ,platform_id integer not null
);

create table offers (
   offer_id integer not null
  ,network_id integer not null
  ,merchant_id text not null
  ,target_domain text not null
  ,primary key (offer_id)
);

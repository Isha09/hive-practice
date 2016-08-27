/*1. Load data in hdfs, give self explanatory names and not just the ones given in csv files. The 'presence' data should be created as partitioned(think for yourself what column(s) will be best suited for patitioning). Also upload some sample data (1-2 lines) for the sake of clarity on exactly what kind of data you worked on.*/

/*creating table calls*/
create table calls (caller_No string,receiver_No string,call_direction string,call_duration smallint,call_timestamp string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

/*creating table messages*/
create table messages (caller_No string,receiver_No string,call_direction string,msg_len string,call_timestamp string)

ROW FORMAT DELIMITED

FIELDS TERMINATED BY ','
tblproperties("skip.header.line.count"="1");

/*loading data in calls and messages*/

LOAD DATA INPATH '/user/samples/samplecalls.csv' into table calls;
LOAD DATA INPATH '/user/samples/samplemessages.csv' into table messages;

/*created staging table first and loaded presences data in it , below is the statment for creating partioned table*/
create table presences (device_id1 string,device_id2 string,device_class string,use_timestamp string)
PARTITIONED BY (device_name string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ',';

/*switching off static partitionig prop so tht dynamic partitoning used.*/
set hive.exec.dynamic.partition.mode=nonstrict;

/*loading data into partitioned table...test is staging table;*/
insert into table presences partition(device_name) select device_id1, device_id2,
device_class,use_timestamp,device_name from test;
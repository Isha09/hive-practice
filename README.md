# Practice and learning of various Hive concepts
Covers various hive concepts, queries using sample open telecom data

**Data Elements Explanation**

**calls.csv and messages.csv**
user - phone number of user
other - phone number of the other end of the call/message
direction - incoming or outgoing
duration - call duration in seconds
timestamp - timestamp is the one recorded by the phone when the call/message was originally recorded.
length - number of characters in the message

**presence.csv**
user - bluetooth/wifi id
other - bluetooth/wifi id
name - human readable name of device
class - bluetooth/wifi class
timestamp - as explained before

**Exercises done -**
1. Load data in hdfs, give self explanatory names and not just the ones given in csv files. The 'presence' data should be created as partitioned(think for yourself what column(s) will be best suited for patitioning). Also upload some sample data (1-2 lines) for the sake of clarity on exactly what kind of data you worked on.

2. Identify which numbers made calls as well as made sms messages, where number of calls made should be more than 10 and number of messages should be more than 5.

3. What is the length of average SMS conversation. A length of 2 means that there were 2 SMS messages exchanged the two parties.

4. What is the nth longest SMS conversation length.

5. What is the frequency of 'sms', 'calls' by each day of week. What about by hour of day?

6. Make a UDF as java file for hive (by extending UDF class I guess) to convert timestamp in calls data to something that a db like mysql can understand clearly and then use that udf in a query

7. Find which users sent at least 10 more messages in the month of Jan than in the month of Feb.

8. Find which users sent smses but did not make calls (can you use NOT IN, how to replace NOT IN by JOINS)

9. What is the difference between managed and external tables? When to use what?
Managed and External Tables in hive:
Managed table

Managed table is also called as Internal table. This is the default table in Hive. When we create a table in Hive without specifying it as a managed or external, by default we will get a Managed table.
If we create a table as a managed table, the table will be created in a specific location in HDFS.
By default the table data will be created in /usr/hive/warehouse directory of HDFS.
If we delete a Managed table, both the table data and meta data for that table will be deleted from the HDFS.

Creating Mnagaed Table:
create table employee(Name String, Sal Int) row format delimited fields terminated by ',';

to check the details of the table:
describe formatted table_name;

loading data:
load data local inpath 'path of the file' into table employee;

Check the contents of the table in HDFS by using the below command:
adoop dfs -ls hdfs://localhost:9000/user/hive/warehouse/employee

Drop table:
drop table employee;
Note: contenets will also be deleted.

EXTERNAL TABLE

External table is created for external use as when the data is used outside Hive. Whenever we want to delete the table’s metadata and want to keep the table’s data as it is, we use External table. External table only deletes the schema of the table.
Creating external table:
create external table employee(Name String, Sal Int) row format delimited fields terminated by ',';
Note: here when we drop external table the data or contents doesn't get deleted but only schema gets deleted.

When to use External and Managed table
Managed table
    Data is temporary
    Hive to Manage the table data completely not allowing any external source to use the table
    Don’t want data after deletion
External table
    The data is also used outside of Hive. For example, the data files are read and processed by an existing program that doesn’t lock the files
    Hive should not own data and control settings, dirs, etc., you have another program or process that will do those things
    You are not creating table based on existing table (AS SELECT)
    Can create table back and with the same schema and point the location of the data
    
10. What does describe function do?
To see table definition in Hive, run command
    describe <table name>;
To see more detailed information about the table, run command
    describe extended <tablename>;
There are three ways to describe a table in Hive.

1) To see table primary info of Hive table, use describe table_name; command
2) To see more detailed information about the table, use describe extended table_name; command
3) To see code in a clean manner use describe formatted table_name; command to see all information. also describe all details in a clean manner.

11. What does collect_set standard aggregate function does?
collect_set(col) 	Returns a set of objects with duplicate elements eliminated

COLLECT_SET returns an array, with which you can then concatenate the entries into a single comma-separated value using CONCAT_WS:

elect serial_num, concat_ws(",", collect_set(customer_lastName)) as concatenate_lastNames from External_Table group by serial_num
www.ibm.com/developerworks/library/bd-hiveanalyze/
https://hadoopist.wordpress.com/2015/01/03/creating-collect-set-using-hive-analytical-functions/
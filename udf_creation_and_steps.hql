/*9. Make a UDF as java file for hive (by extending UDF class I guess) to convert timestamp in calls data to something 
that a db like mysql can understand clearly and then use that udf in a query
JavaFileName : ConvDate.java
****--------Steps to execute UDF---------*****
//command to copy udf jar file to respective folder
sudo cp HiveMavenProj-0.0.1-SNAPSHOT.jar /usr/lib/hive/lib

//commands used in hive terminal to run the udf;
hive> ADD JAR /usr/lib/hive/lib/HiveMavenProj-0.0.1-SNAPSHOT.jar;
hive> CREATE TEMPORARY FUNCTION new_date AS 'HiveMaven.HiveMavenProj.ConvDate';
hive> select new_date(call_timestamp) from calls limit 2;*/
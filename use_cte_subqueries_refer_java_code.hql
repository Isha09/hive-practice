/*3. What is the length of average SMS conversation. A length of 2 means that there were 2 SMS messages exchanged the two parties.*/
/*below is the sample query used inside the java code*/
WITH cte AS 
   (
   SELECT caller_no, receiver_no, count(*) as countCalls
   FROM   calls group by caller_no, receiver_no
   )
select count(distinct(col1)) from
(
SELECT concat(caller_no,receiver_no) as col1 FROM cte
WHERE  caller_no <= receiver_no
UNION ALL
SELECT concat(receiver_no,caller_no) as col1 FROM cte
WHERE  caller_no >  receiver_no
) a ;

/*Note: For this i used jdbc connection to execute queries in hive and then finding average
Java code is present in file named AvgCalls.java*/
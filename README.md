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

9. What is the difference between managed and external tables? When to use what? - added in the folder MoreInformation.
    
10. What does describe function do? - added in the folder MoreInformation.

11. What does collect_set standard aggregate function does? - added in the folder MoreInformation.

12. Types of File formats in hive - added in the folder MoreInformation.

13. What is the difference between truncating a table and deleting all records from it in hive? - added in the folder MoreInformation.
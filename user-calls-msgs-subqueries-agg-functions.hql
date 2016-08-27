/*2. Identify which numbers made calls as well as made sms messages, where number of calls made should be more than 10 and number of messages should be more than 5.*/
select call.caller_no from (select caller_no, count(receiver_no) as total_calls
from calls group by caller_no having total_calls > 10) as call
,(select caller_no, count(receiver_no) as total_msgs
from messages group by caller_no having total_msgs > 5) as msgs where 
call.caller_no = msgs.caller_no;
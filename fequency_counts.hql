/*5. What is the frequency of 'sms', 'calls' by each day of week. What about by hour of day?*/

/*freq by day*/
Select day_of_week, count(*) as call_by_day
from 
 (
 SELECT caller_no ,receiver_no , substr(call_timestamp, 1, 3) as day_of_week
 FROM calls 
 where length(caller_no) in (10,11) and length(receiver_no) in (10,11) 
)a group by day_of_week;

/*Call by hour of day*/
Select hour_of_day, count(*) as call_by_hour
from 
 (
 SELECT caller_no ,receiver_no , substr(call_timestamp, 12, 2) as hour_of_day
 FROM calls 
 where length(caller_no) in (10,11) and length(receiver_no) in (10,11) 
)a group by hour_of_day;
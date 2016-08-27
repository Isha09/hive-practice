/*6. Find which users sent at least 10 more messages in the month of Jan than in the month of Feb.*/
with cte as (
  select caller_no, substr(call_timestamp, 5, 3) as mon, count(*) as total_msgs 
  from messages
  group by caller_no,substr(call_timestamp, 5, 3))
  
  select a.caller_no, a.mon, a.total_msgs ,
  b.caller_no, b.mon, b.total_msgs
  from cte a 
  join 
  cte b 
  on (a.caller_no = b.caller_no)
  where a.mon <> b.mon
  and a.mon = "Jan" 
  and b.mon ="Mar"
  and a.total_msgs > (10 + b.total_msgs);
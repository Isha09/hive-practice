/*7. Find which users sent smses but did not make calls (can you use NOT IN, how to replace NOT IN by JOINS)*/
/*using joins*/
select m.caller_no, c.caller_no
from messages m
left outer join
calls c
on (m.caller_no = c.caller_no)
where c.caller_no = null;

/*without joins*/
select messages.caller_no 
from messages 
where messages.caller_no not in
(
  select distinct c.caller_no 
  from calls c
);
/*4. What is the nth longest SMS conversation length.*/
select final.totalcalls, final.rownum from 
(
 select distinct a.totalcalls, 
                 ROW_NUMBER() OVER (ORDER BY a.totalcalls desc) as rownum
 from
 (
  select b.caller_no, b.receiver_no, count(*) as totalcalls 
  from 
  (
    SELECT caller_no ,receiver_no FROM calls
    WHERE  caller_no <= receiver_no
    UNION ALL
    SELECT receiver_no as caller_no,caller_no as receiver_no FROM calls
    WHERE  caller_no >  receiver_no
  ) b
  where length(b.caller_no) in (10,11) and length(b.receiver_no) in (10,11)
  group by b.caller_no, b.receiver_no
 ) a
)final where final.rownum = 3;
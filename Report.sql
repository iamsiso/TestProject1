with temp as(
select distinct ReportMainId from ReportFlow t
where t.reportmainid in (select id from reportmain where flowmainid = 3 )
and t.flowdetailid = 0
),
temp2 as(
select reportmainid,count(Id) as n from ReportFlow where reportmainid in
(select reportmainid from temp)
group by reportmainid
having count(Id) <4
)


update  ReportMain set CurrentFlowDetailId = 10 where  id in(select reportmainid from temp2)

--delete from reportflow where reportmainid in(select reportmainid from temp2) and (flowdetailid=0 or flowdetailid = 12)

1 . select EventRequest.eventno,EventRequest.dateheld,COUNT(*) As PlanNo 
     from  EventPlan,EventRequest 
    where (EventPlan.eventno=EventRequest.eventno) AND date_format(EventPlan.workdate,"%m")=12 
    group by eventno having COUNT(*)>1;

2. select planno,EventPlan.eventno,workdate,activity 
   from EventPlan inner join EventRequest on EventPlan.eventno=EventRequest.eventno 
                  inner join Facility on Facility.facno=EventRequest.facno   	 
   where Facility.facno=(select facno from Facility where facname="Basketball Arena") 
          and (date_format(EventPlan.workdate,"%m")=12); 

3. select planno,EventRequest.eventno,dateheld,workdate,status,estcost 
   from EventRequest inner join EventPlan on EventRequest.eventno=EventPlan.eventno 
                     inner join Employee on Employee.empno=EventPlan.empno   
                     inner join Facility on Facility.facno=EventRequest.facno
  where EventPlan.empno=(select empno from Employee where empname="Mary Manager ") 
        and (workdate between "2018-10-01" and "2018-12-31" )
        and EventRequest.facno=(select facno from Facility where facname="Basketball Arena") ;

4.select EventPlanLine.planno,line,timestart,timeend,locname,resname,numberFld
  from EventPlanLine inner join ResourceTbl on ResourceTbl.resno=EventPlanLine.resNo 
                     inner join Location on Location.locno=EventPlanLine.locNo
                     inner join EventPlan on EventPlan.planno=EventPlanLine.planno
                     inner join EventRequest on EventRequest.eventno=EventPlan.eventno 
                     inner join  Facility on Facility.facno=EventRequest.facno 
  where Facility.facno=(select facno from Facility where facname="Basketball Arena") 
         and (EventPlan.activity="Operation") 
         and EventPlan.workdate between "2018-10-01" and "2018-12-31";

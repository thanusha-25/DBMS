insert into Facility values("F104","Swimming pool");

insert into Location values("L107","F104","Door");

insert into Location values("L108","F104","Locker Room");

update Location set locname="Gate" where locno="L107"; 

delete from Location where  locno="L108";
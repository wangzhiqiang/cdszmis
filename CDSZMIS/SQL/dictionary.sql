--字典数据
insert into tb_sysdictionary (properties,name,seq,createdate)values('职务字典','院长','position_01','2011-03-11');
insert into tb_sysdictionary (properties,name,seq,createdate)values('职务字典','书记','position_02','2011-03-11');
insert into tb_sysdictionary (properties,name,seq,createdate)values('职务字典','副院长','position_03','2011-03-11');
insert into tb_sysdictionary (properties,name,seq,createdate)values('职务字典','总工程师','position_04','2011-03-11');
insert into tb_sysdictionary (properties,name,seq,createdate)values('职务字典','主任','position_05','2011-03-11');
insert into tb_sysdictionary (properties,name,seq,createdate)values('职务字典','所长','position_06','2011-03-11');
 
insert into tb_sysdictionary (properties,name,seq,createdate)values('职称字典','会计','titles_01','2011-03-11');
insert into tb_sysdictionary (properties,name,seq,createdate)values('职称字典','工程师','titles_02','2011-03-11');

insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('办公室','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('财务室','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('经营室','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('总工办','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('审图中心','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('设计一所','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('设计二所','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('设计三所','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('建筑园林所','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');
insert into tb_depart(departname,departnode,responsibility,departowner,departphonenumber,status,createdate) values('测量设计所','日常办公部门,处理院内事物','人员调配,资源分配等','admin','12345678',1,'2011-03-11');

  
  select * 
  from tb_user userentity0_ where userentity0_.uspass='418296719726' and userentity0_.loginname='admin'
 
 
 

--**==================================================------
--****************************************************------
--**注意：执行脚本后会修改表结构，请确认执行
--****************************************************------
--**==================================================------


-----=====================[WebApiUser](创建表、修改表)==================================---
if not exists (select * from sysobjects where [name] = 'WebApiUser' and xtype='U')
begin
	Create table WebApiUser
    (          ClientCode  char (8)   NULL,
          UserId  char (12)   NULL,
          CreateDate  datetime  NULL,
          ClientKey  char (10)   NULL,
          Remark  nvarchar (MAX)   NULL,
          WebApiUserId  char (12)  NOT NULL,

     )

	--检查这个表对象是否有创建序列对象，如果没有创建序列对象，则自动创建
	if object_id('WebApiUser',N'U') is not null
	begin
		declare @SeqObjWebApiUser nvarchar(100)
		set @SeqObjWebApiUser=rtrim(ltrim('WebApiUser'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApiUser)
		begin
			--如果这个序列对象不存在，则创建这个序列对象
			declare @queryWebApiUser nvarchar(max)  
			set @queryWebApiUser = 'create sequence '+ @SeqObjWebApiUser+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebApiUser
		end
	end



end 
else
begin
	    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiUser')   and   name='ClientCode')
     begin
               ALTER TABLE WebApiUser ADD ClientCode char (8)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiUser')   and   name='UserId')
     begin
               ALTER TABLE WebApiUser ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiUser')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiUser ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiUser')   and   name='ClientKey')
     begin
               ALTER TABLE WebApiUser ADD ClientKey char (10)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiUser')   and   name='Remark')
     begin
               ALTER TABLE WebApiUser ADD Remark nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiUser')   and   name='WebApiUserId')
     begin
               ALTER TABLE WebApiUser ADD WebApiUserId char (12) NOT NULL 

     END

end




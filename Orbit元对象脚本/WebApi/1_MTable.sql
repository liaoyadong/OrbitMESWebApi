
--**==================================================------
--****************************************************------
--**注意：执行脚本后会修改表结构，请确认执行
--****************************************************------
--**==================================================------


-----=====================[WebApiParams](创建表、修改表)==================================---
if not exists (select * from sysobjects where [name] = 'WebApiParams' and xtype='U')
begin
	Create table WebApiParams
    (          Remark  nvarchar (MAX)   NULL,
          WebApiId  char (12)   NULL,
          WebApiParamsId  char (12)  NOT NULL,
          IsMust  bit  NULL DEFAULT(((0))),
          CreateDate  datetime  NULL,
          ParamName  nvarchar (50)   NULL,
          UserId  char (12)   NULL,

     )

	--检查这个表对象是否有创建序列对象，如果没有创建序列对象，则自动创建
	if object_id('WebApiParams',N'U') is not null
	begin
		declare @SeqObjWebApiParams nvarchar(100)
		set @SeqObjWebApiParams=rtrim(ltrim('WebApiParams'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApiParams)
		begin
			--如果这个序列对象不存在，则创建这个序列对象
			declare @queryWebApiParams nvarchar(max)  
			set @queryWebApiParams = 'create sequence '+ @SeqObjWebApiParams+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebApiParams
		end
	end



end 
else
begin
	    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='Remark')
     begin
               ALTER TABLE WebApiParams ADD Remark nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiParams ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiParamsId')
     begin
               ALTER TABLE WebApiParams ADD WebApiParamsId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='IsMust')
     begin
               ALTER TABLE WebApiParams ADD IsMust bit  NULL DEFAULT(((0)))

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiParams ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='ParamName')
     begin
               ALTER TABLE WebApiParams ADD ParamName nvarchar (50)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='UserId')
     begin
               ALTER TABLE WebApiParams ADD UserId char (12)  NULL 

     END

end




-----=====================[WebApiAuthorizedUser](创建表、修改表)==================================---
if not exists (select * from sysobjects where [name] = 'WebApiAuthorizedUser' and xtype='U')
begin
	Create table WebApiAuthorizedUser
    (          WebApiUserid  char (12)  NOT NULL,
          UserId  char (12)   NULL,
          WebApiAuthorizedUserId  char (12)  NOT NULL,
          WebApiId  char (12)   NULL,
          CreateDate  datetime  NULL,

     )

	--检查这个表对象是否有创建序列对象，如果没有创建序列对象，则自动创建
	if object_id('WebApiAuthorizedUser',N'U') is not null
	begin
		declare @SeqObjWebApiAuthorizedUser nvarchar(100)
		set @SeqObjWebApiAuthorizedUser=rtrim(ltrim('WebApiAuthorizedUser'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApiAuthorizedUser)
		begin
			--如果这个序列对象不存在，则创建这个序列对象
			declare @queryWebApiAuthorizedUser nvarchar(max)  
			set @queryWebApiAuthorizedUser = 'create sequence '+ @SeqObjWebApiAuthorizedUser+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebApiAuthorizedUser
		end
	end



end 
else
begin
	    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='Remark')
     begin
               ALTER TABLE WebApiParams ADD Remark nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiParams ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiParamsId')
     begin
               ALTER TABLE WebApiParams ADD WebApiParamsId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='IsMust')
     begin
               ALTER TABLE WebApiParams ADD IsMust bit  NULL DEFAULT(((0)))

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiParams ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='ParamName')
     begin
               ALTER TABLE WebApiParams ADD ParamName nvarchar (50)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='UserId')
     begin
               ALTER TABLE WebApiParams ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiUserid')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiUserid char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='UserId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiAuthorizedUserId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiAuthorizedUserId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD CreateDate datetime NULL 

     END

end




-----=====================[WebAPILog](创建表、修改表)==================================---
if not exists (select * from sysobjects where [name] = 'WebAPILog' and xtype='U')
begin
	Create table WebAPILog
    (          WebAPILogId  char (12)  NOT NULL,
          WebAPIId  char (12)   NULL,
          RequestData  nvarchar (MAX)   NULL,
          ResponseData  nvarchar (MAX)   NULL,
          WebApiUserId  char (12)   NULL,
          ip  nvarchar (15)   NULL,
          Result  int  NULL,
          CreateDate  datetime  NULL,

     )

	--检查这个表对象是否有创建序列对象，如果没有创建序列对象，则自动创建
	if object_id('WebAPILog',N'U') is not null
	begin
		declare @SeqObjWebAPILog nvarchar(100)
		set @SeqObjWebAPILog=rtrim(ltrim('WebAPILog'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebAPILog)
		begin
			--如果这个序列对象不存在，则创建这个序列对象
			declare @queryWebAPILog nvarchar(max)  
			set @queryWebAPILog = 'create sequence '+ @SeqObjWebAPILog+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebAPILog
		end
	end



end 
else
begin
	    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='Remark')
     begin
               ALTER TABLE WebApiParams ADD Remark nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiParams ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiParamsId')
     begin
               ALTER TABLE WebApiParams ADD WebApiParamsId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='IsMust')
     begin
               ALTER TABLE WebApiParams ADD IsMust bit  NULL DEFAULT(((0)))

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiParams ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='ParamName')
     begin
               ALTER TABLE WebApiParams ADD ParamName nvarchar (50)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='UserId')
     begin
               ALTER TABLE WebApiParams ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiUserid')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiUserid char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='UserId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiAuthorizedUserId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiAuthorizedUserId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='WebAPILogId')
     begin
               ALTER TABLE WebAPILog ADD WebAPILogId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='WebAPIId')
     begin
               ALTER TABLE WebAPILog ADD WebAPIId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='RequestData')
     begin
               ALTER TABLE WebAPILog ADD RequestData nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='ResponseData')
     begin
               ALTER TABLE WebAPILog ADD ResponseData nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='WebApiUserId')
     begin
               ALTER TABLE WebAPILog ADD WebApiUserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='ip')
     begin
               ALTER TABLE WebAPILog ADD ip nvarchar (15)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='Result')
     begin
               ALTER TABLE WebAPILog ADD Result int NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='CreateDate')
     begin
               ALTER TABLE WebAPILog ADD CreateDate datetime NULL 

     END

end




-----=====================[WebApi](创建表、修改表)==================================---
if not exists (select * from sysobjects where [name] = 'WebApi' and xtype='U')
begin
	Create table WebApi
    (          WebApiName  nvarchar (50)   NULL,
          UserId  char (12)   NULL,
          StorProcedureName  nvarchar (200)   NULL,
          CreateDate  datetime  NULL,
          WebApiId  char (12)  NOT NULL,
          Remark  nvarchar (MAX)   NULL,

     )

	--检查这个表对象是否有创建序列对象，如果没有创建序列对象，则自动创建
	if object_id('WebApi',N'U') is not null
	begin
		declare @SeqObjWebApi nvarchar(100)
		set @SeqObjWebApi=rtrim(ltrim('WebApi'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApi)
		begin
			--如果这个序列对象不存在，则创建这个序列对象
			declare @queryWebApi nvarchar(max)  
			set @queryWebApi = 'create sequence '+ @SeqObjWebApi+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebApi
		end
	end



end 
else
begin
	    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='Remark')
     begin
               ALTER TABLE WebApiParams ADD Remark nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiParams ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='WebApiParamsId')
     begin
               ALTER TABLE WebApiParams ADD WebApiParamsId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='IsMust')
     begin
               ALTER TABLE WebApiParams ADD IsMust bit  NULL DEFAULT(((0)))

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiParams ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='ParamName')
     begin
               ALTER TABLE WebApiParams ADD ParamName nvarchar (50)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiParams')   and   name='UserId')
     begin
               ALTER TABLE WebApiParams ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiUserid')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiUserid char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='UserId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiAuthorizedUserId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiAuthorizedUserId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='WebApiId')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD WebApiId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApiAuthorizedUser')   and   name='CreateDate')
     begin
               ALTER TABLE WebApiAuthorizedUser ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='WebAPILogId')
     begin
               ALTER TABLE WebAPILog ADD WebAPILogId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='WebAPIId')
     begin
               ALTER TABLE WebAPILog ADD WebAPIId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='RequestData')
     begin
               ALTER TABLE WebAPILog ADD RequestData nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='ResponseData')
     begin
               ALTER TABLE WebAPILog ADD ResponseData nvarchar (MAX)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='WebApiUserId')
     begin
               ALTER TABLE WebAPILog ADD WebApiUserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='ip')
     begin
               ALTER TABLE WebAPILog ADD ip nvarchar (15)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='Result')
     begin
               ALTER TABLE WebAPILog ADD Result int NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebAPILog')   and   name='CreateDate')
     begin
               ALTER TABLE WebAPILog ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApi')   and   name='WebApiName')
     begin
               ALTER TABLE WebApi ADD WebApiName nvarchar (50)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApi')   and   name='UserId')
     begin
               ALTER TABLE WebApi ADD UserId char (12)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApi')   and   name='StorProcedureName')
     begin
               ALTER TABLE WebApi ADD StorProcedureName nvarchar (200)  NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApi')   and   name='CreateDate')
     begin
               ALTER TABLE WebApi ADD CreateDate datetime NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApi')   and   name='WebApiId')
     begin
               ALTER TABLE WebApi ADD WebApiId char (12) NOT NULL 

     END
    if not exists (select   *   from   syscolumns   where   id=object_id('WebApi')   and   name='Remark')
     begin
               ALTER TABLE WebApi ADD Remark nvarchar (MAX)  NULL 

     END

end




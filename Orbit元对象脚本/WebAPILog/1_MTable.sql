
--**==================================================------
--****************************************************------
--**ע�⣺ִ�нű�����޸ı�ṹ����ȷ��ִ��
--****************************************************------
--**==================================================------


-----=====================[WebAPILog](�������޸ı�)==================================---
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

	--������������Ƿ��д������ж������û�д������ж������Զ�����
	if object_id('WebAPILog',N'U') is not null
	begin
		declare @SeqObjWebAPILog nvarchar(100)
		set @SeqObjWebAPILog=rtrim(ltrim('WebAPILog'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebAPILog)
		begin
			--���������ж��󲻴��ڣ��򴴽�������ж���
			declare @queryWebAPILog nvarchar(max)  
			set @queryWebAPILog = 'create sequence '+ @SeqObjWebAPILog+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebAPILog
		end
	end



end 
else
begin
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




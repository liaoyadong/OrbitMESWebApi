
--**==================================================------
--****************************************************------
--**ע�⣺ִ�нű�����޸ı�ṹ����ȷ��ִ��
--****************************************************------
--**==================================================------


-----=====================[WebApiParams](�������޸ı�)==================================---
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

	--������������Ƿ��д������ж������û�д������ж������Զ�����
	if object_id('WebApiParams',N'U') is not null
	begin
		declare @SeqObjWebApiParams nvarchar(100)
		set @SeqObjWebApiParams=rtrim(ltrim('WebApiParams'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApiParams)
		begin
			--���������ж��󲻴��ڣ��򴴽�������ж���
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




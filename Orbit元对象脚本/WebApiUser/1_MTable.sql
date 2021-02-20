
--**==================================================------
--****************************************************------
--**ע�⣺ִ�нű�����޸ı�ṹ����ȷ��ִ��
--****************************************************------
--**==================================================------


-----=====================[WebApiUser](�������޸ı�)==================================---
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

	--������������Ƿ��д������ж������û�д������ж������Զ�����
	if object_id('WebApiUser',N'U') is not null
	begin
		declare @SeqObjWebApiUser nvarchar(100)
		set @SeqObjWebApiUser=rtrim(ltrim('WebApiUser'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApiUser)
		begin
			--���������ж��󲻴��ڣ��򴴽�������ж���
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




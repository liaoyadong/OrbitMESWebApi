
--**==================================================------
--****************************************************------
--**ע�⣺ִ�нű�����޸ı�ṹ����ȷ��ִ��
--****************************************************------
--**==================================================------


-----=====================[WebApiAuthorizedUser](�������޸ı�)==================================---
if not exists (select * from sysobjects where [name] = 'WebApiAuthorizedUser' and xtype='U')
begin
	Create table WebApiAuthorizedUser
    (          WebApiUserid  char (12)  NOT NULL,
          UserId  char (12)   NULL,
          WebApiAuthorizedUserId  char (12)  NOT NULL,
          WebApiId  char (12)   NULL,
          CreateDate  datetime  NULL,

     )

	--������������Ƿ��д������ж������û�д������ж������Զ�����
	if object_id('WebApiAuthorizedUser',N'U') is not null
	begin
		declare @SeqObjWebApiAuthorizedUser nvarchar(100)
		set @SeqObjWebApiAuthorizedUser=rtrim(ltrim('WebApiAuthorizedUser'))+'_PK'
		if not exists(select 1 from sysobjects where type='SO' and name=@SeqObjWebApiAuthorizedUser)
		begin
			--���������ж��󲻴��ڣ��򴴽�������ж���
			declare @queryWebApiAuthorizedUser nvarchar(max)  
			set @queryWebApiAuthorizedUser = 'create sequence '+ @SeqObjWebApiAuthorizedUser+' as bigint start with ' + 
				cast(1000 as nvarchar(30))+ ' increment by 1 no cycle cache 100'  
			EXEC sp_executesql  @queryWebApiAuthorizedUser
		end
	end



end 
else
begin
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




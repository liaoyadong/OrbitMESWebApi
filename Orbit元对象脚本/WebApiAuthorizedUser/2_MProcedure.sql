
--**==================================================------
--****************************************************------
--**ע��:Ԫ���� Old�洢���̽������ǣ��洢���̸��°��� ViewList���̵ĸ���
--****************************************************------
--**==================================================------


-----=====================[WebApiClient_ViewList](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiClient_ViewList') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiClient_ViewList
   end
GO



-- =============================================
-- Author:		<OBit Team  H.R.>
-- Create date: <2008.8.8>
-- Description:	<��ȡwebapi�ͻ����嵥>
-- Rev:1.00
-- =============================================
CREATE PROCEDURE [dbo].[WebApiClient_ViewList] 
@QueryParameter NVARCHAR(100)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	SELECT WebApiUserId,ClientCode,Remark FROM dbo.WebApiUser

END






GO

-----=====================[WebApiAuthorizedUserTreeView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiAuthorizedUserTreeView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiAuthorizedUserTreeView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiAuthorizedUser������������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiAuthorizedUserTreeView]
@I_ReturnMessage nvarchar(max)='' output,  --���ص���Ϣ,֧�ֶ�����
@I_LanguageId char(1)='1',				--�ͻ��˴��������ID
@I_PlugInCommand varchar(5)='',		--�������
@I_FiltCondition	nvarchar(max)='',	--�����������ʽ
@I_OrBitUserId char(12)='',			--�û�ID
@I_OrBitUserName nvarchar(100)='',	--�û���
@I_ResourceId	char(12)='',		--��ԴID(�����Դ������Դ�嵥�У���ô�����ǿյ�)
@I_ResourceName nvarchar(100)='',	--��Դ��
@I_PKId char(12) ='',				--����
@I_ParentPKId char(12)='',			--��������
@I_Parameter nvarchar(100)=''		--�������
--���ϱ���Ϊϵͳ����̶��ӿڲ�����������ÿһ��TreeView������ʵ��.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine	
	SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--ִ��TreeView,ע�⣺���¹��̱������ҵ���������е���
	--��������˽�TreeView������α�д����ο������ṩ��ʾ��_SampleProjectTreeView

	if @I_ParentPKId<>''  --��SaveDataִ����ɺ�ˢ�µ���ʱִ��
	begin
			SELECT     WebApiAuthorizedUserId,ClientCode,Remark,UserDescription,WebApiAuthorizedUser.CreateDate
			FROM        WebApiAuthorizedUser
			INNER JOIN dbo.WebApiUser ON WebApiUser.WebApiUserId = WebApiAuthorizedUser.WebApiUserid
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiAuthorizedUser.UserId
			where WebApiId=@I_ParentPKId 
			return 0
	end
			----���±�ע�͵Ķ���������Эͬ��������Ĵ���,�����Ҫ����Эͬ�������뽫��ȡ��ע�ͼ���
			--if   charindex('[',@I_Parameter)>0 --��ǰ̨����������ͳ����Ϣ
			--begin
			--	set @I_Parameter=REPLACE(REPLACE(@I_Parameter,'[',''),']','')
			--	SELECT   COUNT(*) AS CountId
			--			FROM      dbo.WebApiAuthorizedUser INNER JOIN
			--			dbo.WorkflowStep ON dbo.WebApiAuthorizedUser.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebApiAuthorizedUser.WorkflowStepId =@I_Parameter 
			--	return 0
			--end
			
			--if ltrim(@I_Parameter)<>''
			--begin
			--	SELECT  * 
			--			FROM         dbo.WebApiAuthorizedUser INNER JOIN
			--			  dbo.WorkflowStep ON dbo.WebApiAuthorizedUser.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			  dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebApiAuthorizedUser.WorkflowStepId =@I_Parameter			
			--	return 0
			--end 
			--��ǰ̨�������е�����ʱִ��
			SELECT      WebApiAuthorizedUserId,ClientCode,Remark,UserDescription,WebApiAuthorizedUser.CreateDate
			FROM        WebApiAuthorizedUser
			INNER JOIN dbo.WebApiUser ON WebApiUser.WebApiUserId = WebApiAuthorizedUser.WebApiUserid
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiAuthorizedUser.UserId
			return 0

END



GO

-----=====================[WebApiAuthorizedUserMainView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiAuthorizedUserMainView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiAuthorizedUserMainView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiAuthorizedUser��������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiAuthorizedUserMainView]
@I_PKId char(12) =''				--����
--���ϱ���Ϊϵͳ����̶��ӿڲ�����������ÿһ��MainView������ʵ��.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--ִ��MainView,ע�⣺���¹��̱������ҵ���������е���
	--��������˽�MainView������α�д����ο������ṩ��ʾ��_SampleProjectMainView

			SELECT WebApiAuthorizedUser.WebApiUserid,ClientCode,Remark,UserDescription,WebApiAuthorizedUser.CreateDate
			FROM        WebApiAuthorizedUser
			INNER JOIN dbo.WebApiUser ON WebApiUser.UserId = WebApiAuthorizedUser.UserId
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiAuthorizedUser.UserId
			where WebApiAuthorizedUserId=@I_PKId
			return 0

END



GO

-----=====================[WebApiAuthorizedUserSaveData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiAuthorizedUserSaveData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiAuthorizedUserSaveData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiAuthorizedUser�����������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiAuthorizedUserSaveData]
@I_ReturnMessage nvarchar(max)='' output,  --���ص���Ϣ,֧�ֶ�����
@I_IsNewRow bit = 0 output,				--��ͻ��˱����Ƿ�������
@I_ExceptionFieldName nvarchar(100)='' output, --��ͻ��˱��������ͻ���ֶ�
@I_LanguageId char(1)='1',				--�ͻ��˴��������ID
@I_PlugInCommand varchar(5)='',		--�������
@I_OrBitUserId char(12)='',			--�û�ID
@I_OrBitUserName nvarchar(100)='',	--�û���
@I_ResourceId	char(12)='',		--��ԴID(�����Դ������Դ�嵥�У���ô�����ǿյ�)
@I_ResourceName nvarchar(100)='',	--��Դ��
@I_PKId char(12) = '',				--����
@I_SourcePKId char(12)='',			--ִ�п���ʱ�����Դ����  
@I_ParentPKId char(12)='',			--��������
@I_Parameter nvarchar(100)='',		--�������
--���ϱ���Ϊ����̶��ӿڲ�����������ÿһ��Save������ʵ�֡�

--���²���������Ԫ����������MetadataField�����ṩ���ֶ�һһ��Ӧ��

--����:	���±�����һ��Ҫ����Ĭ��ֵ������ǰ̨����ᱨ��
--��ʾ��Ԫ������MetadataField�����ṩ�������ֶα���ȫ��������Save������
--      ����ᵼ�����ڸ���ʱΪ�������ҵ���ǰ̨���򱨴�>
--��ʾ���������û���������Σ������û���������Σ��뽫����@I_Parameter nvarchar(100)=''�������,�ţ�
@WebApiUserid CHAR(12)='',
@ClientCode  char(8)='',
@Remark NVARCHAR(200)='',
@UserDescription  NVARCHAR(200)='',
@CreateDate DATETIME=''


--�û���������
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--ִ��SaveData,ע�⣺���¹��̱������ҵ���������е���
	--��������˽�SaveData������α�д����ο������ṩ��ʾ��_SampleProjectSaveData

	declare @ModifyObject nvarchar(50)
	declare @ModifyType nvarchar(20)
	declare	@return_value int
	declare @S_ReturnMessage nvarchar(100)

	declare @FieldsValueOld nvarchar(max)
	declare @FieldsValueNew nvarchar(max)
	declare @FieldsChanged nvarchar(max)

	set @I_ReturnMessage=''
	set @I_IsNewRow = 0
	set @I_ExceptionFieldName=''
	set @ModifyObject='WebApiAuthorizedUser'   --�������Ҫ�ǵ�ǰ�����ı���
	set @ModifyType =''
	
	--û�����뵽�������˳�
	if ltrim(@I_PKId)=''
	begin
		set @I_ReturnMessage='No PKId applied'
		return -1
	end

	--���ֹ�����ο�ʼ
	--�ж��Ƿ���������ͻ
	if exists(select WebApiAuthorizedUserId from dbo.WebApiAuthorizedUser 
	where WebApiUserid=@WebApiUserid and WebApiId=@I_ParentPKId AND  WebApiAuthorizedUserId != @I_PKId)		
	begin
		set @I_ReturnMessage='NamingConflicts'
		set @I_ExceptionFieldName='ClientCode'
		return -1
	end

    if not exists(SELECT WebApiAuthorizedUserId FROM WebApiAuthorizedUser WHERE WebApiAuthorizedUserId=@I_PKId)
		begin
		Insert into WebApiAuthorizedUser(
				 WebApiAuthorizedUserId,
				 WebApiUserid,
				 WebApiId,
				 UserId,
				 CreateDate
      )Values(
				 @I_PKId,
				 @WebApiUserid,
				 @I_ParentPKId,
				 @I_OrBitUserId,
				 GETDATE())

			set @I_IsNewRow=1		
			set @ModifyType='Insert'
			--��ȡ�ող���ļ�¼
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsChanged output

		end
        else
		begin
			--�����ǰ�ļ�¼
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsValueOld output

				Update WebApiAuthorizedUser set 
			    WebApiUserid=@WebApiUserid,
				WebApiId=@I_ParentPKId,
			    UserId=@I_OrBitUserId,
				CreateDate=GETDATE() WHERE WebApiAuthorizedUserId=@I_PKId

			 set @ModifyType='Update'
			--����º�ļ�¼,�����бȽ�
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsValueNew output
			EXEC	SysGetTableFieldsCompare @FieldsValueOld,@FieldsValueNew,@FieldsChanged OUTPUT

		end

    	--����������޸����޸���ʷ��
		if @FieldsChanged<>''
		EXEC	[dbo].[SysWriteInModifyHistory]
				@ObjectName = @ModifyObject,
				@TablePKId = @I_PKId ,
				@ModifyType = @ModifyType,
				@UserName = @I_OrBitUserName,
				@ModifyHistory =  @FieldsChanged

		return 0

END



GO

-----=====================[WebApiAuthorizedUserDeleteData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiAuthorizedUserDeleteData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiAuthorizedUserDeleteData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ɾ��WebApiAuthorizedUser�������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
create PROCEDURE [dbo].[WebApiAuthorizedUserDeleteData]
@I_ReturnMessage nvarchar(max)='' output,  --���ص���Ϣ,֧�ֶ�����
@I_LanguageId char(1)='1',				--�ͻ��˴��������ID
@I_PlugInCommand varchar(5)='',			--�������
@I_OrBitUserId char(12)='',				--�û�ID
@I_OrBitUserName nvarchar(100)='',		--�û���
@I_ResourceId	char(12)='',			--��ԴID(�����Դ������Դ�嵥�У���ô�����ǿյ�)
@I_ResourceName nvarchar(100)='',		--��Դ��
@I_FiltCondition	nvarchar(max)='',	--�����������ʽ
@I_PKId char(12)='',					--����
@I_ParentPKId char(12)='',				--���ڹ��˵��ϼ�����
@I_Parameter nvarchar(100)=''			--�������
--���ϱ���Ϊϵͳ����̶��ӿڲ�����������ÿһ��TreeView������ʵ��.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine	
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--ִ��Delete
	--��������˽�Delete������α�д����ο������ṩ��ʾ��_SampleProjectDeleteData
	--��ȡɾ��ǰ�ļ�¼	
  	declare @FieldsChanged nvarchar(max)
	EXEC	SysGetTableFieldsCombine 'WebApiAuthorizedUser',@I_PKId,@FieldsChanged output

	delete WebApiAuthorizedUser where WebApiAuthorizedUserId = @I_PKId 

	--��������ɾ��д���޸���ʷ��
	EXEC	[dbo].[SysWriteInModifyHistory]
			@ObjectName = 'WebApiAuthorizedUser',
			@TablePKId = @I_PKId ,
			@ModifyType = 'Delete',
			@UserName = @I_OrBitUserName,
			@ModifyHistory =  @FieldsChanged

END



GO


--**==================================================------
--****************************************************------
--**ע��:Ԫ���� Old�洢���̽������ǣ��洢���̸��°��� ViewList���̵ĸ���
--****************************************************------
--**==================================================------


-----=====================[WebApiUserTreeView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserTreeView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserTreeView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiUser������������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiUserTreeView]
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

	if @I_PKId<>''  --��SaveDataִ����ɺ�ˢ�µ���ʱִ��
	begin
			SELECT     WebApiUserId,ClientCode,ClientKey
			FROM        WebApiUser
			where WebApiUserId=@I_PKId 
			return 0
	end
			----���±�ע�͵Ķ���������Эͬ��������Ĵ���,�����Ҫ����Эͬ�������뽫��ȡ��ע�ͼ���
			--if   charindex('[',@I_Parameter)>0 --��ǰ̨����������ͳ����Ϣ
			--begin
			--	set @I_Parameter=REPLACE(REPLACE(@I_Parameter,'[',''),']','')
			--	SELECT   COUNT(*) AS CountId
			--			FROM      dbo.WebApiUser INNER JOIN
			--			dbo.WorkflowStep ON dbo.WebApiUser.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebApiUser.WorkflowStepId =@I_Parameter 
			--	return 0
			--end
			
			--if ltrim(@I_Parameter)<>''
			--begin
			--	SELECT  * 
			--			FROM         dbo.WebApiUser INNER JOIN
			--			  dbo.WorkflowStep ON dbo.WebApiUser.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			  dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebApiUser.WorkflowStepId =@I_Parameter			
			--	return 0
			--end 
			
			--��ǰ̨�������е�����ʱִ��
			SELECT     WebApiUserId,ClientCode,ClientKey
			FROM        WebApiUser
			return 0
END



GO

-----=====================[WebApiUserMainView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserMainView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserMainView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiUser��������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiUserMainView]
@I_PKId char(12) =''				--����
--���ϱ���Ϊϵͳ����̶��ӿڲ�����������ÿһ��MainView������ʵ��.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--ִ��MainView,ע�⣺���¹��̱������ҵ���������е���
	--��������˽�MainView������α�д����ο������ṩ��ʾ��_SampleProjectMainView

			SELECT     
                ClientCode,
                ClientKey,
                Remark,
				UserDescription,
				WebApiUser.CreateDate
			FROM        WebApiUser
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiUser.UserId
			where WebApiUserId=@I_PKId
			return 0

END



GO

-----=====================[WebApiUserSaveData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserSaveData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserSaveData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiUser�����������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiUserSaveData]
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
@ClientCode  char(8)='',
@ClientKey  char(10)='',
@Remark  nvarchar(Max)='',
@UserDescription NVARCHAR(200)='',
@CreateDate DATETIME=''


--�û���������
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	EXEC dbo.xsGetRandChar @len = 8,@strChar = @ClientCode OUTPUT
	EXEC dbo.xsGetRandChar @len = 10,@strChar = @ClientKey OUTPUT

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
	set @ModifyObject='WebApiUser'   --�������Ҫ�ǵ�ǰ�����ı���
	set @ModifyType =''
	
	--û�����뵽�������˳�
	if ltrim(@I_PKId)=''
	begin
		set @I_ReturnMessage='No PKId applied'
		return -1
	end

	--���ֹ�����ο�ʼ
	--�ж��Ƿ���������ͻ
	if exists(select WebApiUserId from dbo.WebApiUser 
	where ClientCode=@ClientCode and WebApiUserId  != @I_PKId)		
	begin
		set @I_ReturnMessage='NamingConflicts'
		set @I_ExceptionFieldName='ClientCode'
		return -1
	END    

    if not exists(SELECT WebApiUserId FROM WebApiUser WHERE WebApiUserId=@I_PKId)
		begin
		Insert into WebApiUser(
				 WebApiUserId,
				 ClientCode,
				 ClientKey,
				 Remark,
				 UserId,
				 CreateDate
      )Values(
				 @I_PKId,
				 @ClientCode,
				 @ClientKey,
				 @Remark,
				 @I_OrBitUserId,
				 GETDATE()
				 )

			set @I_IsNewRow=1		
			set @ModifyType='Insert'
			--��ȡ�ող���ļ�¼
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsChanged output

		end
        else
		begin
			--�����ǰ�ļ�¼
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsValueOld output

				Update WebApiUser set 
			    ClientCode=@ClientCode,
			    ClientKey=@ClientKey,
			    Remark=@Remark,
				UserId=@I_OrBitUserId,
				CreateDate=GETDATE()				
				WHERE WebApiUserId=@I_PKId

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

-----=====================[WebApiUserDeleteData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserDeleteData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserDeleteData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ɾ��WebApiUser�������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
create PROCEDURE [dbo].[WebApiUserDeleteData]
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
	EXEC	SysGetTableFieldsCombine 'WebApiUser',@I_PKId,@FieldsChanged output

	delete WebApiUser where WebApiUserId = @I_PKId 

	--��������ɾ��д���޸���ʷ��
	EXEC	[dbo].[SysWriteInModifyHistory]
			@ObjectName = 'WebApiUser',
			@TablePKId = @I_PKId ,
			@ModifyType = 'Delete',
			@UserName = @I_OrBitUserName,
			@ModifyHistory =  @FieldsChanged

END



GO

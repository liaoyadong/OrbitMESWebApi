
--**==================================================------
--****************************************************------
--**ע��:Ԫ���� Old�洢���̽������ǣ��洢���̸��°��� ViewList���̵ĸ���
--****************************************************------
--**==================================================------


-----=====================[WebApiParamsTreeView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiParamsTreeView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiParamsTreeView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiParams������������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiParamsTreeView]
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
			SELECT     WebApiParamsId,ParamName,IsMust,UserDescription,WebApiParams.CreateDate
			FROM        WebApiParams
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiParams.UserId
			where WebApiId=@I_ParentPKId 
			return 0
	END

	if @I_PKId<>''  --��SaveDataִ����ɺ�ˢ�µ���ʱִ��
	begin
			SELECT     WebApiParamsId,ParamName,IsMust,UserDescription,WebApiParams.CreateDate
			FROM        WebApiParams
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiParams.UserId
			where WebApiParamsId=@I_PKId 
			return 0
	END

   	SELECT     WebApiParamsId,ParamName,IsMust,UserDescription,WebApiParams.CreateDate
	FROM        WebApiParams
	INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiParams.UserId

	return 0 
			----���±�ע�͵Ķ���������Эͬ��������Ĵ���,�����Ҫ����Эͬ�������뽫��ȡ��ע�ͼ���
			--if   charindex('[',@I_Parameter)>0 --��ǰ̨����������ͳ����Ϣ
			--begin
			--	set @I_Parameter=REPLACE(REPLACE(@I_Parameter,'[',''),']','')
			--	SELECT   COUNT(*) AS CountId
			--			FROM      dbo.WebApiParams INNER JOIN
			--			dbo.WorkflowStep ON dbo.WebApiParams.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebApiParams.WorkflowStepId =@I_Parameter 
			--	return 0
			--end
			
			--if ltrim(@I_Parameter)<>''
			--begin
			--	SELECT  * 
			--			FROM         dbo.WebApiParams INNER JOIN
			--			  dbo.WorkflowStep ON dbo.WebApiParams.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			  dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebApiParams.WorkflowStepId =@I_Parameter			
			--	return 0
			--end 
			

END



GO

-----=====================[WebApiParamsMainView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiParamsMainView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiParamsMainView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiParams��������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiParamsMainView]
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
                ParamName,
                IsMust,
                Remark,
                UserDescription,
				SysUser.CreateDate
			FROM        dbo.WebApiParams
			INNER JOIN dbo.SysUser ON SysUser.UserId = WebApiParams.UserId
			where WebApiParamsId=@I_PKId
			return 0

END



GO

-----=====================[WebApiParamsSaveData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiParamsSaveData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiParamsSaveData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ΪWebApiParams�����������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiParamsSaveData]
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
@ParamName  nvarchar(50)='',
@IsMust  bit=0,
@Remark  nvarchar(Max)='',
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
	set @ModifyObject='WebApiParams'   --�������Ҫ�ǵ�ǰ�����ı���
	set @ModifyType =''
	
	--û�����뵽�������˳�
	if ltrim(@I_PKId)=''
	begin
		set @I_ReturnMessage='No PKId applied'
		return -1
	end

	--���ֹ�����ο�ʼ
	--�ж��Ƿ���������ͻ
	if exists(select WebApiParamsId from dbo.WebApiParams 
	where ParamName=@ParamName AND WebApiId=@I_ParentPKId and WebApiParamsId  != @I_PKId)		
	begin
		set @I_ReturnMessage='NamingConflicts'
		set @I_ExceptionFieldName='ParamName'
		return -1
	end

    if not exists(SELECT WebApiParamsId FROM WebApiParams WHERE WebApiParamsId=@I_PKId)
		begin
		Insert into WebApiParams(
				 WebApiParamsId,
				 WebApiId,
				 ParamName,
				 IsMust,
				 Remark,
				 UserId,
				 CreateDate
      )Values(
				 @I_PKId,
				 @I_ParentPKId,
				 @ParamName,
				 @IsMust,
				 @Remark,
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

				Update WebApiParams set 
			    WebApiId=@I_ParentPKId,
			    ParamName=@ParamName,
			    IsMust=@IsMust,
			    Remark=@Remark,
			    UserId=@I_OrBitUserId,
				CreateDate=GETDATE()
				WHERE WebApiParamsId=@I_PKId

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

-----=====================[WebApiParamsDeleteData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiParamsDeleteData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiParamsDeleteData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	ɾ��WebApiParams�������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
create PROCEDURE [dbo].[WebApiParamsDeleteData]
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
	EXEC	SysGetTableFieldsCombine 'WebApiParams',@I_PKId,@FieldsChanged output

	delete WebApiParams where WebApiParamsId = @I_PKId 

	--��������ɾ��д���޸���ʷ��
	EXEC	[dbo].[SysWriteInModifyHistory]
			@ObjectName = 'WebApiParams',
			@TablePKId = @I_PKId ,
			@ModifyType = 'Delete',
			@UserName = @I_OrBitUserName,
			@ModifyHistory =  @FieldsChanged

END



GO

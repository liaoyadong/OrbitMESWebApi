
--**==================================================------
--****************************************************------
--**ע��:Ԫ���� Old�洢���̽������ǣ��洢���̸��°��� ViewList���̵ĸ���
--****************************************************------
--**==================================================------


-----=====================[WebAPILogTreeView](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebAPILogTreeView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebAPILogTreeView
   end
GO

-- =============================================
-- Author:		<adam>
-- Create date: <10 10 2018  1:19PM>
-- Description:	ΪWebAPILog������������ͼ
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebAPILogTreeView]
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
			SELECT	ClientCode,
					Remark AS ClientRemark,
					(CASE Result WHEN 0 THEN '�ɹ�' ELSE 'ʧ��' END) AS Result,
					RequestData,
					ResponseData,
					ip,
					WebAPILog.CreateDate
			FROM        WebAPILog
			INNER JOIN dbo.WebApiUser ON WebApiUser.WebApiUserId = WebAPILog.WebApiUserId
			where WebAPIId=@I_ParentPKId 
			ORDER BY WebAPILog.CreateDate DESC
			return 0
	end
			----���±�ע�͵Ķ���������Эͬ��������Ĵ���,�����Ҫ����Эͬ�������뽫��ȡ��ע�ͼ���
			--if   charindex('[',@I_Parameter)>0 --��ǰ̨����������ͳ����Ϣ
			--begin
			--	set @I_Parameter=REPLACE(REPLACE(@I_Parameter,'[',''),']','')
			--	SELECT   COUNT(*) AS CountId
			--			FROM      dbo.WebAPILog INNER JOIN
			--			dbo.WorkflowStep ON dbo.WebAPILog.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebAPILog.WorkflowStepId =@I_Parameter 
			--	return 0
			--end
			
			--if ltrim(@I_Parameter)<>''
			--begin
			--	SELECT  * 
			--			FROM         dbo.WebAPILog INNER JOIN
			--			  dbo.WorkflowStep ON dbo.WebAPILog.WorkflowStepId = dbo.WorkflowStep.WorkflowStepId INNER JOIN
			--			  dbo.Spec_User ON dbo.WorkflowStep.SpecificationId = dbo.Spec_User.SpecificationId
			--			WHERE     dbo.Spec_User.UserId = @I_OrBitUserId and dbo.WebAPILog.WorkflowStepId =@I_Parameter			
			--	return 0
			--end 
			
			--��ǰ̨�������е�����ʱִ��
			SELECT	ClientCode,
					Remark AS ClientRemark,
					(CASE Result WHEN 0 THEN '�ɹ�' ELSE 'ʧ��' END) AS Result,
					RequestData,
					ResponseData,
					ip,
					WebAPILog.CreateDate
			FROM        WebAPILog
			INNER JOIN dbo.WebApiUser ON WebApiUser.WebApiUserId = WebAPILog.WebApiUserId
			ORDER BY WebAPILog.CreateDate DESC
			return 0
END

GO

-----=====================[WebAPILogDeleteData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebAPILogDeleteData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebAPILogDeleteData
   end
GO

-- =============================================
-- Author:		<adam>
-- Create date: <10 10 2018  1:19PM>
-- Description:	ɾ��WebAPILog�������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
create PROCEDURE [dbo].[WebAPILogDeleteData]
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
	EXEC	SysGetTableFieldsCombine 'WebAPILog',@I_PKId,@FieldsChanged output

	delete WebAPILog where WebAPILogId = @I_PKId 

	--��������ɾ��д���޸���ʷ��
	EXEC	[dbo].[SysWriteInModifyHistory]
			@ObjectName = 'WebAPILog',
			@TablePKId = @I_PKId ,
			@ModifyType = 'Delete',
			@UserName = @I_OrBitUserName,
			@ModifyHistory =  @FieldsChanged

END

GO

-----=====================[WebAPILogSaveData](����洢���̴���,��ɾ�������´���)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebAPILogSaveData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebAPILogSaveData
   end
GO

-- =============================================
-- Author:		<adam>
-- Create date: <10 10 2018  1:19PM>
-- Description:	ΪWebAPILog�����������
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebAPILogSaveData]
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
@ClientRemark NVARCHAR(200)='',
@Result NVARCHAR(10)='',
@RequestData  nvarchar(Max)='',
@ResponseData  nvarchar(Max)='',
@ip  nvarchar(15)='',
@CreateDate  DATETIME=''

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
	set @ModifyObject='WebAPILog'   --�������Ҫ�ǵ�ǰ�����ı���
	set @ModifyType =''
	
	--û�����뵽�������˳�
	if ltrim(@I_PKId)=''
	begin
		set @I_ReturnMessage='No PKId applied'
		return -1
	end

	--���ֹ�����ο�ʼ
	--�ж��Ƿ���������ͻ
	-- if exists(select XXXXId from XXXX 
	--	where XXXXName=@XXXXName and XXXId  != @I_PKId)		
	--	begin
	--		set @I_ReturnMessage='NamingConflicts'
	--		set @I_ExceptionFieldName='XXXName'
	--		return -1
	--	end
	DECLARE @WebApiUserId CHAR(12)
	SELECT @WebApiUserId=WebApiUserId FROM dbo.WebApiUser WHERE ClientCode=@ClientCode


    if not exists(SELECT WebAPILogId FROM WebAPILog WHERE WebAPILogId=@I_PKId)
		begin
		Insert into WebAPILog(
				 WebAPILogId,
				 WebAPIId,
				 RequestData,
				 ResponseData,
				 WebApiUserId,
				 ip,
				 Result
      )Values(
				 @I_PKId,
				 @I_ParentPKId,
				 @RequestData,
				 @ResponseData,
				 @WebApiUserId,
				 @ip,
				 CASE @Result WHEN '�ɹ�' THEN 0 ELSE -1 END
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

				Update WebAPILog set 
			    WebAPIId=@I_ParentPKId,
			    RequestData=@RequestData,
			    ResponseData=@ResponseData,
			    WebApiUserId=@WebApiUserId,
			    ip=@ip,
			    Result=(CASE @Result WHEN '�ɹ�' THEN 0 ELSE -1 END) 
				WHERE WebAPILogId=@I_PKId

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

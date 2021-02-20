
--**==================================================------
--****************************************************------
--**注意:元对象 Old存储过程将被覆盖，存储过程更新包括 ViewList过程的更新
--****************************************************------
--**==================================================------


-----=====================[WebApiUserTreeView](如果存储过程存在,就删除后重新创建)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserTreeView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserTreeView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	为WebApiUser创建导航树视图
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiUserTreeView]
@I_ReturnMessage nvarchar(max)='' output,  --返回的信息,支持多语言
@I_LanguageId char(1)='1',				--客户端传入的语言ID
@I_PlugInCommand varchar(5)='',		--插件命令
@I_FiltCondition	nvarchar(max)='',	--过滤条件表达式
@I_OrBitUserId char(12)='',			--用户ID
@I_OrBitUserName nvarchar(100)='',	--用户名
@I_ResourceId	char(12)='',		--资源ID(如果资源不在资源清单中，那么它将是空的)
@I_ResourceName nvarchar(100)='',	--资源名
@I_PKId char(12) ='',				--主键
@I_ParentPKId char(12)='',			--父级主键
@I_Parameter nvarchar(100)=''		--插件参数
--以上变量为系统服务固定接口参数，必须在每一个TreeView过程中实现.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine	
	SET NOCOUNT ON;
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--执行TreeView,注意：以下过程必须根据业务的需求进行调整
	--如果您不了解TreeView过程如何编写，请参考我们提供的示例_SampleProjectTreeView

	if @I_PKId<>''  --当SaveData执行完成后刷新单行时执行
	begin
			SELECT     WebApiUserId,ClientCode,ClientKey
			FROM        WebApiUser
			where WebApiUserId=@I_PKId 
			return 0
	end
			----以下被注释的段落是启用协同工作流后的代码,如果需要运行协同工作流请将它取消注释即可
			--if   charindex('[',@I_Parameter)>0 --向前台传送数据行统计信息
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
			
			--向前台返回所有的数据时执行
			SELECT     WebApiUserId,ClientCode,ClientKey
			FROM        WebApiUser
			return 0
END



GO

-----=====================[WebApiUserMainView](如果存储过程存在,就删除后重新创建)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserMainView') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserMainView
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	为WebApiUser创建主视图
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiUserMainView]
@I_PKId char(12) =''				--主键
--以上变量为系统服务固定接口参数，必须在每一个MainView过程中实现.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--执行MainView,注意：以下过程必须根据业务的需求进行调整
	--如果您不了解MainView过程如何编写，请参考我们提供的示例_SampleProjectMainView

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

-----=====================[WebApiUserSaveData](如果存储过程存在,就删除后重新创建)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserSaveData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserSaveData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	为WebApiUser创建保存过程
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
CREATE PROCEDURE [dbo].[WebApiUserSaveData]
@I_ReturnMessage nvarchar(max)='' output,  --返回的信息,支持多语言
@I_IsNewRow bit = 0 output,				--向客户端报告是否是新行
@I_ExceptionFieldName nvarchar(100)='' output, --向客户端报告引起冲突的字段
@I_LanguageId char(1)='1',				--客户端传入的语言ID
@I_PlugInCommand varchar(5)='',		--插件命令
@I_OrBitUserId char(12)='',			--用户ID
@I_OrBitUserName nvarchar(100)='',	--用户名
@I_ResourceId	char(12)='',		--资源ID(如果资源不在资源清单中，那么它将是空的)
@I_ResourceName nvarchar(100)='',	--资源名
@I_PKId char(12) = '',				--主键
@I_SourcePKId char(12)='',			--执行拷贝时传入的源主键  
@I_ParentPKId char(12)='',			--父级主键
@I_Parameter nvarchar(100)='',		--插件参数
--以上变量为服务固定接口参数，必须在每一个Save过程中实现。

--以下参与必须与该元对象数据在MetadataField表中提供的字段一一对应。

--警告:	以下变量请一定要赋以默认值，否则前台程序会报错
--提示：元数据在MetadataField表中提供的所有字段必须全部包含在Save过程中
--      否则会导致因在更新时为参数不找到出前台程序报错。>
--提示：以下是用户变量定义段，如有用户变量定义段，请将上面@I_Parameter nvarchar(100)=''后面加上,号！
@ClientCode  char(8)='',
@ClientKey  char(10)='',
@Remark  nvarchar(Max)='',
@UserDescription NVARCHAR(200)='',
@CreateDate DATETIME=''


--用户变量结束
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED

	EXEC dbo.xsGetRandChar @len = 8,@strChar = @ClientCode OUTPUT
	EXEC dbo.xsGetRandChar @len = 10,@strChar = @ClientKey OUTPUT

	--执行SaveData,注意：以下过程必须根据业务的需求进行调整
	--如果您不了解SaveData过程如何编写，请参考我们提供的示例_SampleProjectSaveData

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
	set @ModifyObject='WebApiUser'   --这里必须要是当前操作的表名
	set @ModifyType =''
	
	--没有申请到主键就退出
	if ltrim(@I_PKId)=''
	begin
		set @I_ReturnMessage='No PKId applied'
		return -1
	end

	--各种规则检查段开始
	--判断是否有命名冲突
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
			--获取刚刚插入的记录
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsChanged output

		end
        else
		begin
			--获更新前的记录
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsValueOld output

				Update WebApiUser set 
			    ClientCode=@ClientCode,
			    ClientKey=@ClientKey,
			    Remark=@Remark,
				UserId=@I_OrBitUserId,
				CreateDate=GETDATE()				
				WHERE WebApiUserId=@I_PKId

			 set @ModifyType='Update'
			--获更新后的记录,并进行比较
			EXEC	SysGetTableFieldsCombine @ModifyObject,@I_PKId,@FieldsValueNew output
			EXEC	SysGetTableFieldsCompare @FieldsValueOld,@FieldsValueNew,@FieldsChanged OUTPUT

		end

    	--最后将所做的修改入修改历史中
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

-----=====================[WebApiUserDeleteData](如果存储过程存在,就删除后重新创建)==================================---
if exists (select * from dbo.sysobjects where id = object_id('WebApiUserDeleteData') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
   begin
	  DROP PROCEDURE WebApiUserDeleteData
   end
GO

-- =============================================
-- Author:		<adamliao>
-- Create date: <08  9 2018 11:44AM>
-- Description:	删除WebApiUser表的数据
-- Revision: 1.00
-- Update comment:
-- Update date:
-- =============================================
create PROCEDURE [dbo].[WebApiUserDeleteData]
@I_ReturnMessage nvarchar(max)='' output,  --返回的信息,支持多语言
@I_LanguageId char(1)='1',				--客户端传入的语言ID
@I_PlugInCommand varchar(5)='',			--插件命令
@I_OrBitUserId char(12)='',				--用户ID
@I_OrBitUserName nvarchar(100)='',		--用户名
@I_ResourceId	char(12)='',			--资源ID(如果资源不在资源清单中，那么它将是空的)
@I_ResourceName nvarchar(100)='',		--资源名
@I_FiltCondition	nvarchar(max)='',	--过滤条件表达式
@I_PKId char(12)='',					--主键
@I_ParentPKId char(12)='',				--用于过滤的上级主键
@I_Parameter nvarchar(100)=''			--插件参数
--以上变量为系统服务固定接口参数，必须在每一个TreeView过程中实现.
AS
BEGIN
	-- This Stored Procedure is created by OrBit-MetaObject engine	
	SET NOCOUNT ON;
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
	--执行Delete
	--如果您不了解Delete过程如何编写，请参考我们提供的示例_SampleProjectDeleteData
	--获取删除前的记录	
  	declare @FieldsChanged nvarchar(max)
	EXEC	SysGetTableFieldsCombine 'WebApiUser',@I_PKId,@FieldsChanged output

	delete WebApiUser where WebApiUserId = @I_PKId 

	--将所做的删除写入修改历史中
	EXEC	[dbo].[SysWriteInModifyHistory]
			@ObjectName = 'WebApiUser',
			@TablePKId = @I_PKId ,
			@ModifyType = 'Delete',
			@UserName = @I_OrBitUserName,
			@ModifyHistory =  @FieldsChanged

END



GO

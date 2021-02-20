

/****** Object:  StoredProcedure [dbo].[WebAPI_GETSysUser]    Script Date: 2018/10/10 15:10:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<WebAPI获取系统用户信息>
-- 返回执行结果,0 成功，-1 失败
-- =============================================
CREATE PROCEDURE [dbo].[WebAPI_GETSysUser]
--以下是系统变量
@ClientCode CHAR(8)='',						--客户端
@I_ReturnMessage NVARCHAR(MAX)='' OUTPUT,   --返回的信息,支持多语言

--以下是用户自定义变量
@CreateDate DATETIME='',
@UserName NVARCHAR(200)=''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--将查询结果返回给客户端
    SELECT UserId,UserName,UserDescription FROM dbo.SysUser 
	WHERE CreateDate>=@CreateDate AND 
	(ISNULL(@UserName,'')='' OR UserName=@UserName)

	SET @I_ReturnMessage='查询成功,您的客户端账号是:'+@ClientCode
	RETURN 0 --返回执行结果0 true;-1 false
END
GO


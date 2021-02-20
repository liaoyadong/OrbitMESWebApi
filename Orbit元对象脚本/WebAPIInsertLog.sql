/****** Object:  StoredProcedure [dbo].[WebAPIInsertLog]    Script Date: 2018/10/10 15:11:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Adam
-- Create date: <2018-10-10>
-- Description:	<插入WebAPI的日志记录>
-- =============================================
CREATE PROCEDURE [dbo].[WebAPIInsertLog] 	
	@ClientCode CHAR(8),				--客户端账号
	@ApiName NVARCHAR(50),				--WebAPI接口名称
	@RequestData NVARCHAR(MAX),			--客户端请求报文
	@ResponseData NVARCHAR(MAX),		--客户端响应报文
	@ip NVARCHAR(15),					--客户端IP
	@Result INT							--接口执行结果:0 成功;-1 失败
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @WebAPIId CHAR(12)
	SELECT @WebAPIId=WebApiId FROM dbo.WebApi WHERE WebApiName=@ApiName

	DECLARE @WebApiUserId CHAR(12)
	SELECT @WebApiUserId=WebApiUserId FROM dbo.WebApiUser WHERE ClientCode=@ClientCode

	IF (ISNULL(@WebAPIId,'')='' OR ISNULL(@WebApiUserId,'')='') RETURN -1

    DECLARE @WebAPILogId CHAR(12);
    EXEC dbo.SysGetObjectPKId @ObjectName = N'WebAPILog',   -- nvarchar(100)
                              @PKID = @WebAPILogId OUTPUT -- char(12)	
    INSERT INTO dbo.WebAPILog
    (
        WebAPILogId,
        WebAPIId,
        RequestData,
        ResponseData,
        WebApiUserId,
        ip,
        Result,
        CreateDate
    )
    VALUES
    (   @WebAPILogId,       -- WebAPILogId - char(12)
        @WebAPIId,       -- WebAPIId - char(12)
        @RequestData,      -- RequestData - nvarchar(max)
        @ResponseData,      -- ResponseData - nvarchar(max)
        @WebApiUserId,       -- WebApiUserId - char(12)
        @ip,      -- ip - nvarchar(15)
        @Result,        -- Result - int
        GETDATE() -- CreateDate - datetime
        )
	RETURN 0
END
GO



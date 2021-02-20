
--**==================================================------
--****************************************************------
--**注意：执行脚本前请先删除 元对象及其相关联的子元对象数据
--****************************************************------
--**==================================================------

----================子元对象WebAPILog====------------  
	set @MetadataFieldGroupId=''
	set @MetadataFieldId=''
	set @MetadataMethodId=''
	set @MetadataQueryId=''
	set @ParentMetadataId=@MetadataId
    set @MetadataId=''

 ---============判断ObjectId是否存在=========-----------
  
	if not exists(select ObjectId from  SysObject WHERE ObjectName='WebAPILog')
	begin  
	---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysObject',
			@PKID=@ObjectId OUTPUT
			insert into SysObject(ObjectId,ObjectName,ObjectDescription,ObjectRev,ObjectType,ObjectPKHeader)
			values(@ObjectId,'WebAPILog','WebAPI访问日志文档','13.00','O','WAPL')
	end
	else
	begin
	       select @ObjectId=ObjectId from  SysObject WHERE ObjectName='WebAPILog'
	end

	----=========判断元对象是否存在==========-------
	 if not exists(select MetadataId from  SysMetadata   WHERE MetadataName='WebAPILog')
		begin

	 ---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysMetadata',
			@PKID=@MetadataId OUTPUT

			INSERT INTO  SysMetadata(MetadataId,ParentMetadataId,ObjectId,MetadataName,MetadataDescription,MetadataMajorVersion,MetadataMinorVersion,IsActivity,IsFullReadOnly,IsTreeViewStyle,IsMultiPageSupport,TreeView,SubTreeView,MainView,MainSave,MainDelete,FilterField,Sequence,IsEnterKeySupport,IsShowModifyHistory,IsMergeSameCell,TreeViewMargedField,Protected,TreeWidth,TreeColumnCount,TreeViewColorControl,IsHidden,IsRunObjectScript,ObjectScript,ScriptImportDll)   values(@MetadataId,@ParentMetadataId,@ObjectId,N'WebAPILog',N'WebAPILog',N'10',6,1,1,1,0,N'WebAPILogTreeView',N'',N'',N'WebAPILogSaveData',N'WebAPILogDeleteData',N'','4',1,1,0,N'',0,120,0,N'',0,0,N'',N'')          
	        
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebAPILog',
				@Text1 = 'WebAPILog',
				@Text2 = '接口日志',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
		 ---============申请SysMetadataFieldGroup主键=========-----------
				EXEC	[dbo].[SysGetObjectPKId]
				@ObjectName = 'SysMetadataFieldGroup',
				@PKID=@MetadataFieldGroupId OUTPUT 
		 
				INSERT INTO  SysMetadataFieldGroup(MetadataFieldGroupId,MetadataId,FieldGroupSequence,IsActivity,FieldGroupName,FieldGroupHeight,ColumnCount,FieldWidth,FieldSpace,IsCollapsed,Protected,IsHidden,AccessCode)   values(@MetadataFieldGroupId,@MetadataId,'01',1,N'WebAPILog Default Group',1000,3,200,20,0,0,0,N'')   
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebAPILog Default Group',
				@Text1 = 'WebAPILog Default Group',
				@Text2 = '默认组',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientCode',0,0,N'',N'',0,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ClientCode',
				@Text1 = 'ClientCode',
				@Text2 = '客户端代码',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientRemark',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ClientRemark',
				@Text1 = 'ClientRemark',
				@Text2 = '客户端备注',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'Result',0,0,N'',N'',0,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'Result',
				@Text1 = 'Result',
				@Text2 = '结果',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'RequestData',0,0,N'',N'',0,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'RequestData',
				@Text1 = 'RequestData',
				@Text2 = '客户端请求报文',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ResponseData',0,0,N'',N'',0,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ResponseData',
				@Text1 = 'ResponseData',
				@Text2 = '服务器回应报文',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ip',0,0,N'',N'',0,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ip',
				@Text1 = 'ip',
				@Text2 = 'IP地址',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'CreateDate',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',1,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'CreateDate',
				@Text1 = 'CreateDate',
				@Text2 = '创建日期',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
    
			  set @MetadataFieldGroupId=''
	
	end

----================元对象====------------
	declare @MetadataId nvarchar(12)
	declare @ParentMetadataId nvarchar(12)
	declare @MetadataFieldGroupId nvarchar(12)
	declare @MetadataFieldId nvarchar(12)
	declare @MetadataMethodId nvarchar(12)
	declare @MetadataQueryId nvarchar(12)
	declare @ObjectId nvarchar(12)
    declare @SysTextId nvarchar(12)
   
	set @MetadataFieldGroupId=''
	set @MetadataFieldId=''
	set @MetadataMethodId=''
	set @MetadataQueryId=''
	set @ParentMetadataId=@MetadataId
    set @MetadataId=''

 ---============判断ObjectId是否存在=========-----------
  
	if not exists(select ObjectId from  SysObject WHERE ObjectName='WebApi')
	begin  
	---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysObject',
			@PKID=@ObjectId OUTPUT
			insert into SysObject(ObjectId,ObjectName,ObjectDescription,ObjectRev,ObjectType,ObjectPKHeader)
			values(@ObjectId,'WebApi','WebAPI表','12.00','O','WAPI')
	end
	else
	begin
	       select @ObjectId=ObjectId from  SysObject WHERE ObjectName='WebApi'
	end

	----=========判断元对象是否存在==========-------
	 if not exists(select MetadataId from  SysMetadata   WHERE MetadataName='WebApi')
		begin

	 ---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysMetadata',
			@PKID=@MetadataId OUTPUT

			INSERT INTO  SysMetadata(MetadataId,ParentMetadataId,ObjectId,MetadataName,MetadataDescription,MetadataMajorVersion,MetadataMinorVersion,IsActivity,IsFullReadOnly,IsTreeViewStyle,IsMultiPageSupport,TreeView,SubTreeView,MainView,MainSave,MainDelete,FilterField,Sequence,IsEnterKeySupport,IsShowModifyHistory,IsMergeSameCell,TreeViewMargedField,Protected,TreeWidth,TreeColumnCount,TreeViewColorControl,IsHidden,IsRunObjectScript,ObjectScript,ScriptImportDll)   values(@MetadataId,@ParentMetadataId,@ObjectId,N'WebApi',N'WebApi',N'10',2,1,0,1,0,N'WebApiTreeView',N'',N'WebApiMainView',N'WebApiSaveData',N'WebApiDeleteData',N'','1',1,1,0,N'',0,120,1,N'',0,0,N'',N'')          
	        
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApi',
				@Text1 = 'WebApi',
				@Text2 = '',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
		 ---============申请SysMetadataFieldGroup主键=========-----------
				EXEC	[dbo].[SysGetObjectPKId]
				@ObjectName = 'SysMetadataFieldGroup',
				@PKID=@MetadataFieldGroupId OUTPUT 
		 
				INSERT INTO  SysMetadataFieldGroup(MetadataFieldGroupId,MetadataId,FieldGroupSequence,IsActivity,FieldGroupName,FieldGroupHeight,ColumnCount,FieldWidth,FieldSpace,IsCollapsed,Protected,IsHidden,AccessCode)   values(@MetadataFieldGroupId,@MetadataId,'01',1,N'WebApi Default Group',1000,3,200,20,0,0,0,N'')   
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApi Default Group',
				@Text1 = 'WebApi Default Group',
				@Text2 = '默认组',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'WebApiName',0,0,N'',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiName',
				@Text1 = 'WebApiName',
				@Text2 = 'WebAPI接口名称',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'StorProcedureName',1,0,N'WebAPIStorProcedureName_ViewList',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'StorProcedureName',
				@Text1 = 'Store procedure',
				@Text2 = '系统存储过程',
				@Text3 = '系統存儲過程',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'Remark',0,2,N'',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'Remark',
				@Text1 = 'Remark',
				@Text2 = '备注',
				@Text3 = '备注',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'UserDescription',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'UserDescription',
				@Text1 = 'UserDescription',
				@Text2 = '用户名',
				@Text3 = '用戶名稱',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'CreateDate',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'CreateDate',
				@Text1 = 'CreateDate',
				@Text2 = '创建日期',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
    
			  set @MetadataFieldGroupId=''
	
	end

----================子元对象WebApiAuthorizedUser====------------  
	set @MetadataFieldGroupId=''
	set @MetadataFieldId=''
	set @MetadataMethodId=''
	set @MetadataQueryId=''
	set @ParentMetadataId=@MetadataId
    set @MetadataId=''

 ---============判断ObjectId是否存在=========-----------
  
	if not exists(select ObjectId from  SysObject WHERE ObjectName='WebApiAuthorizedUser')
	begin  
	---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysObject',
			@PKID=@ObjectId OUTPUT
			insert into SysObject(ObjectId,ObjectName,ObjectDescription,ObjectRev,ObjectType,ObjectPKHeader)
			values(@ObjectId,'WebApiAuthorizedUser','WebAPI客户端授权表','12.00','O','WAAU')
	end
	else
	begin
	       select @ObjectId=ObjectId from  SysObject WHERE ObjectName='WebApiAuthorizedUser'
	end

	----=========判断元对象是否存在==========-------
	 if not exists(select MetadataId from  SysMetadata   WHERE MetadataName='WebApiAuthorizedUser')
		begin

	 ---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysMetadata',
			@PKID=@MetadataId OUTPUT

			INSERT INTO  SysMetadata(MetadataId,ParentMetadataId,ObjectId,MetadataName,MetadataDescription,MetadataMajorVersion,MetadataMinorVersion,IsActivity,IsFullReadOnly,IsTreeViewStyle,IsMultiPageSupport,TreeView,SubTreeView,MainView,MainSave,MainDelete,FilterField,Sequence,IsEnterKeySupport,IsShowModifyHistory,IsMergeSameCell,TreeViewMargedField,Protected,TreeWidth,TreeColumnCount,TreeViewColorControl,IsHidden,IsRunObjectScript,ObjectScript,ScriptImportDll)   values(@MetadataId,@ParentMetadataId,@ObjectId,N'WebApiAuthorizedUser',N'WebApiAuthorizedUser',N'10',5,1,0,1,0,N'WebApiAuthorizedUserTreeView',N'',N'WebApiAuthorizedUserMainView',N'WebApiAuthorizedUserSaveData',N'WebApiAuthorizedUserDeleteData',N'','3',1,1,0,N'',0,120,0,N'',0,0,N'',N'')          
	        
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiAuthorizedUser',
				@Text1 = 'WebApiAuthorizedUser',
				@Text2 = '授权客户端',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
		 ---============申请SysMetadataFieldGroup主键=========-----------
				EXEC	[dbo].[SysGetObjectPKId]
				@ObjectName = 'SysMetadataFieldGroup',
				@PKID=@MetadataFieldGroupId OUTPUT 
		 
				INSERT INTO  SysMetadataFieldGroup(MetadataFieldGroupId,MetadataId,FieldGroupSequence,IsActivity,FieldGroupName,FieldGroupHeight,ColumnCount,FieldWidth,FieldSpace,IsCollapsed,Protected,IsHidden,AccessCode)   values(@MetadataFieldGroupId,@MetadataId,'01',1,N'WebApiAuthorizedUser Default Group',1000,3,200,20,0,0,0,N'')   
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiAuthorizedUser Default Group',
				@Text1 = 'WebApiAuthorizedUser Default Group',
				@Text2 = '默认组',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientCode',1,0,N'WebApiClient_ViewList',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ClientCode',
				@Text1 = 'ClientCode',
				@Text2 = '客户端代码',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'Remark',0,2,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'Remark',
				@Text1 = 'Remark',
				@Text2 = '备注',
				@Text3 = '备注',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'UserDescription',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'UserDescription',
				@Text1 = 'UserDescription',
				@Text2 = '用户名',
				@Text3 = '用戶名稱',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'CreateDate',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'CreateDate',
				@Text1 = 'CreateDate',
				@Text2 = '创建日期',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'WebApiUserid',0,0,N'',N'',1,0,1,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiUserid',
				@Text1 = 'WebApiUserid',
				@Text2 = '',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
    
			  set @MetadataFieldGroupId=''
	
	end

----================子元对象WebApiParams====------------  
	set @MetadataFieldGroupId=''
	set @MetadataFieldId=''
	set @MetadataMethodId=''
	set @MetadataQueryId=''
	set @ParentMetadataId=@MetadataId
    set @MetadataId=''

 ---============判断ObjectId是否存在=========-----------
  
	if not exists(select ObjectId from  SysObject WHERE ObjectName='WebApiParams')
	begin  
	---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysObject',
			@PKID=@ObjectId OUTPUT
			insert into SysObject(ObjectId,ObjectName,ObjectDescription,ObjectRev,ObjectType,ObjectPKHeader)
			values(@ObjectId,'WebApiParams','WebAPI参数表','12.00','O','WAP1')
	end
	else
	begin
	       select @ObjectId=ObjectId from  SysObject WHERE ObjectName='WebApiParams'
	end

	----=========判断元对象是否存在==========-------
	 if not exists(select MetadataId from  SysMetadata   WHERE MetadataName='WebApiParams')
		begin

	 ---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysMetadata',
			@PKID=@MetadataId OUTPUT

			INSERT INTO  SysMetadata(MetadataId,ParentMetadataId,ObjectId,MetadataName,MetadataDescription,MetadataMajorVersion,MetadataMinorVersion,IsActivity,IsFullReadOnly,IsTreeViewStyle,IsMultiPageSupport,TreeView,SubTreeView,MainView,MainSave,MainDelete,FilterField,Sequence,IsEnterKeySupport,IsShowModifyHistory,IsMergeSameCell,TreeViewMargedField,Protected,TreeWidth,TreeColumnCount,TreeViewColorControl,IsHidden,IsRunObjectScript,ObjectScript,ScriptImportDll)   values(@MetadataId,@ParentMetadataId,@ObjectId,N'WebApiParams',N'WebApiParams',N'10',8,1,0,1,0,N'WebApiParamsTreeView',N'',N'WebApiParamsMainView',N'WebApiParamsSaveData',N'WebApiParamsDeleteData',N'','2',1,1,0,N'',0,120,1,N'',0,0,N'',N'')          
	        
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiParams',
				@Text1 = 'WebApiParams',
				@Text2 = '参数',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
		 ---============申请SysMetadataFieldGroup主键=========-----------
				EXEC	[dbo].[SysGetObjectPKId]
				@ObjectName = 'SysMetadataFieldGroup',
				@PKID=@MetadataFieldGroupId OUTPUT 
		 
				INSERT INTO  SysMetadataFieldGroup(MetadataFieldGroupId,MetadataId,FieldGroupSequence,IsActivity,FieldGroupName,FieldGroupHeight,ColumnCount,FieldWidth,FieldSpace,IsCollapsed,Protected,IsHidden,AccessCode)   values(@MetadataFieldGroupId,@MetadataId,'01',1,N'WebApiParams Default Group',1000,3,200,20,0,0,0,N'')   
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiParams Default Group',
				@Text1 = 'WebApiParams Default Group',
				@Text2 = '默认组',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ParamName',0,0,N'',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ParamName',
				@Text1 = 'ParamName',
				@Text2 = '参数名',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'IsMust',0,0,N'',N'',0,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'IsMust',
				@Text1 = 'IsMust',
				@Text2 = '是否必须',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'Remark',0,2,N'',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'Remark',
				@Text1 = 'Remark',
				@Text2 = '备注',
				@Text3 = '备注',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'UserDescription',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'UserDescription',
				@Text1 = 'UserDescription',
				@Text2 = '用户名',
				@Text3 = '用戶名稱',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============申请SysMetadataField主键=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'CreateDate',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'CreateDate',
				@Text1 = 'CreateDate',
				@Text2 = '创建日期',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
    
			  set @MetadataFieldGroupId=''
	
	end


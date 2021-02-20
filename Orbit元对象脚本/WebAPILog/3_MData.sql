
--**==================================================------
--****************************************************------
--**注意：执行脚本前请先删除 元对象及其相关联的子元对象数据
--****************************************************------
--**==================================================------

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


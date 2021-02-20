
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



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
  
	if not exists(select ObjectId from  SysObject WHERE ObjectName='WebApiUser')
	begin  
	---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysObject',
			@PKID=@ObjectId OUTPUT
			insert into SysObject(ObjectId,ObjectName,ObjectDescription,ObjectRev,ObjectType,ObjectPKHeader)
			values(@ObjectId,'WebApiUser','WebAPI客户端表','12.00','O','WAPU')
	end
	else
	begin
	       select @ObjectId=ObjectId from  SysObject WHERE ObjectName='WebApiUser'
	end

	----=========判断元对象是否存在==========-------
	 if not exists(select MetadataId from  SysMetadata   WHERE MetadataName='WebApiUser')
		begin

	 ---============申请SysMetadata主键=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysMetadata',
			@PKID=@MetadataId OUTPUT

			INSERT INTO  SysMetadata(MetadataId,ParentMetadataId,ObjectId,MetadataName,MetadataDescription,MetadataMajorVersion,MetadataMinorVersion,IsActivity,IsFullReadOnly,IsTreeViewStyle,IsMultiPageSupport,TreeView,SubTreeView,MainView,MainSave,MainDelete,FilterField,Sequence,IsEnterKeySupport,IsShowModifyHistory,IsMergeSameCell,TreeViewMargedField,Protected,TreeWidth,TreeColumnCount,TreeViewColorControl,IsHidden,IsRunObjectScript,ObjectScript,ScriptImportDll)   values(@MetadataId,@ParentMetadataId,@ObjectId,N'WebApiUser',N'WebApiUser',N'10',5,1,0,1,0,N'WebApiUserTreeView',N'',N'WebApiUserMainView',N'WebApiUserSaveData',N'WebApiUserDeleteData',N'','',1,1,0,N'',0,120,0,N'',0,0,N'using System;
using System.Windows.Forms;
using System.Text;
using System.Data;
using System.Reflection;
using System.Xml;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Drawing;
using System.Collections;

/* OrBit-Script 元对象脚本
 * 作    者：
 * 功能描述：
 * 版 本 号：
 * 发布日期:
 * 最后修改:
 */ 
namespace ScriptProj
{
    public class OrBitClass
    {

        /// <summary>
        /// 元对象插件接口全局对象，它提供了操作元对象的接口属性与接口方法
        /// </summary>
        public OrBitScript.OrBitMetaAPI Scripter = new OrBitScript.OrBitMetaAPI();  
		private int rep=0;
        /// <summary>
        /// 脚本对象实例化时加载时的方法
        /// </summary>
        public void ScriptLoad()
        {
        	//to do..
        }
	    
		
		/// <summary>
		/// 脚本在退出前的询问方法
		/// </summary>
		/// <returns>True则退出，False则取消退出</returns>
        public bool ScriptClosing()
        {
			//to do..
			return true;
        }
		
        /// <summary>
        /// 元对象插件在关闭时卸载此脚本对象的方法
        /// </summary>
        public void ScriptUnLoad()
        {
		    //to do..
        }


        /// <summary>
        ///元对象插件Tab页选中时的脚本对象执行的方法
        /// </summary>
        public void TabActive()
        {
		    //to do..
        }
		
		/// <summary>
        ///元对象UserPanel容器页签选中时执行的方法
        /// </summary>
        public void UserPanelTabActive()
        {
		    //to do..
        }
        
		/// <summary>
        ///元对象UserPanel容器切换语言时的事件
        /// </summary>
        public void UserPanelSwitchUIText(string LanguageId)
        {
		    //to do..
        }
		
        /// <summary>
        /// 容器中按钮触发时的通用检查前置事件
        /// </summary>
        /// <param name="ButtonName">按钮名</param>
        /// <returns>True表示继续,False表示退回</returns>
        public bool ButtonClickBefore(string ButtonName)
        {
 		    //to do..
	       	return true;         
        }
        
        /// <summary>
        /// 容器中按钮通用触发事件
        /// </summary>
        /// <param name="ButtonName">按钮名</param>
        public void ButtonClick(string ButtonName)
        {
		    if(ButtonName=="CreateClientCodeKey"){
				Scripter.SetParameterValue("ClientCode",GenerateCheckCode(8));
				Scripter.SetParameterValue("ClientKey",GenerateCheckCode(10));
			}
        }
		//生成随机字符
		private string GenerateCheckCode(int codeCount)
        {
           string str = string.Empty;
           long num2 = DateTime.Now.Ticks + rep;
           rep++;
           Random random = new Random(((int)(((ulong)num2) & 0xffffffffL)) | ((int)(num2 >> this.rep)));
           for (int i = 0; i < codeCount; i++)
           {
               char ch;
               int num = random.Next();
               if ((num % 2) == 0)
               {
                   ch = (char)(0x30 + ((ushort)(num % 10)));
               }
               else
               {
                   ch = (char)(0x41 + ((ushort)(num % 0x1a)));
               }
               str = str + ch.ToString();
           }
           return str;
        }

        /// <summary>
        /// TreeView网格选中某行时的触发事件
        /// </summary>
        /// <param name="ParameterName">对象参数名</param>
        /// <param name="CellA">选中行第一列的值</param>
        /// <param name="CellB">选中行第二列的值</param>
 		/// <param name="CellC">选中行第三列的值</param>
        /// <param name="CellD">选中行第四列的值</param>
	    public void RowSelected(string CellA, string CellB, string CellC, string CellD)
        { 
		    //to do..        	
        }


        /// <summary>
        /// 当参数控件失去焦点，光标跳出离开时触发
        /// </summary>
        /// <param name="ParameterName">对象参数名</param>
        /// <param name="ParameterValue">输入值</param>
        public void ParameterLeave(string ParameterName, string ParameterValue)
        {
            //to do..
            return;
        }


		/// <summary>
        /// 主工具栏上新增,复制,修改之前的触发事件
        /// </summary>
        /// <param name="ModifyType">1-新增，2-复制，3-修改</param>
        /// <param name="PKId">主键</param>	
		/// <param name="ParentPKId">父级主键</param>	
		/// <returns>True则允许继续修改，False阻止修改</returns>
        public bool ModifyBefore(int ModifyType, string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
        /// 主工具栏上保存数据之前的触发事件
        /// </summary>
        /// <param name="ModifyType">1-新增，2-复制，3-修改</param>
        /// <param name="PKId">主键</param>	
		/// <param name="ParentPKId">父级主键</param>	
		/// <returns>True则允许继续保存，False阻止保存</returns>
        public bool SaveBefore(int ModifyType, string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
        /// 主工具栏上取消修改之前的触发事件
        /// </summary>
        /// <param name="ModifyType">1-新增，2-复制，3-修改</param>
        /// <param name="PKId">主键</param>	
		/// <param name="ParentPKId">父级主键</param>	
		/// <returns>True则允许取消，False阻止取消</returns>
        public bool CancelBefore(int ModifyType, string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
        /// 主工具栏上删除之前的触发事件
        /// </summary>
        /// <param name="PKId">主键</param>	
		/// <param name="ParentPKId">父级主键</param>	
		/// <returns>True则允许删除，False阻止删除</returns>
        public bool DeleteBefore(string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
		/// 元对象数据变更成功后触发事件
		/// </summary>
		/// <param name="ModifyType">1-新增，2复制，3-修改，4-删除</param>
		/// <param name="PKID">主键</param>
		/// <param name="parentPKId">父级主键</param>
		public void DataChanged(int ModifyType, string PKID,string parentPKId)
		{
			//to do..
		}
       
    }
}',N'')          
	        
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiUser',
				@Text1 = 'WebApiUser',
				@Text2 = 'WebAPI客户端',
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
		 
				INSERT INTO  SysMetadataFieldGroup(MetadataFieldGroupId,MetadataId,FieldGroupSequence,IsActivity,FieldGroupName,FieldGroupHeight,ColumnCount,FieldWidth,FieldSpace,IsCollapsed,Protected,IsHidden,AccessCode)   values(@MetadataFieldGroupId,@MetadataId,'01',1,N'WebApiUser Default Group',1000,3,200,20,0,0,0,N'')   
	  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiUser Default Group',
				@Text1 = 'WebApiUser Default Group',
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
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientCode',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
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
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientKey',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --将Text1-Text8插入到SysText表中
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ClientKey',
				@Text1 = 'ClientKey',
				@Text2 = '客户端密钥',
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


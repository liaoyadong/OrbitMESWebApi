
--**==================================================------
--****************************************************------
--**ע�⣺ִ�нű�ǰ����ɾ�� Ԫ���������������Ԫ��������
--****************************************************------
--**==================================================------

----================Ԫ����====------------
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

 ---============�ж�ObjectId�Ƿ����=========-----------
  
	if not exists(select ObjectId from  SysObject WHERE ObjectName='WebApiUser')
	begin  
	---============����SysMetadata����=========-----------
			EXEC	[dbo].[SysGetObjectPKId]
			@ObjectName = 'SysObject',
			@PKID=@ObjectId OUTPUT
			insert into SysObject(ObjectId,ObjectName,ObjectDescription,ObjectRev,ObjectType,ObjectPKHeader)
			values(@ObjectId,'WebApiUser','WebAPI�ͻ��˱�','12.00','O','WAPU')
	end
	else
	begin
	       select @ObjectId=ObjectId from  SysObject WHERE ObjectName='WebApiUser'
	end

	----=========�ж�Ԫ�����Ƿ����==========-------
	 if not exists(select MetadataId from  SysMetadata   WHERE MetadataName='WebApiUser')
		begin

	 ---============����SysMetadata����=========-----------
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

/* OrBit-Script Ԫ����ű�
 * ��    �ߣ�
 * ����������
 * �� �� �ţ�
 * ��������:
 * ����޸�:
 */ 
namespace ScriptProj
{
    public class OrBitClass
    {

        /// <summary>
        /// Ԫ�������ӿ�ȫ�ֶ������ṩ�˲���Ԫ����Ľӿ�������ӿڷ���
        /// </summary>
        public OrBitScript.OrBitMetaAPI Scripter = new OrBitScript.OrBitMetaAPI();  
		private int rep=0;
        /// <summary>
        /// �ű�����ʵ����ʱ����ʱ�ķ���
        /// </summary>
        public void ScriptLoad()
        {
        	//to do..
        }
	    
		
		/// <summary>
		/// �ű����˳�ǰ��ѯ�ʷ���
		/// </summary>
		/// <returns>True���˳���False��ȡ���˳�</returns>
        public bool ScriptClosing()
        {
			//to do..
			return true;
        }
		
        /// <summary>
        /// Ԫ�������ڹر�ʱж�ش˽ű�����ķ���
        /// </summary>
        public void ScriptUnLoad()
        {
		    //to do..
        }


        /// <summary>
        ///Ԫ������Tabҳѡ��ʱ�Ľű�����ִ�еķ���
        /// </summary>
        public void TabActive()
        {
		    //to do..
        }
		
		/// <summary>
        ///Ԫ����UserPanel����ҳǩѡ��ʱִ�еķ���
        /// </summary>
        public void UserPanelTabActive()
        {
		    //to do..
        }
        
		/// <summary>
        ///Ԫ����UserPanel�����л�����ʱ���¼�
        /// </summary>
        public void UserPanelSwitchUIText(string LanguageId)
        {
		    //to do..
        }
		
        /// <summary>
        /// �����а�ť����ʱ��ͨ�ü��ǰ���¼�
        /// </summary>
        /// <param name="ButtonName">��ť��</param>
        /// <returns>True��ʾ����,False��ʾ�˻�</returns>
        public bool ButtonClickBefore(string ButtonName)
        {
 		    //to do..
	       	return true;         
        }
        
        /// <summary>
        /// �����а�ťͨ�ô����¼�
        /// </summary>
        /// <param name="ButtonName">��ť��</param>
        public void ButtonClick(string ButtonName)
        {
		    if(ButtonName=="CreateClientCodeKey"){
				Scripter.SetParameterValue("ClientCode",GenerateCheckCode(8));
				Scripter.SetParameterValue("ClientKey",GenerateCheckCode(10));
			}
        }
		//��������ַ�
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
        /// TreeView����ѡ��ĳ��ʱ�Ĵ����¼�
        /// </summary>
        /// <param name="ParameterName">���������</param>
        /// <param name="CellA">ѡ���е�һ�е�ֵ</param>
        /// <param name="CellB">ѡ���еڶ��е�ֵ</param>
 		/// <param name="CellC">ѡ���е����е�ֵ</param>
        /// <param name="CellD">ѡ���е����е�ֵ</param>
	    public void RowSelected(string CellA, string CellB, string CellC, string CellD)
        { 
		    //to do..        	
        }


        /// <summary>
        /// �������ؼ�ʧȥ���㣬��������뿪ʱ����
        /// </summary>
        /// <param name="ParameterName">���������</param>
        /// <param name="ParameterValue">����ֵ</param>
        public void ParameterLeave(string ParameterName, string ParameterValue)
        {
            //to do..
            return;
        }


		/// <summary>
        /// ��������������,����,�޸�֮ǰ�Ĵ����¼�
        /// </summary>
        /// <param name="ModifyType">1-������2-���ƣ�3-�޸�</param>
        /// <param name="PKId">����</param>	
		/// <param name="ParentPKId">��������</param>	
		/// <returns>True����������޸ģ�False��ֹ�޸�</returns>
        public bool ModifyBefore(int ModifyType, string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
        /// ���������ϱ�������֮ǰ�Ĵ����¼�
        /// </summary>
        /// <param name="ModifyType">1-������2-���ƣ�3-�޸�</param>
        /// <param name="PKId">����</param>	
		/// <param name="ParentPKId">��������</param>	
		/// <returns>True������������棬False��ֹ����</returns>
        public bool SaveBefore(int ModifyType, string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
        /// ����������ȡ���޸�֮ǰ�Ĵ����¼�
        /// </summary>
        /// <param name="ModifyType">1-������2-���ƣ�3-�޸�</param>
        /// <param name="PKId">����</param>	
		/// <param name="ParentPKId">��������</param>	
		/// <returns>True������ȡ����False��ֹȡ��</returns>
        public bool CancelBefore(int ModifyType, string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
        /// ����������ɾ��֮ǰ�Ĵ����¼�
        /// </summary>
        /// <param name="PKId">����</param>	
		/// <param name="ParentPKId">��������</param>	
		/// <returns>True������ɾ����False��ֹɾ��</returns>
        public bool DeleteBefore(string PKId,string ParentPKId)
        {
            //to do..
            return true;
        }
		
		/// <summary>
		/// Ԫ�������ݱ���ɹ��󴥷��¼�
		/// </summary>
		/// <param name="ModifyType">1-������2���ƣ�3-�޸ģ�4-ɾ��</param>
		/// <param name="PKID">����</param>
		/// <param name="parentPKId">��������</param>
		public void DataChanged(int ModifyType, string PKID,string parentPKId)
		{
			//to do..
		}
       
    }
}',N'')          
	        
	  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiUser',
				@Text1 = 'WebApiUser',
				@Text2 = 'WebAPI�ͻ���',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
		 ---============����SysMetadataFieldGroup����=========-----------
				EXEC	[dbo].[SysGetObjectPKId]
				@ObjectName = 'SysMetadataFieldGroup',
				@PKID=@MetadataFieldGroupId OUTPUT 
		 
				INSERT INTO  SysMetadataFieldGroup(MetadataFieldGroupId,MetadataId,FieldGroupSequence,IsActivity,FieldGroupName,FieldGroupHeight,ColumnCount,FieldWidth,FieldSpace,IsCollapsed,Protected,IsHidden,AccessCode)   values(@MetadataFieldGroupId,@MetadataId,'01',1,N'WebApiUser Default Group',1000,3,200,20,0,0,0,N'')   
	  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'WebApiUser Default Group',
				@Text1 = 'WebApiUser Default Group',
				@Text2 = 'Ĭ����',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============����SysMetadataField����=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientCode',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ClientCode',
				@Text1 = 'ClientCode',
				@Text2 = '�ͻ��˴���',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============����SysMetadataField����=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'ClientKey',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'ClientKey',
				@Text1 = 'ClientKey',
				@Text2 = '�ͻ�����Կ',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============����SysMetadataField����=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'Remark',0,2,N'',N'',0,0,0,1,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'Remark',
				@Text1 = 'Remark',
				@Text2 = '��ע',
				@Text3 = '��ע',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============����SysMetadataField����=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'UserDescription',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'UserDescription',
				@Text1 = 'UserDescription',
				@Text2 = '�û���',
				@Text3 = '�Ñ����Q',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
     
			 ---============����SysMetadataField����=========-----------
					EXEC	[dbo].[SysGetObjectPKId]
					@ObjectName = 'SysMetadataField',
					@PKID=@MetadataFieldId OUTPUT 
			 
					INSERT INTO  SysMetadataField(MetadataFieldId,MetadataFieldGroupId,FieldName,IsValueListUsage,ControlLine,ValueList,ValueListFilterField,IsReadOnly,IsValidation,IsHidden,IsMustInput,IsMustBeUpper,IsPassword,IsPicture,IsSplitLine,DecimalDefine,IsShowTime,IsOpenFile,MustIncludedChar,RegularExpression,AccessCode,Protected)   values(@MetadataFieldId,@MetadataFieldGroupId,N'CreateDate',0,0,N'',N'',1,0,0,0,0,0,0,0,'0.0',0,0,N'',N'',N'',0)   
		  --��Text1-Text8���뵽SysText����
		   EXEC	[dbo].[SysTextSaveModuleValue]
				@TextModule = 'CreateDate',
				@Text1 = 'CreateDate',
				@Text2 = '��������',
				@Text3 = '',
				@Text4 = '',
				@Text5 = '',
				@Text6 = '',
				@Text7 = '',
				@Text8 = ''
    
			  set @MetadataFieldGroupId=''
	
	end


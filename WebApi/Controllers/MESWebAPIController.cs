using System;
using System.Collections;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Reflection;
using System.Web.Http;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Data;
using System.Data.SqlClient;
using Wen.Helpers;
using System.Text;
using System.Globalization;
using System.Web;
using System.Configuration;

namespace WebApi.Controllers
{
    public class MESWebAPIController : ApiController
    {
        [HttpPost]
        public object MESWebAPI(string ApiName, dynamic obj)
        {
            //定义一个返回结果的类
            WebApiResult WebApiResult = new WebApiResult();

            //获取客户端请求的header
            var headers = Request.Headers;
            //客户端ID
            string ClientCode = "";
            //客户端签名
            string DataSign = "";
            //客户端时间戳
            string Timespan = "";
            try
            {
                ClientCode = headers.GetValues("ClientCode").First();
                DataSign = headers.GetValues("DataSign").First();
                Timespan = headers.GetValues("Timespan").First();
                //校验请求时间与当前系统时间，允许相差最大5分钟
                DateTime ClientTime = DateTime.ParseExact(Timespan, "r", CultureInfo.InvariantCulture);
                DateTime ServerTime = DateTime.UtcNow;
                TimeSpan timeSpan = ClientTime - ServerTime;
                if (Math.Abs(timeSpan.TotalMinutes) > 5)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "身份认证失败,签名时间不正确!");
                }
            } catch
            {                
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "身份认证失败");
            }
            

            DataSet result = new DataSet();
            SqlParameter spClientCode = new SqlParameter("@ClientCode", ClientCode);
            string sql = @"SELECT ClientKey FROM dbo.WebApiUser WHERE ClientCode=@ClientCode";
            result = DbHelperSQL.Query(sql, spClientCode);
            if (result.Tables[0].Rows.Count == 0)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "身份认证失败,账号不存在!");
            }

            //签名检查
            string ClientKey = result.Tables[0].Rows[0]["ClientKey"].ToString();
            string ServerDataSign= SecurityHelper.HMACSHA1Encrypt(Timespan+JsonConvert.SerializeObject(obj), ClientKey,Encoding.UTF8);

            if (DataSign.ToUpper() != ServerDataSign.ToUpper())
            {
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "身份认证失败,签名校验失败!");
            }

            sql = "SELECT 1 FROM dbo.WebApi INNER JOIN dbo.WebApiAuthorizedUser ON WebApiAuthorizedUser.WebApiId = WebApi.WebApiId INNER JOIN dbo.WebApiUser ON WebApiUser.WebApiUserId = WebApiAuthorizedUser.WebApiUserid WHERE WebApiName=@ApiName AND ClientCode=@ClientCode";
            SqlParameter spApiName = new SqlParameter("@ApiName", ApiName);
            spClientCode = new SqlParameter("@ClientCode", ClientCode);
            result = DbHelperSQL.Query(sql, spApiName, spClientCode);
            if (result.Tables[0].Rows.Count == 0)
            {
                return Request.CreateErrorResponse(HttpStatusCode.Unauthorized, "身份认证失败,账号未授权!");
            }



            //将客户端提交的Body放入Dictionary ApiParams中
            Dictionary<string, string> ApiParams = new Dictionary<string, string>();
            foreach (JToken child in obj.Children())
            {
                var Params = child as JProperty;
                ApiParams.Add(Params.Name, Params.Value.ToString());

            }

            sql = @"SELECT StorProcedureName FROM dbo.WebApi where WebApiName=@ApiName"; 
            result = DbHelperSQL.Query(sql,spApiName);
            if (result.Tables[0].Rows.Count == 0)
            {
                WebApiResult.success = false;
                WebApiResult.message = "接口:" + ApiName + "不存在!";
                return WebApiResult;
            }
            string StorProcedureName = result.Tables[0].Rows[0]["StorProcedureName"].ToString();
            if (StorProcedureName == "")
            {
                WebApiResult.success = false;
                WebApiResult.message = "接口:" + ApiName + "未维护存储过程!";
                return WebApiResult;
            }


            //获取参数
            sql = "SELECT ParamName,IsMust FROM dbo.WebApi INNER JOIN dbo.WebApiParams ON WebApiParams.WebApiId = WebApi.WebApiId WHERE WebApiName = @ApiName";
            result = DbHelperSQL.Query(sql,spApiName);
            //定义存储过程的参数数组
            IDataParameter[] StorProcedureParams = new SqlParameter[result.Tables[0].Rows.Count+3];
            //写入系统参数到参数数组
            StorProcedureParams[0] = new SqlParameter("@ReturnValue", SqlDbType.Int);
            StorProcedureParams[0].Direction = ParameterDirection.ReturnValue;
            StorProcedureParams[1] = new SqlParameter("@I_ReturnMessage", SqlDbType.NVarChar, 8000);
            StorProcedureParams[1].Direction = ParameterDirection.Output;
            StorProcedureParams[2] = new SqlParameter("@ClientCode" , ClientCode);
            int i = 3;
            foreach (DataRow mDr in result.Tables[0].Rows)
            {
                string ParamName = mDr["ParamName"].ToString();
                bool IsMust = Convert.ToBoolean(mDr["IsMust"]);
                //遍历前台提交的参数
                //查找结果
                bool FindResult = false;                
                foreach (KeyValuePair<string, string> kv in ApiParams)
                {
                    if (ParamName == kv.Key)
                    {
                        FindResult = true;
                        StorProcedureParams[i] = new SqlParameter("@" + ParamName, kv.Value);
                        i++;
                    }
                }
                if (FindResult == false && IsMust == true)
                {
                    WebApiResult.success = false;
                    WebApiResult.message = "参数错误.";
                    return WebApiResult;
                }
            }
            result = DbHelperSQL.RunProcedure(StorProcedureName, StorProcedureParams, "ResultTables");

            int ReturnValue = Convert.ToInt32(StorProcedureParams[0].Value);
            string I_ReturnMessage = StorProcedureParams[1].Value.ToString();
            
            if (ReturnValue == 0)
            {
                WebApiResult.success = true;
            } else
            {
                WebApiResult.success = false;
            }
            WebApiResult.message = I_ReturnMessage;
            WebApiResult.ReturnData = result.Tables["ResultTables"];

            //写入日志
            string WriteLog = ConfigurationManager.AppSettings["WriteLog"];
            if(WriteLog== "true")
            {
                IDataParameter[] WebAPIInsertLogParams = new SqlParameter[6];
                WebAPIInsertLogParams[0] = new SqlParameter("@ClientCode", ClientCode);
                WebAPIInsertLogParams[1] = new SqlParameter("@ApiName", ApiName);
                WebAPIInsertLogParams[2] = new SqlParameter("@RequestData", JsonConvert.SerializeObject(obj));
                WebAPIInsertLogParams[3] = new SqlParameter("@ResponseData", JsonConvert.SerializeObject(WebApiResult));
                WebAPIInsertLogParams[4] = new SqlParameter("@ip", GetHostAddress());
                WebAPIInsertLogParams[5] = new SqlParameter("@Result", ReturnValue);
                DbHelperSQL.RunProcedure("WebAPIInsertLog", WebAPIInsertLogParams, "ResultTables");
            }            
            
            return WebApiResult;

        }
        

        /// <summary>
        /// 获取客户端IP地址（无视代理）
        /// </summary>
        /// <returns>若失败则返回回送地址</returns>
        public static string GetHostAddress()
        {
            string userHostAddress = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            if (string.IsNullOrEmpty(userHostAddress))
            {
                if (System.Web.HttpContext.Current.Request.ServerVariables["HTTP_VIA"] != null)
                    userHostAddress = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString().Split(',')[0].Trim();
            }
            if (string.IsNullOrEmpty(userHostAddress))
            {
                userHostAddress = HttpContext.Current.Request.UserHostAddress;
            }

            //最后判断获取是否成功，并检查IP地址的格式（检查其格式非常重要）
            if (!string.IsNullOrEmpty(userHostAddress) && IsIP(userHostAddress))
            {
                return userHostAddress;
            }
            return "127.0.0.1";
        }

        /// <summary>
        /// 检查IP地址格式
        /// </summary>
        /// <param name="ip"></param>
        /// <returns></returns>
        public static bool IsIP(string ip)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(ip, @"^((2[0-4]\d|25[0-5]|[01]?\d\d?)\.){3}(2[0-4]\d|25[0-5]|[01]?\d\d?)$");
        }
    }
    //返回结果类
    public class WebApiResult
    {
        public bool success;
        public string message;
        public DataTable ReturnData;
    }


}

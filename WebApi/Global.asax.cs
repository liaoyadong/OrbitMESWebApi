using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;

namespace WebApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }

        //解决跨域问题
        //在Web.config文件中需要增加
        //<system.webServer>  
        //  <httpProtocol> 
        //      <customHeaders> 
        //          <add name = "Access-Control-Allow-Methods" value="OPTIONS,POST,GET"/> 
        //          <add name = "Access-Control-Allow-Headers" value="*"/> 
        //          <add name = "Access-Control-Allow-Origin" value="*" /> 
        //      </customHeaders> 
        //  </httpProtocol> 
        //</system.webServer>
        public void Application_BeginRequest()
        {
            if(Request.Headers.AllKeys.Contains("Origin") && Request.HttpMethod == "OPTIONS")
            {
                Response.Flush();
            }
        }
    }
}

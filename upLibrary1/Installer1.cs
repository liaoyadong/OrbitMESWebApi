using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Security.AccessControl;

namespace upLibrary1
{
    [RunInstaller(true)]
    public partial class Installer1 : System.Configuration.Install.Installer
    {
        public Installer1()
        {
            InitializeComponent();
        }
        
        //重写Install
        public override void Install(IDictionary stateSaver)
        {
            base.Install(stateSaver);
            //接收参数

            //IIS IP地址
            string IISIP = "127.0.0.1";
            //端口
            string Port = Context.Parameters["Port"].ToString();
            //网站名
            string WebName = Context.Parameters["WebName"].ToString();
            //安装路径
            string targetdir = Context.Parameters["targetdir"].ToString().Replace(@"\\", @"\");

            string iisversion = IISWorker.GetIIsVersion();

            IISWorker.CreateWebSite(WebName, targetdir, IISIP+":"+Port, false);
            //File.WriteAllText(Path.Combine(targetdir, "log11.txt"), "IP地址:" + IISIP + "/n/r" + "端口:" + Port + "/n/r" + "网站名:" + WebName + "/n/r" + "安装路径:" + targetdir + "/n/r"+ "IIS版本:"+iisversion );

           
        }


    }
}

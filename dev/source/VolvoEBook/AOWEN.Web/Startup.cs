using System.Collections.Generic;
using AOWEN.Web.AppCode;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(AOWEN.Web.Startup))]
namespace AOWEN.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }

    }
}

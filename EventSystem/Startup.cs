using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EventSystem.Startup))]
namespace EventSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

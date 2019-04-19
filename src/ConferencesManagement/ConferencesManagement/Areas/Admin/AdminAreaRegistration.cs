using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", controller = "Home", id = UrlParameter.Optional },
                namespaces: new string[] { "ConferencesManagement.Areas.Admin.Controllers" }
            );
            context.MapRoute(
             name: "Edit",
             url: "Edit",
             defaults: new { controller = "User", action = "Edit", id = UrlParameter.Optional },
             namespaces: new[] { "ConferencesManagement.Areas.Admin.Controllers" }
             );

               context.MapRoute(
              name: "Create",
              url: "Create",
              defaults: new { controller = "User", action = "Create", id = UrlParameter.Optional },
              namespaces: new[] { "ConferencesManagement.Areas.Admin.Controllers" }
      );
        }
    }
}
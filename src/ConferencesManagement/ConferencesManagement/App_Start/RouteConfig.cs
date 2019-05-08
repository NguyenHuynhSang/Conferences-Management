using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ConferencesManagement
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {

            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ConferencesManagement.Controllers" }
            );

            routes.MapRoute(
              name: "Contact",
              url: "lien-he",
              defaults: new { controller = "Contact", action = "Index", id = UrlParameter.Optional },
              namespaces: new[] { "ConferencesManagement.Controllers" }
            );

            routes.MapRoute(
            name: "DangKy",
            url: "dang-ky",
            defaults: new { controller = "DangKy", action = "Index", id = UrlParameter.Optional },
            namespaces: new[] { "ConferencesManagement.Controllers" }
          );





        }
    }
}

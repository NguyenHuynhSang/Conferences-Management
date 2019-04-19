using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class TopicController : Controller
    {
        // GET: Admin/News
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Create()
        {
            return View();  
        }
    }
}
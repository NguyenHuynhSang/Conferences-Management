using Models.Framework;
using Models;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class FeedBackController : Controller
    {
        // GET: Admin/FeedBack
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var dao = new FeedBackDao();
            var result = dao.ListAllPaging(page, pageSize);
            return View(result);
        }

    }
}
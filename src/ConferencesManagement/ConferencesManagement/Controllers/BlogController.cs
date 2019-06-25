using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var db = new BlogDao();
            var model = db.ListAllPaging(page, pageSize);
            return View(model);
        }

        [HttpGet]
        public ActionResult BlogDetail(int id)
        {
            var blog = new BlogDao().BlogDetail(id);
            return View(blog);
        }


        [HttpGet]
        public ActionResult RecentBlog()
        {
            var blog = new BlogDao().ListTop5();
            return PartialView(blog);
        }


    }
}
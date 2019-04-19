using Models;
using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class SpeakerController : Controller
    {
        // GET: Admin/Speaker
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            var dao = new SpeakerDao();
            var result = dao.ListAllPaging(page, pageSize);
            return View(result);
        }

        public ActionResult Create(Speaker speaker)
        {
            if (ModelState.IsValid)
            {
                var dao = new SpeakerDao();
                long id = dao.Insert(speaker);
                if (id > 0)
                {
                    // chuyển hướng trang về admin/speaker/create
                    RedirectToAction("Index", "Speaker");
                }
                else
                {
                    ModelState.AddModelError("", "Them speaker loi");
                }
            }
            return View("Index");

        }

    }
}
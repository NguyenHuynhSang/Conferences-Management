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

        [HttpGet]

        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Create(Speaker speaker)
        {
            var dao = new SpeakerDao();
            var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(speaker);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index

                    RedirectToAction("Index", "Speaker", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them Speaker loi");
                }
            }
            return View("Index", result);

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var account = new SpeakerDao().SpeakerDetail(id);
            return View(account);
        }


        [HttpPost]
        public ActionResult Edit(Speaker speaker)
        {
            var dao = new SpeakerDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(speaker);

                if (result)
                {

                    RedirectToAction("Index", "Speaker", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật Không thành công");
                }
            }
            return View("Index", model);
        }


        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new SpeakerDao().Delete(id);
            return RedirectToAction("Index");
        }


    }
}
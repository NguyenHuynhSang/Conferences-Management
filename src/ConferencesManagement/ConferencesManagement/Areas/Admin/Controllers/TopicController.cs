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
    public class TopicController : Controller
    {
        // GET: Admin/News
        public ActionResult Index(int page = 1 , int pageSize=10)
        {
            var dao = new TopicDao();
            var result = dao.ListAllPaging(page, pageSize);
            return View(result);
        }

        [HttpGet]

        public ActionResult Create()
        {
            return View();
        }


        [HttpPost]
        public ActionResult Create(Topic topic)
        {
            var dao = new TopicDao();
            var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(topic);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index

                    RedirectToAction("Index", "Topic", result);
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
            var account = new TopicDao().TopicDetail(id);
            return View(account);
        }


        [HttpPost]
        public ActionResult Edit(Topic topic)
        {
            var dao = new TopicDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(topic);

                if (result)
                {

                    RedirectToAction("Index", "Topic", model);
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
            new TopicDao().Delete(id);
            return RedirectToAction("Index");
        }



    }
}
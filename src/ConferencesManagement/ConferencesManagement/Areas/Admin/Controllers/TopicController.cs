using ConferencesManagement.Common;
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
    public class TopicController : BaseController
    {

        // GET: Admin/News
        [ValidateInput(false)]
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            SetAlert("Load chủ đề thành công", "success");
            var dao = new TopicDao();
            var model = dao.GetTopicForIndex(page, pageSize);
            return View(model);
        }
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Topic topic)
        {
            SetViewBag();
            var dao = new TopicDao();
            var result = dao.GetTopicForIndex(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(topic);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo chủ đề thành công", "success");
                    return RedirectToAction("Index", "Topic", result);
                }
                else
                {
                    ModelState.AddModelError("", "Thêm chủ đề không thành công");
                }
            }
            return View("Index", result);

        }
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var account = new TopicDao().TopicDetail(id);
            return View(account);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(Topic topic)
        {
            var dao = new TopicDao();
            var model = dao.GetTopicForIndex(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(topic);

                if (result)
                {
                    SetAlert("Cập nhật chủ đề thành công", "success");
                    return RedirectToAction("Index", "Topic", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
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

        public void SetViewBag(long? selectedid = null)
        {
            selectedid = CommonConstants.CURRENT_HOITHAO;
            var dao = new HoiNghiDao();
            ViewBag.IDTopic = new SelectList(dao.GetHoiThaos(), "ID", "TenHoiThao", selectedid);

        }
    }
}
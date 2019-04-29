using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class ContactController : BaseController
    {
        // GET: Admin/Contact
        // GET: Admin/News
        [ValidateInput(false)]
        public ActionResult Index(string searchingString, int page = 1, int pageSize = 5)
        {
            SetAlert("Load contact thành công", "success");
            var dao = new ContactDao();
            var model = dao.ListAllPaging(page, pageSize, searchingString);
            ViewBag.Searching = searchingString;
            return View(model);
        }
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Contact topic)
        {
            var dao = new ContactDao();
            var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(topic);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo thông tin liên hệ thành công", "success");
                    return RedirectToAction("Index", "Contact", result);
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thông tin liên hệ không thành công");
                }
            }
            return View("Create");

        }
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var account = new ContactDao().contactDetail(id);
            return View(account);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(Contact topic)
        {
            var dao = new ContactDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(topic);

                if (result)
                {
                    SetAlert("Cập nhật thông tin liên hệ thành công", "success");
                    return RedirectToAction("Index", "Contact", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit", "Contact");
        }


        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ContactDao().Delete(id);
            return RedirectToAction("Index");
        }

    }
}
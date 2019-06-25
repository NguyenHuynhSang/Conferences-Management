using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class BlogController : BaseController
    {
        // GET: Admin/Blog
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            SetAlert("Load diễn giả thành công", "success");
            var dao = new BlogDao();
            var result = dao.ListAllPaging(page, pageSize);
      
            return View(result);
        }

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Create()
        {
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Blog blog)
        {
            var dao = new BlogDao();
            var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {
                SetAuditLog();
                blog.CreatedDate = _date;
                blog.CreatedBy = _userAction;
                long id = dao.Insert(blog);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo diễn giả thành công", "success");
                    return RedirectToAction("Index", "Blog", result);
                }
                else
                {
                    ModelState.AddModelError("", "Thêm diễn giả không thành công");
                }
            }
            return View("Create");

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var blog = new BlogDao().BlogDetail(id);
            return View(blog);
        }


        [HttpPost]
        public ActionResult Edit(Blog blog)
        {
            var dao = new BlogDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(blog);

                if (result)
                {
                    SetAlert("Cập nhật diễn giả thành công", "success");
                    return RedirectToAction("Index", "Blog", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit");
        }


        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new BlogDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}
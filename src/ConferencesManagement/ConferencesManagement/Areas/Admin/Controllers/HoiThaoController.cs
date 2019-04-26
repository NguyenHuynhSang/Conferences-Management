using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class HoiThaoController : BaseController
    {
        // GET: Admin/HoiThao
        public ActionResult Index(string searchingString, int page = 1,int pageSize=10)
        {
            var db = new HoiNghiDao();
            var model = db.ListAllPaging(page, pageSize, searchingString);
            ViewBag.Searching = searchingString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
        
            return View();
        }

        [HttpGet]

        public ActionResult Edit(int id)
        {
            var account = new HoiNghiDao().HoiThaoDetail(id);
            return View(account);
        }



        [HttpPost]
        public ActionResult Create(HoiThao hoinghi)
        {

  
            var dao = new HoiNghiDao();
            if (ModelState.IsValid)
            {

                long id = dao.Insert(hoinghi);
                if (id > 0)
                {

                    var result = dao.ListAllPaging(1, 10);
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo tài khoản thành công", "success");
                    return RedirectToAction("Index", "HoiThao", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them account loi");
                }
            }
            var model = dao.ListAllPaging(1, 10);
            return View("Index", model);

        }
        public ActionResult Edit(HoiThao account)
        {
      
            var dao = new HoiNghiDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {
                    SetAlert("Sửa tài khoản thành công", "success");
                    return RedirectToAction("Index", "HoiThao", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Index", model);
        }
    }
}
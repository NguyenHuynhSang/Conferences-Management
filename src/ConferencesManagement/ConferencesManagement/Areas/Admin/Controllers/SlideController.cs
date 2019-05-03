using ConferencesManagement.Common;
using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class SlideController : BaseController
    {
        // GET: Admin/Slide
        public ActionResult Index(string searchingString, int page = 1, int pageSize = 10)
        {
            SetAlert("Load diễn giả thành công", "success");
            var dao = new SlideDao();
            var result = dao.ListAllPaging(page, pageSize, searchingString);
            ViewBag.Searching = searchingString;
            return View(result);
        }
        [HttpGet]

        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }


        [HttpPost]
        public ActionResult Create(Slide slide)
        {
            SetViewBag();
            var dao = new SlideDao();
        //    var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(slide);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo Slide thành công", "success");
                    return RedirectToAction("Index");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm slide không thành công");
                }
            }
            return View("Create");

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            SetViewBag();
            var account = new SlideDao().SlideDetail(id);
            return View(account);
        }


        [HttpPost]
        public ActionResult Edit(Slide slide)
        {
            SetViewBag();
            var dao = new SlideDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(slide);

                if (result)
                {
                    SetAlert("Cập nhật Slide thành công", "success");
                    return RedirectToAction("Index", "Slide", model);
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
            var dao = new SlideDao();
            dao.Delete(id);
            var result = dao.ListAllPaging(1, 10);
            return RedirectToAction("Index",result);
        }

        public void SetViewBag(long? selectedid = null)
        {
            selectedid = CommonConstants.CURRENT_HOITHAO;
            var dao = new HoiNghiDao();
            ViewBag.IDHoiThao = new SelectList(dao.GetHoiThaos(), "ID", "TenHoiThao", selectedid);

        }
    }
}
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
    public class ScheduleController : BaseController
    {
        private static long getIDforEdit;
        // GET: Admin/Schedule
        public ActionResult Index(string searchingString, int page = 1, int pageSize = 10)
        {
            SetAlert("Load lịch trình thành công", "success");
            var dao = new ScheduleDao();
            var result = dao.GetScheduleForIndex(searchingString);
            ViewBag.Searching = searchingString;
            return View(result);
        }

        [HttpGet]

        public ActionResult Create()
        {
            SetViewBackHoiNghi();
            return View();
        }


        [HttpPost]
        public ActionResult Create(Schedule speaker)
        {
            SetViewBackHoiNghi();
            var dao = new ScheduleDao();
            if (ModelState.IsValid)
            {

                long id = dao.Insert(speaker);
                if (id > 0)
                {

                    var result = dao.GetScheduleForIndex();
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo  lich thành công", "success");
                    return RedirectToAction("Index", "Schedule", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them lich loi");
                }
            }
            var model = dao.GetScheduleForIndex();
            return View("Index", model);

        }

        public void SetViewBackHoiNghi(long? selectedid = null)
        {

            var dao = new HoiNghiDao();
            ViewBag.IDHoiThao = new SelectList(dao.ListAll(), "ID", "TenHoiThao", selectedid);
        }

        [HttpGet]

        public ActionResult Edit(int id)
        {
            getIDforEdit = id;
            SetViewBackHoiNghi();
            var account = new ScheduleDao().Detail(id);
            return View(account);
        }

        [HttpPost]
        public ActionResult Edit(Schedule account)
        {
            account.ID = getIDforEdit;
            SetViewBackHoiNghi();
            var dao = new ScheduleDao();
            var model = dao.GetScheduleForIndex();
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {
                    SetAlert("Sửa lịch trình thành công", "success");
                    return RedirectToAction("Index", "Schedule", model);
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
            new ScheduleDao().Delete(id);
            var dao = new ScheduleDao();
            var model = dao.GetScheduleForIndex();
            return RedirectToAction("Index", "Schedule", model);
        }
    }
}

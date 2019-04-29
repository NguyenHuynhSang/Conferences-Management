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
    public class ScheduleDetailController : BaseController
    {
        private static long getIDforEdit;
        // GET: Admin/ScheduleDetail
        public ActionResult Index(string searchingString, int page = 1, int pageSize = 10)
        {
            SetAlert("Load chi tiet lich trinh thành công", "success");
            var dao = new ScheduleDetailDao();
            var result = dao.GetScheduleDetailForIndex(searchingString);
            ViewBag.Searching = searchingString;
            return View(result);
        }

        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagSpeaker();
            SetViewBag();
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(ScheduleDetail speaker)
        {
            SetViewBagSpeaker();
            SetViewBag();
            var dao = new ScheduleDetailDao();
            if (ModelState.IsValid)
            {

                long id = dao.Insert(speaker);
                if (id > 0)
                {

                    var result = dao.GetScheduleDetailForIndex();
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo chi tiet lich thành công", "success");
                    return RedirectToAction("Index", "ScheduleDetail", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them chi tiet lich loi");
                }
            }
            return View("Create");

        }

        public void SetViewBagSpeaker(long? selectedid = null)
        {
            var dao1 = new SpeakerDao();
            ViewBag.IDSpeaker = new SelectList(dao1.ListAll(), "ID", "Name", selectedid);
        }

        [ValidateInput(false)]
        [HttpGet]

        public ActionResult Edit(int id)
        {
            SetViewBag();
            getIDforEdit = id;
            SetViewBagSpeaker();
            var account = new ScheduleDetailDao().Detail(id);
            return View(account);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(ScheduleDetail account)
        {
            account.ID = getIDforEdit;
            SetViewBagSpeaker();
            SetViewBag();
            var dao = new ScheduleDetailDao();
            var model = dao.GetScheduleDetailForIndex();
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {
                    SetAlert("Sửa chi tiết lịch trình thành công", "success");
                    return RedirectToAction("Index", "ScheduleDetail", model);
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
            new ScheduleDetailDao().Delete(id);
            var dao = new ScheduleDetailDao();
            var model = dao.GetScheduleDetailForIndex();
            return RedirectToAction("Index", "ScheduleDetail", model);
        }








        public void SetViewBag(long? selectedid = null)
        {
            var dao = new ScheduleDao();
            ViewBag.IDSchedule = new SelectList(dao.GetScheduleForIndex(), "ID", "ChiTiet");

        }
    }
}
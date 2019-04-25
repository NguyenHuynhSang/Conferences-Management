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
        public ActionResult Index(int page = 1, int pageSize = 10)
        {
            SetAlert("Load chi tiet lich trinh thành công", "success");
            var dao = new ScheduleDetailDao();
            var result = dao.GetScheduleDetailForIndex();
            return View(result);
        }

        [HttpGet]

        public ActionResult Create()
        {
            SetViewBagSpeaker();
            return View();
        }


        [HttpPost]
        public ActionResult Create(ScheduleDetail speaker)
        {
            SetViewBagSpeaker();
            var dao = new ScheduleDetailDao();
            if (ModelState.IsValid)
            {

                long id = dao.Insert(speaker);
                if (id > 0)
                {

                    var result = dao.GetScheduleDetailForIndex();
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo chi tiet lich thành công", "success");
                    return RedirectToAction("Index", "Schedule", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them chi tiet lich loi");
                }
            }
            var model = dao.GetScheduleDetailForIndex();
            return View("Index", model);

        }

        public void SetViewBagSpeaker(long? selectedid = null)
        {
            var dao1 = new SpeakerDao();
            ViewBag.IDSpeaker = new SelectList(dao1.ListAll(), "ID", "Name", selectedid);
        }

        [HttpGet]

        public ActionResult Edit(int id)
        {
            getIDforEdit = id;
            SetViewBagSpeaker();
            var account = new AccountDao().AccountDetail(id);
            return View(account);
        }

        [HttpPost]
        public ActionResult Edit(ScheduleDetail account)
        {
            account.ID = getIDforEdit;
            SetViewBagSpeaker();
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
            return View("Index", model);
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ScheduleDetailDao().Delete(id);
            var dao = new ScheduleDetailDao();
            var model = dao.GetScheduleDetailForIndex();
            return RedirectToAction("Index", "ScheduleDetail", model);
        }
    }
}
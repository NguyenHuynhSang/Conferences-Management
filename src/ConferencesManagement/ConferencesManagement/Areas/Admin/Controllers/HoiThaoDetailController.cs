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
    public class HoiThaoDetailController : BaseController
    {
        // GET: Admin/HoiThaoDetail
        private static long getIDforEdit;
        public ActionResult Index(string searchingString, int page = 1, int pageSize = 10)
        {
            SetAlert("Load chi tiet hoi thao thành công", "success");
            var dao = new HoiThaoDetailDao();
            var result = dao.GetHTDetailForIndex(searchingString);
            ViewBag.Searching = searchingString;
            return View(result);
        }


        [HttpGet]
        public ActionResult Create()
        {
            SetViewBackHoiNghi();
            SetViewBagSpeaker();
            return View();
        }

        [HttpPost]
        public ActionResult Create(HoiThaoDetail account)
        {

            SetViewBackHoiNghi();
            SetViewBagSpeaker();
            var dao = new HoiThaoDetailDao();
            if (ModelState.IsValid)
            {

                long id = dao.Insert(account);
                if (id > 0)
                {

                    var result = dao.GetHTDetailForIndex();
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo chi tiet hoi thao thành công", "success");
                    return RedirectToAction("Index", "HoiThaoDeTail", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them hoi thao loi");
                }
            }
            var model = dao.GetHTDetailForIndex();
            return View("Index", model);

        }

        public void SetViewBackHoiNghi(long? selectedid = null)
        {

            var dao = new HoiNghiDao();
            ViewBag.IDHoiThao = new SelectList(dao.ListAll(), "ID", "TenHoiThao", selectedid);


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
            SetViewBackHoiNghi();
            SetViewBagSpeaker();
            var account = new HoiThaoDetailDao().Detail(id);
            return View(account);
        }

        [HttpPost]
        public ActionResult Edit(HoiThaoDetail account)
        {
            account.ID = getIDforEdit;
            SetViewBackHoiNghi();
            SetViewBagSpeaker();
            var dao = new HoiThaoDetailDao();
            var model = dao.GetHTDetailForIndex();
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {
                    SetAlert("Sửa hoi thao thành công", "success");
                    return RedirectToAction("Index", "HoiThaoDeTail", model);
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
            new HoiThaoDetailDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
   
}
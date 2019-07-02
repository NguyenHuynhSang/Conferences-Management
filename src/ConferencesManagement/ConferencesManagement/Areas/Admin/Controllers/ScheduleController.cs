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
        public ActionResult Index(int page = 1, int pageSize = 10,int? IDHoiThao=null)
        {
            SetAlert("Load lịch trình thành công", "success");
            GetDSHoiThao();
            var dao = new ScheduleDao();
            var result = dao.GetScheduleForIndex(IDHoiThao);
            ViewBag.IDHoiThao = IDHoiThao;
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
            bool isTrung = false;
            var dao = new ScheduleDao();
            var hn = (new HoiNghiDao()).GetHoiThaoByID((int)speaker.IDHoiThao);
            var dsLichTrinh = dao.GetDSLichTrinhByIDHoiThao(speaker.IDHoiThao.Value);
            foreach (var item in dsLichTrinh)
            {
                if (item.NgayDienRa.Date==speaker.NgayDienRa.Date)
                {
                    isTrung = true;
                }
            }

            if (isTrung == true)
            {
                ModelState.AddModelError("", "Ngày lịch trình bị trùng");
                return View("Create");
            }
            if(speaker.NgayDienRa.Date<hn.NgayDienRa.Date)
            {
                ModelState.AddModelError("", "Ngày lịch trình không được nhỏ hơn ngày bắt đầu hội nghị");
            }
            else if(speaker.NgayDienRa.Date > hn.NgayKetThuc.Date)
            {
                ModelState.AddModelError("", "Ngày lịch trình không được lớn hơn ngày kết thúc hội nghị");
            }
            else if (ModelState.IsValid)
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
          
            return View("Create");

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
            SetViewBackHoiNghi();
            bool isTrung = false;
            var dao = new ScheduleDao();
            var dsLichTrinh = dao.GetDSLichTrinhByIDHoiThao(account.IDHoiThao.Value);
            var hn = (new HoiNghiDao()).GetHoiThaoByID((int)account.IDHoiThao);
            foreach (var item in dsLichTrinh)
            {
                if (item.NgayDienRa.Date == account.NgayDienRa.Date)
                {
                    isTrung = true;
                }
            }

            if (isTrung == true)
            {
                ModelState.AddModelError("", "Ngày lịch trình bị trùng");
                return View("Edit");
            }
            account.ID = getIDforEdit;
          
            var model = dao.GetScheduleForIndex();
            if (account.NgayDienRa.Date < hn.NgayDienRa.Date)
            {
                ModelState.AddModelError("", "Ngày lịch trình không được nhỏ hơn ngày bắt đầu hội nghị");
            }
            else if (account.NgayDienRa.Date > hn.NgayKetThuc.Date)
            {
                ModelState.AddModelError("", "Ngày lịch trình không được lớn hơn ngày kết thúc hội nghị");
            }

            else if(ModelState.IsValid)
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
            return View("Edit");
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ScheduleDao().Delete(id);
            var dao = new ScheduleDao();
            var model = dao.GetScheduleForIndex();
            return RedirectToAction("Index", "Schedule", model);
        }

        public void GetDSHoiThao()
        {

            var dao = new HoiNghiDao();
            ViewBag.DSHoiThao = dao.GetHoiThaos().ToList();

        }
    }
}

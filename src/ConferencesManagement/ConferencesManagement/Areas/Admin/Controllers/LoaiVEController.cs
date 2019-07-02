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
    public class LoaiVeController : BaseController
    {
        // GET: Admin/LoaiVe
        public ActionResult Index(int page = 1, int pageSize = 10,int? HoiThaoID = null,string tenLoaiVe=null)
        {
            GetDSHoiThao();
            SetAlert("Load dữ liệu thành công", "success");
            var dao = new LoaiVeDao();
            var result = dao.ListAllPaging(page, pageSize, HoiThaoID, tenLoaiVe);
            ViewBag.HoiThaoID = HoiThaoID;
            ViewBag.tenLoaiVe = tenLoaiVe;
            return View(result);
        }

        [HttpGet]
        [ValidateInput(false)]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(LoaiVe loaiVe)
        {
            SetViewBag();
            var dao = new LoaiVeDao();
            var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {
                SetAuditLog();
                loaiVe.CreatedDate = _date;
                loaiVe.CreatedBy = _userAction;
                long id = dao.Insert(loaiVe);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo diễn giả thành công", "success");
                    return RedirectToAction("Index", "LoaiVe", result);
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
            SetViewBag();
            var loaiVe = new LoaiVeDao().LoaiVeDetail(id);
            return View(loaiVe);
        }


        [HttpPost]
        public ActionResult Edit(LoaiVe loaiVe)
        {
            var dao = new LoaiVeDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(loaiVe);

                if (result)
                {
                    SetAlert("Cập nhật diễn giả thành công", "success");
                    return RedirectToAction("Index", "LoaiVe", model);
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
            new LoaiVeDao().Delete(id);
            return RedirectToAction("Index");
        }

        public void GetDSHoiThao()
        {

            var dao = new HoiNghiDao();
            ViewBag.DSHoiThao = dao.GetHoiThaos().ToList();

        }
        public void SetViewBag(long? selectedid = null)
        {
     
            var dao = new HoiNghiDao();
            ViewBag.IDHoiThao = new SelectList(dao.GetHoiThaos(), "ID", "TenHoiThao", selectedid);
        }
    }
}
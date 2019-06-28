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
        public ActionResult Index(string tenHoiThao,string noiDienRa,string ngayDienRa, int page = 1,int pageSize=10)
        {
            SetAlert("Load Hội thảo thành công", "success");
            var db = new HoiNghiDao();
            var model = db.ListAllPaging(page, pageSize, tenHoiThao,noiDienRa, ngayDienRa);
            ViewBag.tenHoiThao = tenHoiThao;
            ViewBag.noiDienRa = noiDienRa;
            ViewBag.ngayDienRa = ngayDienRa;
            return View(model);
        }
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Create()
        {
          
            var modal = new HoiThao();
            SetAuditLog();
            modal.CreatedBy = _userAction;
            modal.CreatedDate = _date;
            modal.NgayDienRa = DateTime.Now;
            return View(modal);
        }
        [ValidateInput(false)]
        [HttpGet]

        public ActionResult Edit(int id)
        {
            var account = new HoiNghiDao().GetHoiThaoByID(id);
            return View(account);
        }


        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(HoiThao hoinghi)
        {

            hoinghi.NgayDienRa = DateTime.Now;
            var dao = new HoiNghiDao();
          
            if (ModelState.IsValid)
            {

                long id = dao.Insert(hoinghi);
                if (id > 0)
                {

                    var result = dao.ListAllPaging(1, 10);
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo hội nghị thành công", "success");
                    return RedirectToAction("Index", "HoiThao", result);
                }
                else
                {
                    ModelState.AddModelError("", "Them account loi");
                }
            }
         
            return View("Create");

        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(HoiThao account)
        {
      
            var dao = new HoiNghiDao();
            var model = dao.ListAllPaging(1, 10);
            SetAuditLog();
            account.ModifiedBy = _userAction;
            account.ModifiedDate = _date;
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {
                    SetAlert("Sửa Hội nghị thành công", "success");
                    return RedirectToAction("Index", "HoiThao", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }

            }
            return View("Edit");
        }


    

        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new HoiNghiDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }

     


    }
}
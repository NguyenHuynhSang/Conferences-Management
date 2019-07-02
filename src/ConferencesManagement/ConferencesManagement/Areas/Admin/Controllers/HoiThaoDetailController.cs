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
        public ActionResult Index(int? HoiThaoID, int page = 1, int pageSize = 10)
        {
            SetAlert("Load DS Speaker thành công", "success");
            GetDSHoiThao();
            SetViewBagSpeaker();
            var dao = new HoiThaoDetailDao();
            var result = dao.GetHTDetailForIndex(HoiThaoID);
            ViewBag.HoiThaoID = HoiThaoID;
            return View(result);
        }


        [HttpGet]
        public ActionResult Create(int? id=0)
        {
            ViewBag.TenHoiThao = "";
            if (id != 0 && id!=null)
            {
                var db = (new HoiNghiDao()).GetHoiThaoByID((int)id);
                GetDSSpeaker(id);
                ViewBag.TenHoiThao = db.TenHoiThao;
                var htD = new HoiThaoDetail();
                htD.IDHoiThao = (long)id;
                return View(htD);
            }

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
          //  var model = dao.GetHTDetailForIndex();
            return View("Create");

        }

       
       
        public ActionResult SelectHoiThao(string tenHoiThao, string noiDienRa, string ngayDienRa, int page = 1, int pageSize = 10)
        {
            SetAlert("Load Hội thảo thành công", "success");
            var db = new HoiNghiDao();
            var model = db.ListAllPaging(page, pageSize, tenHoiThao, noiDienRa, ngayDienRa);
            ViewBag.tenHoiThao = tenHoiThao;
            ViewBag.noiDienRa = noiDienRa;
            ViewBag.ngayDienRa = ngayDienRa;
            return PartialView(model);
        }

  
      
        public ActionResult SearchParameter(string tenHoiThao, string noiDienRa, string ngayDienRa, int page = 1, int pageSize = 10)//Partial View for partial refreshing.
        {
            SetAlert("Load Hội thảo thành công", "success");
            var db = new HoiNghiDao();
            var model = db.ListAllPaging(page, pageSize, tenHoiThao, noiDienRa, ngayDienRa);
            ViewBag.tenHoiThao = tenHoiThao;
            ViewBag.noiDienRa = noiDienRa;
            ViewBag.ngayDienRa = ngayDienRa;
            return PartialView(model);
        }


        public void SetViewBackHoiNghi(long? selectedid = null)
        {

            var dao = new HoiNghiDao();
            ViewBag.IDHoiThao = new SelectList(dao.ListAll(), "ID", "TenHoiThao", selectedid);


        }

        public void GetDSSpeaker(int? IDHoiThao)
        {
            var dsSpeakerJoined = (new HoiThaoDetailDao()).ListByGroupId((long)IDHoiThao);
            var dsSpeaker = (new SpeakerDao()).ListAll();
            foreach (var item in dsSpeaker.ToList())
            {
                foreach (var child in dsSpeakerJoined)
                {
                    if (item.ID == child.IDSpeaker)
                    {
                        dsSpeaker.Remove(item);
                    }
                }
            }
            ViewBag.IDSpeaker = new SelectList(dsSpeaker, "ID", "Name");
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
                    SetAlert("Sửa  thành công", "success");
                    return RedirectToAction("Index", "HoiThaoDeTail", model);
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
            new HoiThaoDetailDao().Delete(id);
            return RedirectToAction("Index");
        }

        public void GetDSHoiThao()
        {

            var dao = new HoiNghiDao();
            ViewBag.DSHoiThao = dao.GetHoiThaos().ToList();

        }
    }
   
}
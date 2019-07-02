using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class VeController : BaseController
    {
        // GET: Admin/Ve
        public ActionResult Index(int page = 1, int pageSize = 5, int? HoiThaoID=null)
        {
            GetDSHoiThao();
            SetAlert("Load ds vé thành công", "success");
          
            var model = (new VeDao()).GetVeForIndex(page, pageSize, HoiThaoID);
            ViewBag.HoiThaoID = HoiThaoID;
            return View(model);
        }
        public void GetDSHoiThao()
        {

            var dao = new HoiNghiDao();
            ViewBag.DSHoiThao = dao.GetHoiThaos().ToList();

        }
    }
}
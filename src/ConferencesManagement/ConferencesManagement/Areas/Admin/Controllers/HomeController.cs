using ConferencesManagement.Common;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            CommonConstants.CURRENT_HOITHAO = (new HoiNghiDao().GetActiveHoiThao()).ID;
            return View();
        }
    }
}
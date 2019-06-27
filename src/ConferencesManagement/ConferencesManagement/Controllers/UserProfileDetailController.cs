using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class UserProfileDetailController : Controller
    {
        // GET: UserProfileDetail
        [HttpGet]
        public ActionResult Index()
        {
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
            if (session == null) Index();
            var modal = new AccountDao().GetUserByID(session.IdAccount);
            return View(modal);
        }
    }
}
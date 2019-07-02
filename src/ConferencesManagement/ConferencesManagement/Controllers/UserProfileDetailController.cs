using Models;
using Models.Framework;
using Models.Models;
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
            var modal = new AccountDao().GetUserByID(session.IdAccount);
            return View(modal);
        }


        [HttpGet]
        public ActionResult UpdateAccount()
        {
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
            var account = new AccountDao().AccountDetail((int)session.IdAccount);
            return PartialView(account);
        }

        [HttpPost]
        public ActionResult Index(Account account)
        {

            var dao = new AccountDao();
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];

            account.IdAccount = session.IdAccount;
            var modal = new AccountDao().GetUserByID(session.IdAccount);
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);
                if (result)
                {

                    return RedirectToAction("Index", "UserProfileDetail", modal);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return RedirectToAction("Index", "UserProfileDetail", modal);
        }

        [ChildActionOnly]
        [HttpGet]
        public ActionResult UserTimeLine()
        {
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
            var modal = (new VeDao()).GetVeDetail(session.IdAccount);
            return PartialView(modal);
        }
    }
}
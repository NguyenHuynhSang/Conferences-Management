using ConferencesManagement.Common;
using ConferencesManagement.Models;
using Models;
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost] // khong nhan URL
        [ValidateAntiForgeryToken]// bảo mật, chi tiết google
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new AccountDao();
                var result = dao.Login(model.UserName, model.PassWord);
                if (result == 1)
                {
                    var user = dao.GetByName(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.UserName;
                    userSession.IdAccount = user.IdAccount;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 0)
                {
                    ModelState.AddModelError("", "Tài khoản không tồn tại ");
                }
                else
                {
                    ModelState.AddModelError("", "Sai mật khẩu ");
                }

            }
            return View("Index");
        }

    }
}
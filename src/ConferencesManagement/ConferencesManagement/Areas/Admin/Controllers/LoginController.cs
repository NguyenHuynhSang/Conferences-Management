using ConferencesManagement.Areas.Admin.Code;
using ConferencesManagement.Areas.Admin.Models;
using ConferencesManagement.Common;
using Models;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Logic
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login (LoginModel model)
        {
            
            if (ModelState.IsValid)
            {
                var dao = new AccountModel();
                var result = dao.Login(model.UserName, model.PassWord);
                if (result)
                {
                    var user = dao.GetByName(model.UserName);
                    var userSession = new UserLogin();
                    userSession.UserName = user.Username;
                    userSession.IdAccount = user.IdAccount;
                    Session.Add(CommonConstants.USER_SESSION, userSession);
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không đúng");
                }
           
            }
            return View("Index");
        }
        
  
       
    }
}
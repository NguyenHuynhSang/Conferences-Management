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
        [HttpPost] // khong nhan URL
        [ValidateAntiForgeryToken]// bảo mật, chi tiết google
        public ActionResult Login (LoginModel model)
        {          
            if (ModelState.IsValid)
            {
                var dao = new AccountDao();
                var result = dao.Login(model.UserName, model.PassWord);
                if (result==1)
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
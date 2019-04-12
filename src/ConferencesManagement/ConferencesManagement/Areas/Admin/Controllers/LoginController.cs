using ConferencesManagement.Areas.Admin.Code;
using ConferencesManagement.Areas.Admin.Models;
using Models;
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

        
    [HttpGet] //nhận URL
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost] // khong nhan URL
        [ValidateAntiForgeryToken]// bảo mật, chi tiết google
        public ActionResult Index(LoginModel model)
        {
          //  var result = new AccountModel().Login(model.UserName, model.PassWord);
            if (Membership.ValidateUser(model.UserName,model.PassWord) == true && ModelState.IsValid)
            {
                //  SessionHelper.setSession(new UserSession() { UserName = model.UserName });

                FormsAuthentication.SetAuthCookie(model.UserName, model.RememberMe);
                return RedirectToAction("Index", "Home"); // lưu dấu xong cho vào trang chủ của admin
            }
            else
            {
                ModelState.AddModelError("", "Sai tên đăng nhập hoặc mật khẩu");
            }
            return View(model);
            
        }

        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
       // tu huy cookie
            return RedirectToAction("Index", "Login"); 
        }

    }
}
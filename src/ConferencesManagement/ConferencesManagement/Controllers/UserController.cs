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
    public class UserController : Controller
    {
        // GET: User

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(DangKy account)
        {
            var dao = new AccountDao();
            if(dao.GetByName(account.UserName)!=null)
            {
                ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                
            }
            else if(dao.checkemail(account.Email)==true)
            {
                ModelState.AddModelError("", "Email đã được sử dụng");
            }
            else
            {
                var user = new Account();
                user.UserName = account.UserName;
                user.PassWord = account.PassWord;
                user.Email = account.Email;
                user.SDT = account.SDT;
                user.DiaChi = account.DiaChi;
                user.CreatedDate = DateTime.Now;
                user.TypeAccount = 2;
                user.Status = true;
                var result = dao.Insert(user);
                if(result>0)
                {
                    ViewBag.Success = "Đăng ký thành công";
                    account = new DangKy();
                    return RedirectToAction("Index", "Login");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng ký không thành công, vui lòng thử lại");
                }
            }
            return View(account);
        }

        public ActionResult Logout()
        {
            Session[CommonConstants.USER_SESSION] = null;
            return Redirect("/");

        }

    }
}
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
    public class UserController : Controller
    {
        // GET: Admin/User
        public ActionResult Index()
        {
          
           return View();
        }

        public ActionResult Create(Account account)
        {
            SetViewBack();
            if (ModelState.IsValid)
            {
                var dao = new AccountDao();
                long id = dao.Insert(account);
                if (id > 0)
                {
                    // chuyển hướng trang về admin/User/index
                    RedirectToAction("Index", "User");
                }
                else {
                    ModelState.AddModelError("", "Them account loi");
                }
            }
            return View("Index");
          
        }


        // lấy danh sách typeaccount hiện thị vào dropdownlist
        public void SetViewBack(long? selectedid=null)
        {
            var dao = new TypeAccountDao();
            ViewBag.TypeAccount = new SelectList(dao.ListAll(), "IdTypeAccount", "TypeName", selectedid );
        }
    }
}
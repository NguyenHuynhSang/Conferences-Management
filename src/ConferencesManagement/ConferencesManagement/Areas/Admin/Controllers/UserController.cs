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
        public ActionResult Index(int page =1 , int pageSize =10)
        {
            var dao = new AccountDao();
            var result = dao.ListAllPaging(page, pageSize);
            return View(result);
        }
        //[HttpGet]
        //public ActionResult Create()
        //{
        //    return View();
        //}

        [HttpGet]
       
       public ActionResult Create()
        {
            SetViewBack();
            return View();
        }

        [HttpGet]

        public ActionResult Edit(int id)
        {
            var account = new AccountDao().AccountDetail(id);
            return View(account);
        }

        [HttpPost]
        public ActionResult Create(Account account)
        {
            var dao = new AccountDao();
            var result = dao.ListAllPaging(1, 10);
            SetViewBack();
            if (ModelState.IsValid)
            {
               
                long id = dao.Insert(account);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                  
                    RedirectToAction("Index", "User", result);
                }
                else {
                    ModelState.AddModelError("", "Them account loi");
                }
            }
            return View("Index", result);
          
        }
      
        [HttpPost]
        public ActionResult Edit(Account account)
        {
            SetViewBack();
            var dao = new AccountDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {

                    RedirectToAction("Index", "User",model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật Không thành công");
                }
            }
            return View("Index",model);
        }

        // lấy danh sách typeaccount hiện thị vào dropdownlist
        public void SetViewBack(long? selectedid=null)
        {

            var dao = new TypeAccountDao();
            ViewBag.TypeAccount = new SelectList(dao.ListAll(), "IdTypeAccount", "TypeName", selectedid );
        }
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new AccountDao().Delete(id);
            return RedirectToAction("Index");
        }

    }
}
using ConferencesManagement.Common;
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
    public class UserController : BaseController
    {

        private static long getIDforEdit;
        // GET: Admin/User
        public ActionResult Index(string userName,string HoTen,string Email, int page =1 , int pageSize =10)
        {
          
            SetAlert("Load tài khoản thành công", "success");
            var dao = new AccountDao();
            var result = dao.ListAllPaging(page, pageSize, userName,HoTen,Email);
            ViewBag.UserName = userName;
            ViewBag.HoTen = HoTen;
            ViewBag.Email = Email;
            return View(result);
        }


   
        [HttpGet]
       public ActionResult Create()
        {
            SetViewBack();
            return View();
        }

        [HttpGet]

        public ActionResult Edit(int id)
        {
            getIDforEdit = id;
            var account = new AccountDao().AccountDetail(id);
            return View(account);
        }

        [HttpPost]
        public ActionResult Create(Account account)
        {
        
            SetViewBack();
            var dao = new AccountDao();
            if (ModelState.IsValid)
            {
                account.CreatedDate = _date;
                account.CreatedBy = _userAction;
                long id = dao.Insert(account);
                if (id > 0)
                {
                  
                    var result = dao.ListAllPaging(1, 10);
                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo tài khoản thành công", "success");
                    return RedirectToAction("Index","User", result);
                }
                else {
                    ModelState.AddModelError("", "Them account loi");
                }
            }
            return View("Create");
          
        }
      
        [HttpPost]
        public ActionResult Edit(Account account)
        {
            account.IdAccount = getIDforEdit;
            SetViewBack();
            SetAuditLog();
            account.ModifiedDate = _date;
            account.ModifiedBy = _userAction;
            var dao = new AccountDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(account);

                if (result)
                {
                    SetAlert("Sửa tài khoản thành công", "success");
                    return RedirectToAction("Index", "User",model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit");
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
            var dao = new AccountDao();
            dao.Delete(id);
            var model = dao.ListAllPaging(1, 10);
            return View("Index", model);
        }

    }
}
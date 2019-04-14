using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Models.Framework;
using Models.Models;
namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class TypeAccountController : Controller
    {
        // GET: Admin/TypeAccount
        public ActionResult Index()
        {
            var iplTypeAccount = new TypeAccountModel();
            var model = iplTypeAccount.ListAll();
            return View(model);
        }

        // GET: Admin/TypeAccount/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Admin/TypeAccount/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TypeAccount/Create
        [HttpPost]
        public ActionResult Create(TypeAccount collection)
        {
            try
            {
                // TODO: Add insert logic here

               

                if (ModelState.IsValid)
                {
                    var model = new TypeAccountModel();
                    int res = model.Create(collection.TypeName,3);
                    if (res > 0)
                    {
                        return RedirectToAction("Index");
                    }
                    else
                    {
                        ModelState.AddModelError("", "Thêm lỗi rồi người ơi...");
                    }

                }

                return View(collection);
              
            }
            catch   
            {
                return View();
            }
        }

        // GET: Admin/TypeAccount/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Admin/TypeAccount/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/TypeAccount/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Admin/TypeAccount/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here




                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}

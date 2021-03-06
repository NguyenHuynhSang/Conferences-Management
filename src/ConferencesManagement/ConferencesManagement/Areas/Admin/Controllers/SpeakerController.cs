﻿using Models;
using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Areas.Admin.Controllers
{
    public class SpeakerController : BaseController
    {
        // GET: Admin/Speaker
        public ActionResult Index(string HoTen, string SoDienThoai, string Email,int page = 1, int pageSize = 10)
        {
            SetAlert("Load diễn giả thành công", "success");
            var dao = new SpeakerDao();
            var result = dao.ListAllPaging(page, pageSize, HoTen,SoDienThoai,Email);
            ViewBag.HoTen = HoTen;
            ViewBag.SDT = SoDienThoai;
            ViewBag.Email = Email;
            return View(result);
        }

        [HttpGet]

        public ActionResult Create(int? IDHoiThao)
        {

            return View();
        }


        [HttpPost]
        public ActionResult Create(Speaker speaker)
        {
            var dao = new SpeakerDao();
            var result = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(speaker);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo diễn giả thành công", "success");
                   return RedirectToAction("Index", "Speaker", result);
                }
                else
                {
                    ModelState.AddModelError("", "Thêm diễn giả không thành công");
                }
            }
            return View("Create");

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var account = new SpeakerDao().SpeakerDetail(id);
            return View(account);
        }


        [HttpPost]
        public ActionResult Edit(Speaker speaker)
        {
            var dao = new SpeakerDao();
            var model = dao.ListAllPaging(1, 10);
            if (ModelState.IsValid)
            {

                var result = dao.Update(speaker);

                if (result)
                {
                    SetAlert("Cập nhật diễn giả thành công", "success");
                    return RedirectToAction("Index", "Speaker", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit");
        }


        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new SpeakerDao().Delete(id);
            return RedirectToAction("Index");
        }


    }
}
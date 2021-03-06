﻿using ConferencesManagement.Common;
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
    public class TopicController : BaseController
    {

        // GET: Admin/News
        [ValidateInput(false)]
        public ActionResult Index(int? HoiThaoID,string topicMenu,string chuDe, int page = 1, int pageSize = 5)
        {
            GetDSHoiThao();
            SetAlert("Load chủ đề thành công", "success");
            var dao = new ChuDeDao();
            var model = dao.GetTopicForIndex(page, pageSize, HoiThaoID,topicMenu,chuDe);
            ViewBag.Searching = HoiThaoID;
            ViewBag.TopicMenu = topicMenu;
            ViewBag.ChuDe = chuDe;
            return View(model);
        }

        [HttpGet]
        public ActionResult SelectHoiThao(string tenHoiThao, string noiDienRa, string ngayDienRa, int page = 1, int pageSize = 10)
        {
            SetAlert("Load Hội thảo thành công", "success");
            var db = new HoiNghiDao();
            var model = db.ListAllPaging(page, pageSize, tenHoiThao, noiDienRa, ngayDienRa);
            ViewBag.tenHoiThao = tenHoiThao;
            ViewBag.noiDienRa = noiDienRa;
            ViewBag.ngayDienRa = ngayDienRa;
            return PartialView(model);
        }
        public ActionResult SearchParameter(string tenHoiThao, string noiDienRa, string ngayDienRa, int page = 1, int pageSize = 10)//Partial View for partial refreshing.
        {
            SetAlert("Load Hội thảo thành công", "success");
            var db = new HoiNghiDao();
            var model = db.ListAllPaging(page, pageSize, tenHoiThao, noiDienRa, ngayDienRa);
            ViewBag.tenHoiThao = tenHoiThao;
            ViewBag.noiDienRa = noiDienRa;
            ViewBag.ngayDienRa = ngayDienRa;
            return PartialView(model);
        }


        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }

        [HttpGet]
        public ActionResult CreateBy(int ID)
        {
            SetViewBag();
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Topic topic)
        {
            SetViewBag();
            var dao = new ChuDeDao();
            var result = dao.GetTopicForIndex(1, 10);
            if (ModelState.IsValid)
            {

                long id = dao.Insert(topic);
                if (id > 0)
                {

                    // chuyển hướng trang về admin/User/index
                    SetAlert("Tạo chủ đề thành công", "success");
                    return RedirectToAction("Index", "Topic", result);
                }
                else
                {
                    ModelState.AddModelError("", "Thêm chủ đề không thành công");
                }
            }
            return View("Create");

        }
        [ValidateInput(false)]
        [HttpGet]
        public ActionResult Edit(int id)
        {
            SetViewBag();

            var account = new ChuDeDao().TopicDetail(id);
            return View(account);
        }

        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Edit(Topic topic)
        {
            var dao = new ChuDeDao();
            var model = dao.GetTopicForIndex(1, 10);
            if (ModelState.IsValid)
            {
                var result = dao.Update(topic);
                if (result)
                {
                    SetAlert("Cập nhật chủ đề thành công", "success");
                    return RedirectToAction("Index", "Topic", model);
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật không thành công");
                }
            }
            return View("Edit","Topic");
        }


        [HttpDelete]
        public ActionResult Delete(int id)
        {
            new ChuDeDao().Delete(id);
            return RedirectToAction("Index");
        }

        public void SetViewBag(long? selectedid = null)
        {
            selectedid = CommonConstants.CURRENT_HOITHAO;
            var dao = new HoiNghiDao();
            ViewBag.IDTopic = new SelectList(dao.GetHoiThaos(), "ID", "TenHoiThao", selectedid);
        }
        public void GetDSHoiThao()
        {

            var dao = new HoiNghiDao();
            ViewBag.DSHoiThao = dao.GetHoiThaos().ToList();

        }
    }
}
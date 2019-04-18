﻿using ConferencesManagement.Common;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult MainMenu()
        {
            var model = new MenuDao().ListByGroupId(1);
            return PartialView(model);
        }

        // lấy ra ds topic của hội thảo hiện tại hiển thị lên client
        //PartialView là 1 phần trong trang, nhưng k phải là trang
        public ActionResult TopicMenu()
        {
            var model = new TopicDao().ListByGroupId(CommonConstants.CURRENT_HOITHAO);
            return PartialView(model);
        

        }

        public ActionResult TitleInfo()
        {

            var model = new HoiNghiDao().GetActiveHoiThao();
            return PartialView(model);

        }

        public ActionResult HomeContent()
        {
            var model = new HoiNghiDao().GetActiveHoiThao();
            return PartialView(model);

        }


    }
}
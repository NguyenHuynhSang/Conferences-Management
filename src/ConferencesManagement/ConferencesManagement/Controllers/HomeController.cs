﻿    using ConferencesManagement.Common;
using Models;
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
            (new HoiNghiDao()).CapNhatTrangThai();
            CommonConstants.CURRENT_HOITHAO = (new HoiNghiDao().GetActiveHoiThao()).ID;
           
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
            var dao = new ChuDeDao();
            var currentHoiThao = (new HoiNghiDao().GetActiveHoiThao()).ID;
            var model = new ChuDeDao().ListByGroupId(CommonConstants.CURRENT_HOITHAO);
            return PartialView(model);
        

        }
        [ChildActionOnly]
        public ActionResult TitleInfo()
        {

            var model = new HoiNghiDao().GetActiveHoiThao();
            return PartialView(model);

        }

        [ChildActionOnly]
        public ActionResult HomeContent()
        {
            var model = new SlideDao().GetCurrentSlideOfHoiThao((int)CommonConstants.CURRENT_HOITHAO);

            
            return PartialView(model);

        }

        [ChildActionOnly]
        public ActionResult SpeakerMenu()
        {
            var model = new SpeakerDao().GetSpeakersJoinConference(CommonConstants.CURRENT_HOITHAO);
            return PartialView(model);

        }

        [HttpGet]
        [ChildActionOnly]
        public ActionResult UserProfile()
        {
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
            if (session == null) Index();
            var modal = new AccountDao().GetUserByID(session.IdAccount);
            return PartialView(modal);
        }

        [ChildActionOnly]
        public ActionResult ScheduleMainMenu()
        {
            var model = new ScheduleDetailDao().GetScheduleDetailForIndex();
            SetViewBack();
            return PartialView(model);
        }

        [ChildActionOnly]
        public ActionResult TimerCount()
        {
         
            var dao = new HoiNghiDao();
           

            var model = new TimeSpan();
            model = dao.GetActiveHoiThao().NgayDienRa-DateTime.Now ;


            return PartialView(model);
        }


        public void SetViewBack(long? selectedid = null)
        {

            var dao = new ScheduleDao();
            ViewBag.Schedules = (dao.GetScheduleByCurrentHoiThao(CommonConstants.CURRENT_HOITHAO)).ToList();
        }


    }
}
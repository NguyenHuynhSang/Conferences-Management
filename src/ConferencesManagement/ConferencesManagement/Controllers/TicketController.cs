using ConferencesManagement.Common;
using Models;
using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class TicketController : Controller
    {
        // GET: Ticket
        public ActionResult Index()
        {
            return View();
        }


        [HttpGet]
        [ChildActionOnly]
        public ActionResult TickerPlan()
        {

            var price = (new LoaiVeDao()).ListAll((int)CommonConstants.CURRENT_HOITHAO);
            return PartialView(price);
        }


        [ChildActionOnly]
        public ActionResult ThongKeHoiThao()
        {

            var numTopic = (new ChuDeDao()).ListByGroupId((int)CommonConstants.CURRENT_HOITHAO).Count();
            var numSpeaker = (new HoiThaoDetailDao()).GetListSpeakerJoinHoiThao((int)CommonConstants.CURRENT_HOITHAO);
            var numSchedule = (new ScheduleDao()).GetScheduleByCurrentHoiThao((int)CommonConstants.CURRENT_HOITHAO).Count();
            ViewBag.Topic = numTopic;
            ViewBag.Speaker = numSpeaker;
            ViewBag.Schedule = numSchedule;
            return PartialView();
        }


        [HttpGet]
        public ActionResult Payment()
        {
            var model = (new HoiNghiDao()).GetActiveHoiThao();
 
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
            var ac = (new AccountDao()).GetUserByID(session.IdAccount);
            ViewBag.UserName = ac.HoTen;
            ViewBag.HoiThao = model;
            
            return View();
        }

        [ChildActionOnly]
        public ActionResult HoiThao()
        {
            var model = (new HoiNghiDao()).GetActiveHoiThao();
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
          
            return PartialView(model);

        }

        [HttpPost]
        public ActionResult Payment(int ID)
        {
          
            var session = (ConferencesManagement.Common.UserLogin)Session[ConferencesManagement.Common.CommonConstants.USER_SESSION];
            var ticket = new Ve();
            ticket.IDAccount = (int)session.IdAccount;
            ticket.IDLoaiVe = ID;
            ticket.CreatedDate = DateTime.Now;
            ticket.CreatedBy = session.UserName;
            ticket.NgayMua = DateTime.Now;
            var dao = new VeDao();
            long id = dao.Insert(ticket);
            if (id > 0)
            {
                return RedirectToAction("Index", "UserProfileDetail");
            }
            else
            {
                ModelState.AddModelError("", "Thêm diễn giả không thành công");
            }
            return RedirectToAction("Payment");
        }

 
    }
}
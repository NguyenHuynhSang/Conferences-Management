using ConferencesManagement.Common;
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

    }
}
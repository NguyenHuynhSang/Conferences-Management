using Models.Framework;
using Models.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class ContactController : Controller
    {
        // GET: Contact
        public ActionResult Index()
        {
            var model = new ContactDao().GetActiveContact();
            
            return View(model);
        }

        [HttpPost]
     
        public JsonResult Send(string name,string email,string tieude,string content)
        {
            var feedback = new FeedBack();
            feedback.Name = name;
            feedback.Email = email;
            feedback.TieuDe = tieude;
            feedback.Content = content;
            feedback.CreatedDate = DateTime.Now;
            feedback.Status = true;
            var id=new ContactDao().InsertFeedBack(feedback);
            if (id>0)
            {
                return Json(new
                {
                    status = true
                });
                
            }   
            else
            {
                return Json(new
                {
                    status = false
                });
            }
        }


    }
}
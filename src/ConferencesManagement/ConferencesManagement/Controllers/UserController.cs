﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ConferencesManagement.Controllers
{
    public class UserController : Controller
    {
        // GET: User

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
    }
}
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferencesManagement.Common
{
    [Serializable]
    public class UserLogin
    {
        public long IdAccount { get; set; }
        public string UserName { get; set; }
    }
}
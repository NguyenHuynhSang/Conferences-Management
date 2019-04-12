using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferencesManagement.Areas.Admin.Code
{
    //***************không dùng sesion nữa
    public class SessionHelper
    {
        public static void setSession(UserSession session)
        {
            HttpContext.Current.Session["loginSection"] = session;  
        }

        public static UserSession GetSession()
        {

            var section = HttpContext.Current.Session["loginSection"];
            if (section==null)
            {
                return null;
            }
            else
            {
                return section as UserSession;
            }
        }
    }
}
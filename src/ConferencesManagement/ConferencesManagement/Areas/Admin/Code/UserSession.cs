using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ConferencesManagement.Areas.Admin.Code
{
    //***************không dùng sesion nữa
    // tuần tự hóa ra nhị phân lưu thông tin sesstion
    [Serializable]
    public class UserSession
    {
        public string UserName { set; get; }

    }
}
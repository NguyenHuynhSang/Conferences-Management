using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ConferencesManagement.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required]  // bắt buộc phải có
        public string UserName { set; get; }
        public string PassWord { set; get; }
        public bool RememberMe { set; get; }
        
    }
}
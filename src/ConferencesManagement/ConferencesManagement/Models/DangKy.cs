using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ConferencesManagement.Models
{
    public class DangKy
    {
        [Key]
        public long IDAccount { get; set; }
        [Display(Name = "Tên đăng nhập" )]
        [Required(ErrorMessage ="vui lóng nhập tên đăng nhập")]
        public string UserName { get; set; }
        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "vui lóng nhập mật khẩu")]
        public string PassWord { get; set; }
        [Display(Name = "Nhập lại mật khẩu")]
        [Compare("Password",ErrorMessage ="Xác nhận mật khẩu không đúng")]
        public string ComfirmPassword { get; set; }
        [Required(ErrorMessage = "vui lóng nhập họ tên")]
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        [Required(ErrorMessage = "vui lóng nhập địa chỉ")]
        [Display(Name = "Địa chỉ")]
        public string DiaChi { get; set; }
        [Required(ErrorMessage = "vui lóng nhập email")]
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Required(ErrorMessage = "vui lóng nhập số điện thoại")]
        [Display(Name = "Số điện thoại")]
        public string SDT { get; set; }



    }
}
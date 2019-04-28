namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Account")]
    public partial class Account
    {
        [Key]
        public long IdAccount { get; set; }

        [Required(ErrorMessage ="Tên tài khoản không được để trống")]
        [DisplayName("Tên tài khoản")]
        [StringLength(50,ErrorMessage ="Tên tài khoản không vượt quá 50 ký tự"), MinLength(6, ErrorMessage = "Độ dài tối thiểu 6 ký tự")]
        public string UserName { get; set; }

        [Required]
        [DisplayName("Mật khẩu")]
        [StringLength(50)]
        public string PassWord { get; set; }

        [StringLength(20), MinLength(6, ErrorMessage = "Độ dài tối thiểu 6 ký tự")]
        public string SDT { get; set; }

        [StringLength(50)]
        [DisplayName("Họ tên")]
        public string HoTen { get; set; }

        [StringLength(250)]
        [DisplayName("Địa chỉ")]
        public string DiaChi { get; set; }

        [StringLength(50)]
        [EmailAddress]
        public string Email { get; set; }

        public int TypeAccount { get; set; }

        public bool? IsDelete { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeyWords { get; set; }

        [StringLength(50)]
        public string MetaDescriptions { get; set; }

        public bool? Status { get; set; }
    }
}

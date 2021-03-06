﻿namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoiThao")]
    public partial class HoiThao
    {
        public int ID { get; set; }

        [Required]
        [StringLength(500)]
        [DisplayName("Tên Hội thảo")]
        [MinLength(6, ErrorMessage = "Tên hội thảo ít nhất là 6 ký tự")]
        public string TenHoiThao { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        [Required]
        [DisplayName("Ngày bắt đầu")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime NgayDienRa { get; set; }


        [Required]
        [DisplayName("Ngày kết thúc")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime NgayKetThuc { get; set; }



        [DisplayName("Trạng thái tổ chức")]
        public string TrangThaiToChuc   { get; set; }

        [StringLength(250)]
        [Required]
        [DisplayName("Nơi diễn ra")]
        public string NoiDienRa { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        [Required]
        [DisplayName("Hiển thị")]
        public bool Status { get; set; }
    }
}
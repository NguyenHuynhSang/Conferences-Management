namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule")]
    public partial class Schedule
    {
        public long ID { get; set; }

        [DisplayName("Tên Hội thảo")]
        public long? IDHoiThao { get; set; }

        [Required]
        [DisplayName("Ngày diễn ra")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        public DateTime NgayDienRa { get; set; }

        [StringLength(500)]
        [DisplayName("Chi tiết")]
        public string ChiTiet { get; set; }
    }
}
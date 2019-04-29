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

        public long? IDHoiThao { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayName("Ngày lịch trình")]
        public DateTime? NgayDienRa { get; set; }

        [StringLength(500)]
        [DisplayName("Chi tiết")]
        public string ChiTiet { get; set; }
    }
}

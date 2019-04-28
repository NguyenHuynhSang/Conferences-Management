namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Schedule")]
    public partial class Schedule
    {
        public long ID { get; set; }

        public long? IDHoiThao { get; set; }

        public DateTime? NgayDienRa { get; set; }

        [StringLength(500)]
        public string ChiTiet { get; set; }
    }
}

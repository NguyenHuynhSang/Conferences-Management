namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoiThao")]
    public partial class HoiThao
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string TenHoiThao { get; set; }

        public DateTime? NgayDienRa { get; set; }

        [StringLength(50)]
        public string NoiDienRa { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }
    }
}

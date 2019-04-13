namespace Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class News
    {
        [Key]
        public int IDNews { get; set; }

        [Required]
        [StringLength(50)]
        public string ChuDe { get; set; }

        [Required]
        [StringLength(50)]
        public string Noidung { get; set; }

        public int IdHoiThao { get; set; }

        public virtual HoiThao HoiThao { get; set; }
    }
}

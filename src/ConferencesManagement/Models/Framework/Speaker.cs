namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Speaker")]
    public partial class Speaker
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string ChucVu { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string SDT { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }
    }
}

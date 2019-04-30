namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("FeedBack")]
    public partial class FeedBack
    {
        public DateTime? CreatedDate { get; set; }

        public int ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(250)]
        public string TieuDe { get; set; }

        public bool? Status { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }
    }
}

namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Blog")]
    public partial class Blog
    {
        public int ID { get; set; }

        [StringLength(10)]
        public string IDBlogCategory { get; set; }

        [StringLength(250)]
        public string Title { get; set; }

        [StringLength(250)]
        public string ShotDescription { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        public int? IDSpeaker { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }
    }
}

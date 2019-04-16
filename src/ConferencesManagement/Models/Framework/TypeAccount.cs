namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TypeAccount")]
    public partial class TypeAccount
    {
        [Key]
        public int IdTypeAccount { get; set; }

        [Required]
        [StringLength(250)]
        public string TypeName { get; set; }

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

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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Speaker()
        {
            Topics = new HashSet<Topic>();
        }

        [Key]
        public int IdSpeaker { get; set; }

        [Required]
        [StringLength(50)]
        public string SpeakerName { get; set; }

        [Column("ChucVu(DanhTieng)")]
        [Required]
        [StringLength(50)]
        public string ChucVu_DanhTieng_ { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [Required]
        [StringLength(50)]
        public string SDT { get; set; }

        [StringLength(50)]
        public string Images { get; set; }

        [Column(TypeName = "xml")]
        public string MoreImages { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Topic> Topics { get; set; }
    }
}

namespace Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Topic")]
    public partial class Topic
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Topic()
        {
            Event_Schedule_ = new HashSet<Event_Schedule_>();
        }

        [Key]
        public int IdTopic { get; set; }

        public int IdHoiThao { get; set; }

        [Required]
        [StringLength(50)]
        public string ChuDe { get; set; }

        [Required]
        public string NoiDung { get; set; }

        public int IdSpeaker { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Event_Schedule_> Event_Schedule_ { get; set; }

        public virtual HoiThao HoiThao { get; set; }

        public virtual Speaker Speaker { get; set; }
    }
}

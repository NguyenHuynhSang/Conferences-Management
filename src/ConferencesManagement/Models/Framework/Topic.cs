namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Topic")]
    public partial class Topic
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        public long IDTopic { get; set; }

        [StringLength(50)]
        [DisplayName("Topic Menu")]
        public string TopicMenu { get; set; }

        [StringLength(50)]
        [DisplayName("Chủ đề")]
        public string ChuDe { get; set; }

        [Column(TypeName = "ntext")]
        [DisplayName("Nội dung")]
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

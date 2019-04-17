namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TopicDetail")]
    public partial class TopicDetail
    {
        public int ID { get; set; }

        public int? IDTopic { get; set; }

        [StringLength(10)]
        public string ChuDe { get; set; }

        [StringLength(250)]
        public string Content { get; set; }
    }
}

namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ScheduleDetail")]
    public partial class ScheduleDetail
    {
        public long ID { get; set; }

        public long? IDSchedule { get; set; }

        [StringLength(250)]
        public string TieuDe { get; set; }

        [Column(TypeName = "ntext")]
        public string Content { get; set; }

        [StringLength(250)]
        public string IDSpeaker { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        public TimeSpan? StartHour { get; set; }

        public TimeSpan? EndHour { get; set; }
    }
}

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

        public int? IDSchedule { get; set; }

        [StringLength(50)]
        public string ChuDe { get; set; }

        public TimeSpan? StartHour { get; set; }

        public TimeSpan? EndHour { get; set; }

        public int? IDSpeaker { get; set; }
    }
}

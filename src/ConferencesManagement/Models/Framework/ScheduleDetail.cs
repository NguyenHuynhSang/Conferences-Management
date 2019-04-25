namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
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

        public int IDSpeaker { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [DisplayName("Giờ bắt đầu")]
        [DataType(DataType.Time)]
        public TimeSpan? StartHour { get; set; }


        [DisplayName("Giờ kết thúc")]
        [DataType(DataType.Time)]
        public TimeSpan? EndHour { get; set; }
    }
}

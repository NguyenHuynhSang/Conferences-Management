namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Event(Schedule)")]
    public partial class Event_Schedule_
    {
        [Key]
        public int IdEvent { get; set; }

        public int IdTopic { get; set; }

        public DateTime ThoiGianBatDau { get; set; }

        public DateTime ThoiGianKetThuc { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayDienRa { get; set; }

        public virtual Topic Topic { get; set; }
    }
}

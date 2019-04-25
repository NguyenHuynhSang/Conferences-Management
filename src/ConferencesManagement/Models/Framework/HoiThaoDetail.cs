namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoiThaoDetail")]
    public partial class HoiThaoDetail
    {
        public long ID { get; set; }

        public long IDHoiThao { get; set; }

        public int IDSpeaker { get; set; }
    }
}

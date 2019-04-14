namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ticket")]
    public partial class Ticket
    {
        [Key]
        public int IDTicket { get; set; }

        public int IDAccount { get; set; }

        public int IDHoiThao { get; set; }

        public virtual Account Account { get; set; }

        public virtual HoiThao HoiThao { get; set; }
    }
}

namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThongTinUser")]
    public partial class ThongTinUser
    {
        [Key]
        [Column(Order = 0)]
        public int IdThongTin { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IdAccount { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(50)]
        [DisplayName("Họ Tên")]
        public string HoTen { get; set; }

        [Key]
        [Column(Order = 3)]
        [DisplayName("Ngày sinh")]
        public DateTime NgaySinh { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(50)]
        [DisplayName("Số Điện Thoại")]
        public string SDT { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(50)]
        public string Email { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(50)]
        [DisplayName("Địa chỉ")]
        public string DiaChi { get; set; }

        public virtual Account Account { get; set; }
    }
}

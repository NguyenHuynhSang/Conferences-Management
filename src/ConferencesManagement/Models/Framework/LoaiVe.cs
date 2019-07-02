namespace Models.Framework
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiVe")]
    public partial class LoaiVe
    {
        public int ID { get; set; }

        [DisplayName("Tên Hội thảo")]
        public int? IDHoiThao { get; set; }
        [StringLength(50)]
        [DisplayName("Tên Loại vé")]
        public string Name { get; set; }

        [DataType(DataType.Currency)]
        [DisplayName("Đơn giá")]
        public double? DonGia { get; set; }

        [StringLength(250)]
        public string content { get; set; }

        [StringLength(50)]
        public string ModifiedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool? Status { get; set; }
    }
}

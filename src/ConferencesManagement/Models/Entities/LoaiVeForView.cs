using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
    public class LoaiVeForView
    {
        public int ID { get; set; }
        public int? IDHoiThao { get; set; }
     
        public string TenHoiThao { set; get; }
        public string Name { get; set; }


        public double? DonGia { get; set; }

     
        public string content { get; set; }
        public DateTime? CreatedDate { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public string ModifiedBy { get; set; }
    }
}

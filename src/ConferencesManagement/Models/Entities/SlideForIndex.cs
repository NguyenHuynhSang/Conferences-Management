using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
        public class SlideForIndex
    {
        public int ID { get; set; }
        public int IDHoiThao { set; get; }
        public string TenHoiThao { set; get; }
        public string Image { get; set; }

        public string Content { get; set; }

        public DateTime? NgayDienRa { get; set; }

        public string NoiDienRa { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }


    }
}

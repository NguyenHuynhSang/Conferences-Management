using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
   public class TopicForIndex
    {
        public int ID { get; set; }
        public string Image { get; set; }
        public string TenHoiThao { get; set; }
        public int IDHoiThao { get; set; }
        public string TopicMenu { get; set; }

        public string ChuDe { get; set; }

        public string Content { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public string ModifiedBy { get; set; }

        public bool? Status { get; set; }
    }
}

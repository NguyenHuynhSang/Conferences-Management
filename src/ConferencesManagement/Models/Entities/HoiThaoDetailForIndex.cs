using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
    public class HoiThaoDetailForIndex
    {
        public long ID { set; get; }
        public long IDHoiThao { set; get; }
        public string TenHoiThao { set; get; }
        public string TenSpeaker { set; get; }
        public string ChucVu { get; set; }


        public string Email { get; set; }

        public string SDT { get; set; }
    }
}

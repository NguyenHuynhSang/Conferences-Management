using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
    public class ScheduleForIndex
    {
        public long ID { set; get; }
        public string TenHoiThao { set; get; }
        public DateTime? NgayDienRa { set; get; }

        public string ChiTiet { set; get; }
    }
}

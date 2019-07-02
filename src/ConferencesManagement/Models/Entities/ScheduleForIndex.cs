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
        public int IDHoiThao { get; set; }
        public string TenHoiThao { set; get; }
        public DateTime NgayLichTrinh { set; get; }
        public DateTime NgayDienRa { get; set; }
        public DateTime NgayKetThuc { get; set; }
        public string ChiTiet { set; get; }
    }
}

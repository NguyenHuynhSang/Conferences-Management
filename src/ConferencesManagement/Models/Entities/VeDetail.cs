using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
    public class VeDetail
    {
        public long IdAccount { get; set; }
        public int IDHoiThao { get; set; }
        public string LoaiVe { get; set; }
        public double? DonGia { get; set; }
        public DateTime? NgayMua { get; set; }
        public DateTime NgayDienRa { get; set; }
        public string HoTen { get; set; }
        public string TenHoiThao { get; set; }
        public string UserName { get; set; }
        public bool Status { get; set; }
        public string SDT { get; set; }
        public string Email { get; set; }
        public string NoiDienRa { get; set; }
    }
}

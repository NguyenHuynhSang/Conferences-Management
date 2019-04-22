using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class HoiNghiDao
    {
        ConferencesManagementDbContext db = null;
        public HoiNghiDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public HoiThao GetActiveHoiThao()
        {

            return db.HoiThaos.Single(x => x.Status == true);
        }


        public List<HoiThao> GetHoiThaos()
        {
            return db.HoiThaos.ToList();


        }
    }
}

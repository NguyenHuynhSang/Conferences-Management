using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class HoiThaoDetailDao
    {
        ConferencesManagementDbContext db = null;
        public HoiThaoDetailDao()
        {
            db = new ConferencesManagementDbContext();
        }
        public List<HoiThaoDetail> ListByGroupId(long group = 1)
        {
            return db.HoiThaoDetails.Where(x => x.IDHoiThao == group).ToList();

        }







    }
  
    
}

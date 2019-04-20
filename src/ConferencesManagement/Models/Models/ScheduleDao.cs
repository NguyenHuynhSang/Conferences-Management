using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class ScheduleDao
    {

        ConferencesManagementDbContext db = null;
        public ScheduleDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public List<Schedule> GetScheduleByCurrentHoiThao(long curentHoiThao=1)
        {
            return db.Schedules.Where(x => x.IDHoiThao == curentHoiThao).ToList();

        }




    }
}

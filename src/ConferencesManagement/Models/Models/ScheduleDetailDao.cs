using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class ScheduleDetailDao
    {
        private ConferencesManagementDbContext context = null;
        public ScheduleDetailDao()
        {
            context = new ConferencesManagementDbContext();
        }

        public List<ScheduleDetail> ListAll()
        {
            return context.ScheduleDetails.ToList();
        }

    }
}

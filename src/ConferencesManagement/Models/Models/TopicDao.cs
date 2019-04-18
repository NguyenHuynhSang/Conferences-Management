using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class TopicDao
    {
        ConferencesManagementDbContext db = null;
        public TopicDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public List<Topic> ListByGroupId(long group=1)
        {
            return db.Topics.Where(x => x.IDTopic == group).ToList();

        }
    }
}

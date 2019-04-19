using Models.Framework;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class FeedBackDao
    {
        ConferencesManagementDbContext db = null;
        public FeedBackDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public FeedBack FindByID(int id)
        {
            return db.FeedBacks.SingleOrDefault(x => x.ID == id);

        }
        public IEnumerable<FeedBack> ListAllPaging(int page, int pageSize)
        {
            return db.FeedBacks.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }
    }
}

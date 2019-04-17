
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;


namespace Models
{
    public class SpeakerDao
    {
            ConferencesManagementDbContext db = null;
            public SpeakerDao()
            {
                db = new ConferencesManagementDbContext();
            }

            public long Insert(Speaker entity)
            {
                db.Speakers.Add(entity);
                db.SaveChanges();
                return entity.ID;
            }

            public Speaker GetByName(string Name)
            {
                return db.Speakers.SingleOrDefault(x => x.Name == Name);
            }

            public IEnumerable<Speaker> ListAllPaging(int page, int pageSize)
            {
                return db.Speakers.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
            }


    }
}


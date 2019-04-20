
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
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

        public long Insert(Topic entity)
        {
            db.Topics.Add(entity);
            db.SaveChanges();
            return entity.ID;

        }
        public IEnumerable<Topic> ListAllPaging(int page, int pageSize)
        {
            return db.Topics.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        
         }



        public bool Update(Topic entity)
        {
            try
            {
                var account = db.Topics.Find(entity.ID);
                account.ChuDe = entity.ChuDe;
                account.Content = entity.Content;
                account.Status = entity.Status;
                account.TopicMenu = entity.TopicMenu;
                account.ModifiedBy = entity.ModifiedBy;
                account.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Topic TopicDetail(int ID)
        {
            return db.Topics.Find(ID);
        }

        public bool Delete(int id)
        {
            try
            {
                var topic = db.Topics.Find(id);
                db.Topics.Remove(topic);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
  
}

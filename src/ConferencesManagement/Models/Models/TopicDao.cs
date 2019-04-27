
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using Models.Entities;

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
            entity.CreatedDate = DateTime.Now;
            db.Topics.Add(entity);
            db.SaveChanges();
            return entity.ID;

        }
        public IEnumerable<Topic> ListAllPaging(int page, int pageSize)
        {
            return db.Topics.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        
         }

        public IEnumerable<TopicForIndex> GetTopicForIndex(int page, int pageSize, string searchingString=null)
        {
            var model = from a in db.Topics
                        join ht in db.HoiThaos
                        on a.IDTopic equals ht.ID
                        select new TopicForIndex()
                        {
                            ID = a.ID,
                            Image=a.Image,
                            TenHoiThao = ht.TenHoiThao,
                            TopicMenu = a.TopicMenu,
                            ChuDe = a.ChuDe,
                            Content = a.Content,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedDate = a.ModifiedDate,
                            ModifiedBy = a.ModifiedBy,
                            Status=a.Status
                        };
              
            
            if (!string.IsNullOrEmpty(searchingString))
            {
                model = model.Where(x => x.TenHoiThao.Contains(searchingString) || x.ChuDe.Contains(searchingString) || x.Content.Contains(searchingString) || x.TopicMenu.Contains(searchingString)).OrderByDescending(x => x.CreatedDate);

            }
            return model.OrderByDescending(x => x.TenHoiThao).ThenBy(x=>x.CreatedDate).ToPagedList(page, pageSize);
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

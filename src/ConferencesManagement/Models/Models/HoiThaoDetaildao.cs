using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using Models.Entities;

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

        public long Insert(HoiThaoDetail entity)
        {
            db.HoiThaoDetails.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        
        public  List<HoiThaoDetailForIndex> GetHTDetailForIndex()
        {
            var model = from d in db.HoiThaoDetails
                        join h in db.HoiThaos
                        on d.IDHoiThao equals h.ID
                        join s in db.Speakers
                        on d.IDSpeaker equals s.ID
                        select new HoiThaoDetailForIndex
                        {
                            ID=d.ID,
                            TenHoiThao=h.TenHoiThao,
                            TenSpeaker=s.Name

                        };
            return model.ToList();


        }



        public IEnumerable<HoiThaoDetail> ListAllPaging(int page, int pageSize)
        {
            return db.HoiThaoDetails.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public bool Delete(int id)
        {
            try
            {
                var speaker = db.HoiThaoDetails.Find(id);
                db.HoiThaoDetails.Remove(speaker);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Update(HoiThaoDetail entity)
        {
            try
            {
                var hoithao = db.HoiThaoDetails.Find(entity.ID);

                //   account.ModifiedBy =USER_SEASON;
                hoithao.IDHoiThao = entity.IDHoiThao;
                hoithao.IDSpeaker = entity.IDSpeaker;

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

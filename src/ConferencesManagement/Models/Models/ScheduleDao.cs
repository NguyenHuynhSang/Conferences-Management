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

        public IEnumerable<Schedule> ListAllPaging(int page, int pageSize)
        {
            return db.Schedules.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public long Insert(Schedule entity)
        {
            db.Schedules.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }


        public List<ScheduleForIndex> GetScheduleForIndex()
        {
            var model = from d in db.Schedules
                        join h in db.HoiThaos
                        on d.IDHoiThao equals h.ID
                        select new ScheduleForIndex
                        {
                            ID = d.ID,
                            TenHoiThao = h.TenHoiThao,
                            NgayDienRa = d.NgayDienRa

                        };
            return model.ToList();
        }

        public bool Update(Schedule entity)
        {
            try
            {
                var schedule = db.Schedules.Find(entity.ID);

                //   account.ModifiedBy =USER_SEASON;
                schedule.IDHoiThao = entity.IDHoiThao;
                schedule.NgayDienRa = entity.NgayDienRa;

                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Delete(int id)
        {
            try
            {
                var speaker = db.Schedules.Find(id);
                db.Schedules.Remove(speaker);
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

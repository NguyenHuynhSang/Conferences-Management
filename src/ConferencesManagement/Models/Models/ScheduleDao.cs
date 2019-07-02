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

        public List<Schedule> GetScheduleByCurrentHoiThao(long curentHoiThao = 1)
        {
            return db.Schedules.Where(x => x.IDHoiThao == curentHoiThao).OrderBy(x=>x.NgayDienRa).ToList();

        }

        public IEnumerable<Schedule> ListAllPaging(int page, int pageSize)
        {
            return db.Schedules.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public long Insert(Schedule entity)
        {
            entity.ChiTiet = db.HoiThaos.SingleOrDefault(x=>x.ID==entity.IDHoiThao).TenHoiThao+entity.NgayDienRa.ToString(string.Format("dd/MMM/yyyy"));
            db.Schedules.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }


        public List<ScheduleForIndex> GetScheduleForIndex(int? IDHoiThao=null)
        {
            var model = from d in db.Schedules
                        join h in db.HoiThaos
                        on d.IDHoiThao equals h.ID
                        select new ScheduleForIndex
                        {
                            ID = d.ID,
                            TenHoiThao = h.TenHoiThao,
                            NgayLichTrinh = d.NgayDienRa,
                            NgayDienRa=h.NgayDienRa,
                            NgayKetThuc=h.NgayKetThuc,
                            ChiTiet = d.ChiTiet,
                            IDHoiThao=h.ID
                        };
            if (IDHoiThao!=null)
            {
                model = model.Where(x => x.IDHoiThao== IDHoiThao);

            }
            return model.OrderBy(x=>x.TenHoiThao).ThenBy(x=>x.NgayLichTrinh).ToList();
        }

        public List<Schedule> GetDSLichTrinhByIDHoiThao(long id)
        {
            return db.Schedules.Where(x => x.IDHoiThao == id).ToList();
        }
        public bool Update(Schedule entity)
        {
            try
            {
                entity.ChiTiet = db.HoiThaos.SingleOrDefault(x => x.ID == entity.IDHoiThao).TenHoiThao + entity.NgayDienRa.ToString(string.Format("dd/MMM/yyyy"));
                var schedule = db.Schedules.Find(entity.ID);
                //   account.ModifiedBy =USER_SEASON;
                schedule.IDHoiThao = entity.IDHoiThao;
                schedule.NgayDienRa = entity.NgayDienRa;
                schedule.ChiTiet = entity.ChiTiet;
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

        public Schedule Detail(int id)
        {
            return db.Schedules.Find(id);
        }

    }

}

using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Models.Models
{
    public class HoiNghiDao
    {
        ConferencesManagementDbContext db = null;
        public HoiNghiDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public IEnumerable<HoiThao> ListAllPaging(int page, int pageSize, string searchingString = null)
        {
            IOrderedQueryable<HoiThao> hoiThao = db.HoiThaos;
            if (!string.IsNullOrEmpty(searchingString))
            {
                hoiThao = hoiThao.Where(x => x.TenHoiThao.Contains(searchingString)||x.NoiDienRa.Contains(searchingString)).OrderByDescending(x => x.CreatedDate);

            }

            return hoiThao.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }



        public IEnumerable<HoiThao> ListAllPagingforindex()
        {
            return db.HoiThaos.Where(x=>x.Status==true).ToList();
        }

        public HoiThao GetActiveHoiThao()
        {
            return db.HoiThaos.Single(x => x.Status == true);
        }


        public List<HoiThao> GetHoiThaos()
        {
            return db.HoiThaos.ToList();


        }

        public long Insert(HoiThao entity)
        {
            entity.CreatedDate = DateTime.Now;

            db.HoiThaos.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }
        public List<HoiThao> ListAll()
        {
            return db.HoiThaos.ToList();
        }
        public bool Update(HoiThao entity)
        {
            try
            {
                var hoinghi = db.HoiThaos.Find(entity.ID);
                hoinghi.TenHoiThao = entity.TenHoiThao;
                hoinghi.Content = entity.Content;
                hoinghi.NgayDienRa = entity.NgayDienRa;
                hoinghi.NoiDienRa = entity.NoiDienRa;
                hoinghi.Status = entity.Status;
                hoinghi.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }


        public HoiThao HoiThaoDetail(int id)
        {
            return db.HoiThaos.Find(id);
        }
    }
}

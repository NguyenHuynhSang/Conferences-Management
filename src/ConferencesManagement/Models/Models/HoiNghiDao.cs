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

        public IEnumerable<HoiThao> ListAllPaging(int page, int pageSize, string tenHoiThao = null,string NoiDienRa=null,string NgayDienRa=null)
        {
            IOrderedQueryable<HoiThao> hoiThao = db.HoiThaos;
            if (!string.IsNullOrEmpty(tenHoiThao))
            {
                hoiThao = hoiThao.Where(x => x.TenHoiThao.Contains(tenHoiThao)).OrderByDescending(x => x.CreatedDate);
            }

            if (!string.IsNullOrEmpty(NoiDienRa))
            {
                hoiThao = hoiThao.Where(x => x.NoiDienRa.Contains(NoiDienRa)).OrderByDescending(x => x.CreatedDate);
            }

            if (!string.IsNullOrEmpty(NgayDienRa))
            {
                hoiThao = hoiThao.Where(x => x.NgayDienRa.ToString().Contains(NgayDienRa)).OrderByDescending(x => x.CreatedDate);
            }


            return hoiThao.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }



        public IEnumerable<HoiThao> ListAllPagingforindex()
        {
            return db.HoiThaos.Where(x=>x.Status==true).ToList();
        }



        public HoiThao GetActiveHoiThao()
        {
            var current=db.HoiThaos.FirstOrDefault(x => x.Status == true);
            if (current == null) return db.HoiThaos.FirstOrDefault(x => x.ID == 1);
            return current;
        }


        public List<HoiThao> GetHoiThaos()
        {
            return db.HoiThaos.ToList();


        }

        public long Insert(HoiThao entity)
        {
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
            
                hoinghi.ModifiedBy = entity.ModifiedBy;
                hoinghi.ModifiedDate = entity.ModifiedDate;
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

        public bool ChangeStatus(long id)
        {
            var ht = db.HoiThaos.Find(id);
            ht.Status = true;
            foreach (var item in db.HoiThaos)
            {
                if (item.ID != ht.ID)
                {
                    item.Status = false;
                }
            }
            db.SaveChanges();
            return ht.Status;
        }


    }
}

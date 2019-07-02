using Models.Entities;
using Models.Framework;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class LoaiVeDao
    {
        ConferencesManagementDbContext db = null;
        public LoaiVeDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public LoaiVe LoaiVeDetail(int ID)
        {
            return db.LoaiVes.Find(ID);
        }

        public List<LoaiVe> ListAll(int IDHoiThao)
        {
            return db.LoaiVes.Where(x => x.IDHoiThao == IDHoiThao).OrderBy(x => x.DonGia).ToList();
        }
        public long Insert(LoaiVe entity)
        {

            db.LoaiVes.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }





        public bool Update(LoaiVe entity)
        {
            try
            {
                var loaiVe = db.LoaiVes.Find(entity.ID);
                loaiVe.Name = entity.Name;
                loaiVe.DonGia = entity.DonGia;
                loaiVe.content = entity.content;
                loaiVe.ModifiedBy = entity.ModifiedBy;
                loaiVe.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IEnumerable<LoaiVeForView> ListAllPaging(int page, int pageSize,int? IDHoiThao=null, string tenLoaiVe=null)
        {
   
            var list = from lve in db.LoaiVes
                       join ht in db.HoiThaos
                       on lve.IDHoiThao equals ht.ID
                       select new LoaiVeForView
                       {
                           ID = lve.ID,
                           DonGia = lve.DonGia,
                           content = lve.content,
                           IDHoiThao = lve.IDHoiThao,
                           Name = lve.Name,
                           TenHoiThao = ht.TenHoiThao,
                           CreatedDate=lve.CreatedDate,
                           CreatedBy=lve.CreatedBy,
                           ModifiedBy=lve.ModifiedBy,
                           ModifiedDate=lve.ModifiedDate,
                       };
            if (IDHoiThao != null)
            {
                list = list.Where(x => x.IDHoiThao == IDHoiThao);
                if (!string.IsNullOrEmpty(tenLoaiVe))
                {
                    list = list.Where(x => x.Name.Contains(tenLoaiVe));
                }
            }
            if (!string.IsNullOrEmpty(tenLoaiVe))
            {
                list = list.Where(x => x.Name.Contains(tenLoaiVe));
            }
            return list.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public List<LoaiVe> ListTop5()
        {
            IOrderedQueryable<LoaiVe> account = db.LoaiVes;
            return account.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
        }
        public bool Delete(int id)
        {
            try
            {
                var loaiVe = db.LoaiVes.Find(id);
                db.LoaiVes.Remove(loaiVe);
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

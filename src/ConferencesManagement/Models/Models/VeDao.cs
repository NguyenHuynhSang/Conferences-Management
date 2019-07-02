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
    public class VeDao
    {
        ConferencesManagementDbContext db = null;
        public VeDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public long Insert(Ve entity)
        {

            db.Ves.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public VeDetail GetVeDetail(long IDAccount)
        {
            var model = from v in db.Ves
                        join lve in db.LoaiVes
                        on (int)v.IDLoaiVe equals lve.ID
                        join ht in db.HoiThaos
                        on (int)lve.IDHoiThao equals ht.ID
                        join ac in db.Accounts
                        on v.IDAccount equals ac.IdAccount
                        select new VeDetail
                        {
                            IDHoiThao = ht.ID,
                            DonGia = lve.DonGia,
                            HoTen = ac.HoTen,
                            UserName = ac.UserName,
                            NgayDienRa = ht.NgayDienRa,
                            TenHoiThao = ht.TenHoiThao,
                            LoaiVe = lve.Name,
                            NgayMua = v.NgayMua,
                            Status = ht.Status,
                            IdAccount = ac.IdAccount,
                            NoiDienRa=ht.NoiDienRa
                        };

                return model.Where(x=>x.Status==true).FirstOrDefault(x=>x.IdAccount == IDAccount);
        }

    }
}

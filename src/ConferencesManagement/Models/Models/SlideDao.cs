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
   public class SlideDao
    {
        ConferencesManagementDbContext db = null;
        public SlideDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public Slide SlideDetail(int ID)
        {
            return db.Slides.Find(ID);
        }
        public long Insert(Slide entity)
        {
            entity.CreatedDate = DateTime.Now;
            db.Slides.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public IEnumerable<SlideForIndex> ListAllPaging(int page, int pageSize, string searchingString = null)
        {

            var slide = from a in db.Slides
                        join b in db.HoiThaos
                        on a.IDHoiThao equals b.ID
                        select new SlideForIndex
                        {
                            ID=a.ID,
                            TenHoiThao = b.TenHoiThao,
                            Image = a.Image,
                            IDHoiThao=b.ID,
                            Content=b.Content,
                            NgayDienRa=b.NgayDienRa,
                            NoiDienRa=b.NoiDienRa,
                            CreatedDate=a.CreatedDate,
                            CreatedBy=a.CreatedBy,
                            ModifiedBy=a.ModifiedBy,
                            ModifiedDate=a.ModifiedDate,
                            Status=b.Status
                            
                        };

            if (!string.IsNullOrEmpty(searchingString))
            {
                slide = slide.Where(x => x.IDHoiThao.Equals(searchingString)).OrderByDescending(x => x.CreatedDate);

            }
            return (slide.OrderByDescending(x => x.CreatedDate)).ToPagedList(page, pageSize);
        }

        public List<SlideForIndex> GetCurrentSlideOfHoiThao(int currentHoiThao)
        {
            var slide = from a in db.Slides
                        join b in db.HoiThaos
                   
                        on a.IDHoiThao equals b.ID 
                        select new SlideForIndex
                        {
                            ID = a.ID,
                            TenHoiThao = b.TenHoiThao,
                            Image = a.Image,
                            IDHoiThao = b.ID,
                            Content = b.Content,
                            NgayDienRa = b.NgayDienRa,
                            NoiDienRa = b.NoiDienRa,
                            CreatedDate = a.CreatedDate,
                            CreatedBy = a.CreatedBy,
                            ModifiedBy = a.ModifiedBy,
                            ModifiedDate = a.ModifiedDate,
                            Status = b.Status

                        };
            return (slide.Where(x => x.IDHoiThao.Equals(currentHoiThao)).OrderByDescending(x => x.CreatedDate)).ToList();


        }




        public bool Update(Slide entity)
        {
            try
            {
                var slide = db.Slides.Find(entity.ID);
                slide.IDHoiThao = entity.IDHoiThao;
                slide.Image = entity.Image;
                slide.ModifiedBy = entity.ModifiedBy;
                slide.ModifiedDate = DateTime.Now;
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
                var slide = db.Slides.Find(id);
                db.Slides.Remove(slide);
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

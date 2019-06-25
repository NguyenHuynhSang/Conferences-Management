using Models.Framework;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class BlogDao
    {
        ConferencesManagementDbContext db = null;
        public BlogDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public Blog BlogDetail(int ID)
        {
            return db.Blogs.Find(ID);
        }
        public long Insert(Blog entity)
        {
 
            db.Blogs.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

    



        public bool Update(Blog entity)
        {
            try
            {
                var blog = db.Blogs.Find(entity.ID);
                blog.IDBlogCategory = entity.IDBlogCategory;
                blog.Image = entity.Image;
                blog.ModifiedBy = entity.ModifiedBy;
                blog.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public IEnumerable<Blog> ListAllPaging(int page, int pageSize)
        {
            IOrderedQueryable<Blog> account = db.Blogs;
            return account.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public List<Blog> ListTop5()
        {
            IOrderedQueryable<Blog> account = db.Blogs;
            return account.OrderByDescending(x => x.CreatedDate).Take(5).ToList();
        }
        public bool Delete(int id)
        {
            try
            {
                var blog = db.Blogs.Find(id);
                db.Blogs.Remove(blog);
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

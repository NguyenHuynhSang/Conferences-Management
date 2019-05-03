using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
namespace Models.Models
{
    public class ContactDao
    {

        ConferencesManagementDbContext db = null;
        public ContactDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public Contact GetActiveContact()
        {
            return db.Contacts.Single(x => x.Status == true);

        }


        public IEnumerable<Contact> ListAllPaging(int page, int pageSize, string searchingString = null)
        {
            IOrderedQueryable<Contact> account = db.Contacts;
            if (!string.IsNullOrEmpty(searchingString))
            {
                account = account.Where(x => x.Content.Contains(searchingString) || x.DiaChi.Contains(searchingString) || x.SDT.Contains(searchingString) || x.Email.Contains(searchingString)).OrderByDescending(x => x.ID);

            }

            return account.OrderByDescending(x => x.ID).ToPagedList(page, pageSize);
        }

        public long Insert(Contact entity)
        {

            db.Contacts.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }


         public int InsertFeedBack(FeedBack fb)
        {
            db.FeedBacks.Add(fb);
            db.SaveChanges();
            return fb.ID;

        }


        public Contact contactDetail(int id)
        {
            return db.Contacts.Find(id);
        }

        public bool Update(Contact entity)
        {
            try
            {
                var account = db.Contacts.Find(entity.ID);
                account.Content = entity.Content;
                account.DiaChi = entity.DiaChi;
                account.Email = entity.Email;
                account.SDT = entity.SDT;
                account.Status = entity.Status;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var account = db.Contacts.Find(id);
                db.Contacts.Remove(account);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ChangeStatus(long id)
        {
            var ht = db.Contacts.Find(id);
            ht.Status = true;
            foreach (var item in db.Contacts)
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

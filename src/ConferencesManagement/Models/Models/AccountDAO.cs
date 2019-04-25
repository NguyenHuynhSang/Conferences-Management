
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace Models
{
    public class AccountDao
    {

        ConferencesManagementDbContext db = null;
        public AccountDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public long Insert(Account entity)
        {
            entity.CreatedDate = DateTime.Now;

            db.Accounts.Add(entity);
            db.SaveChanges();
            return entity.IdAccount;
        }



        public Account GetByName(string userName)
        {
            return db.Accounts.SingleOrDefault(x => x.UserName == userName);
        }

        public IEnumerable<Account> ListAllPaging( int page, int pageSize,string searchingString = null)
        {
            IOrderedQueryable<Account> account = db.Accounts;
            if (!string.IsNullOrEmpty(searchingString))
            {
                account=account.Where(x=>x.UserName.Contains(searchingString)||x.HoTen.Contains(searchingString)).OrderByDescending(x=>x.CreatedDate);

            }
            //return db.Accounts.OrderByDescending(x=>x.CreatedDate).ToPagedList(page, pageSize);
            return account.OrderByDescending(x=>x.CreatedDate).ToPagedList(page, pageSize);
        }


        

        public bool Update(Account entity)
        {
            try
            {
                var account = db.Accounts.Find(entity.IdAccount);
                account.UserName = entity.UserName;
                account.PassWord = entity.PassWord;
                account.Email = entity.Email;
                account.DiaChi = entity.DiaChi;
                account.SDT = entity.SDT;
                account.ModifiedDate = DateTime.Now;
             //   account.ModifiedBy =USER_SEASON;
                account.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public Account AccountDetail(int id)
        {
            return db.Accounts.Find(id);
        }

        public int Login (string userName,string passWord)
        {
            var result = db.Accounts.SingleOrDefault(x => x.UserName == userName);
            if (result==null)
            {
                return 0;

            }
            else 
            {
                if (result.PassWord == passWord) return 1;
                else return 2;
            }
         

        }

        public bool Delete(int id)
        {
            try
            {
                var account = db.Accounts.Find(id);
                db.Accounts.Remove(account);
                db.SaveChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
            }
        }

    }
}

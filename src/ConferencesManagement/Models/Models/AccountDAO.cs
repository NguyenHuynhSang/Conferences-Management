
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
        
            db.Accounts.Add(entity);
            db.SaveChanges();
            return entity.IdAccount;
        }



        public Account GetByName(string userName)
        {
            return db.Accounts.SingleOrDefault(x => x.UserName == userName);
        }

        public IEnumerable<Account> ListAllPaging( int page, int pageSize,string userName = null,string hoTen=null,string email=null)
        {
            IOrderedQueryable<Account> account = db.Accounts;
            if (!string.IsNullOrEmpty(userName))
            {
                account=account.Where(x=>x.UserName.Contains(userName)).OrderByDescending(x=>x.CreatedDate);

            }
            if (!string.IsNullOrEmpty(hoTen))
            {
                account = account.Where(x => x.HoTen.Contains(hoTen)).OrderByDescending(x => x.CreatedDate);

            }
            if (!string.IsNullOrEmpty(email))
            {
                account = account.Where(x => x.Email.Contains(email)).OrderByDescending(x => x.CreatedDate);
            }

            return account.OrderByDescending(x=>x.CreatedDate).ToPagedList(page, pageSize);
        }

        public bool Update(Account entity)
        {
            try
            {
                var account = db.Accounts.Find(entity.IdAccount);    
                account.PassWord = entity.PassWord;
                account.Email = entity.Email;
                account.HoTen = entity.HoTen;
                account.DiaChi = entity.DiaChi;
                account.SDT = entity.SDT;
                account.ModifiedBy = entity.ModifiedBy;
                account.ModifiedDate = entity.ModifiedDate;
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

        public Account GetUserByID(long id)
        {
            var result = db.Accounts.FirstOrDefault(x => x.IdAccount ==id);
            return result;
        }
        public int AdminLogin(string userName,string passWord)
        {
            var result = db.Accounts.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;

            }
            else
            {
                if (result.TypeAccount != 1) return 3;
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

        public bool checkemail(string email)
        {
            var account = db.Accounts.SingleOrDefault(x => x.Email == email);
            if (account == null)
                return false;
            else return true;
        }
    }
}

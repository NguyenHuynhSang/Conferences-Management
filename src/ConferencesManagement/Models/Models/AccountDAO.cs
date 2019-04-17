
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

        public IEnumerable<Account> ListAllPaging(int page, int pageSize)
        {
            return db.Accounts.OrderByDescending(x=>x.CreatedDate).ToPagedList(page, pageSize);
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

    }
}

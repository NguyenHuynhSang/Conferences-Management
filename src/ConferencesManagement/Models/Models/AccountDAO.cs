
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class AccountDao
    {

        ConferencesManagementDbContext db = null;
        public AccountDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public int Insert(Account entity)
        {
            db.Accounts.Add(entity);
            db.SaveChanges();
            return entity.IdAccount;
        }

        public Account GetByName(string userName)
        {
            return db.Accounts.SingleOrDefault(x => x.Username == userName);
        }
        public int Login (string userName,string passWord)
        {
            var result = db.Accounts.SingleOrDefault(x => x.Username == userName);
            if (result==null)
            {
                return 0;

            }
            else 
            {
                if (result.Password == passWord) return 1;
                else return 2;
            }
         

        }

    }
}


using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class AccountModel
    {

        ConferencesManagementDbContext db = null;
        public AccountModel()
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
        public bool Login (string userName,string passWord)
        {
            var result = db.Accounts.Count(x => x.Username == userName && x.Password == passWord);
            if (result > 0)
                return true;
            else return false;

        }

    }
}

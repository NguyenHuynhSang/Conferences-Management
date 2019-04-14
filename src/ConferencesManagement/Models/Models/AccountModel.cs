
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

        private ConferencesManagementDbContext context = null;
        public AccountModel()
        {
            context = new ConferencesManagementDbContext();
        }


        public bool Login(string userName, string passWord) {

            object[] sqlPara= new SqlParameter[] {
                new SqlParameter("@UserName", userName),
                new SqlParameter("@PassWord", passWord),
            };

            var res = context.Database.SqlQuery<bool>("Sp_Account_Login @UserName,@PassWord", sqlPara).SingleOrDefault();
            return res;

      
        }

    }
}

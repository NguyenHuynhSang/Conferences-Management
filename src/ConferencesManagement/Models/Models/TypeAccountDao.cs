using Models.Framework;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class TypeAccountDao
    {
        private ConferencesManagementDbContext context = null;
        public TypeAccountDao()
        {
            context = new ConferencesManagementDbContext();
        }

        public List<TypeAccount> ListAll()
        {
            return context.TypeAccounts.ToList();
        }




       

        public int Create(string name,int? id) {

            object[] para = new object[]{
                new SqlParameter("@ID",id),
                new SqlParameter("@Name", name)
        };


            int res = context.Database.ExecuteSqlCommand("Sp_TypeAccount_Insert @ID,@Name", para);
            return res;


        }



    }
}

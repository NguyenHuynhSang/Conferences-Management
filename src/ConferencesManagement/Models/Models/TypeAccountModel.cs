using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class TypeAccountModel
    {
        private ConferencesManagementDbContext context = null;
        public TypeAccountModel()
        {
            context = new ConferencesManagementDbContext();
        }

        public List<TypeAccount> ListAll()
        {
            var list = context.Database.SqlQuery<TypeAccount>("SP_TypeAccount_ListAll").ToList();
            return list;
        }


    }
}

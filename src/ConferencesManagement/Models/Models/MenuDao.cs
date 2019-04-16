using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class MenuDao
    {
        ConferencesManagementDbContext db = null;
        public MenuDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public List<Menu> ListByGroupId(int group) {
            return db.Menus.Where(x => x.TypeID == group).ToList();

        }


    }
}

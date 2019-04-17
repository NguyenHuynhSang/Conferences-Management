using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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

    }
}

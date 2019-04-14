using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class UserInfoModel
    {
        private ConferencesManagementDbContext context = null;
        public UserInfoModel()
        {
            context = new ConferencesManagementDbContext();
        }

        /// <summary>
        /// trả về danh sách thông tin user
        /// </summary>
        /// <returns></returns>
        public List<ThongTinUser> ListAll()
        {
            var list = context.Database.SqlQuery<ThongTinUser>("SP_UserInfo_ListAll").ToList();
            return list;
        }

    }
}

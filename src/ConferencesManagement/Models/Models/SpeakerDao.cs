
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
    public class SpeakerDao
    {
        ConferencesManagementDbContext db = null;
        public SpeakerDao()
        {
            db = new ConferencesManagementDbContext();
        }

        public long Insert(Speaker entity)
        {
            db.Speakers.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public Speaker GetByName(string Name)
        {
            return db.Speakers.SingleOrDefault(x => x.Name == Name);
        }

        public IEnumerable<Speaker> ListAllPaging(int page, int pageSize)
        {
            return db.Speakers.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }


        public bool Update(Speaker entity)
        {
            try
            {
                var account = db.Speakers.Find(entity.ID);
                account.Name = entity.Name;
                account.ChucVu = entity.ChucVu;
                account.Email = entity.Email;
                account.SDT = entity.SDT;
                account.Status = entity.Status;
                account.ModifiedBy = entity.ModifiedBy;
                account.ModifiedDate = DateTime.Now;
                db.SaveChanges();
                return true;
            }
            catch (Exception )
            {
                return false;
            }
        }

        public Speaker SpeakerDetail(int ID)
        {
            return db.Speakers.Find(ID);
        }
        public List<Speaker> GetSpeakersJoinConference(long currentConference = 1)
        {

            var model = from d in db.HoiThaoDetails
                        join h in db.HoiThaos
                        on d.IDHoiThao equals h.ID
                        where h.ID == currentConference
                        join s in db.Speakers
                        on d.IDSpeaker equals s.ID
                        select s;
                      
            return model.ToList();
                       
        }

        public bool Delete(int id)
        {
            try
            {
                var speaker = db.Speakers.Find(id);
                db.Speakers.Remove(speaker);
                db.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}


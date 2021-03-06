﻿
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
            entity.CreatedDate = DateTime.Now;

            db.Speakers.Add(entity);
            db.SaveChanges();
            return entity.ID;
        }

        public Speaker GetByName(string Name)
        {
           
            return db.Speakers.SingleOrDefault(x => x.Name == Name);
        }

        public IEnumerable<Speaker> ListAllPaging(int page, int pageSize, string HoTen = null,string SoDienThoai=null,string Email=null)
        {
            IOrderedQueryable<Speaker> speaker = db.Speakers;
            if (!string.IsNullOrEmpty(HoTen))
            {
                speaker = speaker.Where(x => x.Name.Contains(HoTen)).OrderByDescending(x => x.CreatedDate);

            }
            if (!string.IsNullOrEmpty(SoDienThoai))
            {
                speaker = speaker.Where(x => x.SDT.Contains(SoDienThoai)).OrderByDescending(x => x.CreatedDate);

            }
            if (!string.IsNullOrEmpty(Email))
            {
                speaker = speaker.Where(x => x.Email.Contains(Email)).OrderByDescending(x => x.CreatedDate);

            }
            return speaker.OrderByDescending(x => x.CreatedDate).ToPagedList(page, pageSize);
        }

        public List<Speaker> ListAll()
        {
            var ds = db.Speakers.ToList();
            var dsDaThanhgia = db.ScheduleDetails.ToList();
            foreach(var item in ds)
            {
                foreach(var child in dsDaThanhgia)
                {
                    if (item.ID == child.ID) ds.Remove(item);
                }
            }

            return db.Speakers.ToList();
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


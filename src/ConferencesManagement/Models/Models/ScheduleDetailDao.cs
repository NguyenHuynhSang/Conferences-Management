using Models.Entities;
using Models.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Models
{
    public class ScheduleDetailDao
    {
        private ConferencesManagementDbContext context = null;
        public ScheduleDetailDao()
        {
            context = new ConferencesManagementDbContext();
        }

        public List<ScheduleDetail> ListAll()
        {
            return context.ScheduleDetails.ToList();
        }

        public List<ScheduleDetailForIndex> GetScheduleDetailForIndex(string searchingString = null)
        {
            var model = from d in context.ScheduleDetails
                        join h in context.Speakers
                        on d.IDSpeaker equals h.ID
                        select new ScheduleDetailForIndex
                        {
                            ID = d.ID,
                            IDSchedule = d.IDSchedule,
                            TieuDe = d.TieuDe,
                            Content = d.Content,
                            SpeakerName = h.Name,
                            Image = d.Image,
                            StartHour = d.StartHour,
                            EndHour = d.EndHour
                        };
            if (!string.IsNullOrEmpty(searchingString))
            {
                model = model.Where(x => x.TieuDe.Contains(searchingString)|| x.SpeakerName.Contains(searchingString) || x.Content.Contains(searchingString));

            }
            return model.ToList();
        }

        public long Insert(ScheduleDetail entity)
        {
            context.ScheduleDetails.Add(entity);
            context.SaveChanges();
            return entity.ID;
        }

        public bool Update(ScheduleDetail entity)
        {
            try
            {
                var schedule = context.ScheduleDetails.Find(entity.ID);

                //   account.ModifiedBy =USER_SEASON;
                schedule.IDSchedule = entity.IDSchedule;
                schedule.TieuDe = entity.TieuDe;
                schedule.IDSpeaker = entity.IDSpeaker;
                schedule.Content = entity.Content;
                schedule.Image = entity.Image;
                schedule.StartHour = entity.StartHour;
                schedule.EndHour = entity.EndHour;

                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var speaker = context.ScheduleDetails.Find(id);
                context.ScheduleDetails.Remove(speaker);
                context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
        public ScheduleDetail Detail(int id)
        {
            return context.ScheduleDetails.Find(id);
        }
    }
}

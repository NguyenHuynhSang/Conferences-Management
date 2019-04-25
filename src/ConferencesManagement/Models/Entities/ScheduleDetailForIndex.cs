using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models.Entities
{
    public class ScheduleDetailForIndex
    {
        public long ID { get; set; }
        public long? IDSchedule { get; set; }
        public string TieuDe { get; set; }
        public string Content { get; set; }
        public string SpeakerName { get; set; }
        public string Image { get; set; }
        public TimeSpan? StartHour { get; set; }
        public TimeSpan? EndHour { get; set; }
    }
}

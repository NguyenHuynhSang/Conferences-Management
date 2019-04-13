namespace Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ConferencesManagementDbContext : DbContext
    {
        public ConferencesManagementDbContext()
            : base("name=ConferencesManagementDbContext")
        {
        }

        public virtual DbSet<Account> Accounts { get; set; }
        public virtual DbSet<Event_Schedule_> Event_Schedule_ { get; set; }
        public virtual DbSet<HoiThao> HoiThaos { get; set; }
        public virtual DbSet<News> News { get; set; }
        public virtual DbSet<Speaker> Speakers { get; set; }
        public virtual DbSet<Ticket> Tickets { get; set; }
        public virtual DbSet<Topic> Topics { get; set; }
        public virtual DbSet<TypeAccount> TypeAccounts { get; set; }
        public virtual DbSet<ThongTinUser> ThongTinUsers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.ThongTinUsers)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Account>()
                .HasMany(e => e.Tickets)
                .WithRequired(e => e.Account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoiThao>()
                .HasMany(e => e.News)
                .WithRequired(e => e.HoiThao)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoiThao>()
                .HasMany(e => e.Tickets)
                .WithRequired(e => e.HoiThao)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HoiThao>()
                .HasMany(e => e.Topics)
                .WithRequired(e => e.HoiThao)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Speaker>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Speaker>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<Speaker>()
                .HasMany(e => e.Topics)
                .WithRequired(e => e.Speaker)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Topic>()
                .HasMany(e => e.Event_Schedule_)
                .WithRequired(e => e.Topic)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TypeAccount>()
                .Property(e => e.TypeName)
                .IsUnicode(false);

            modelBuilder.Entity<TypeAccount>()
                .HasMany(e => e.Accounts)
                .WithRequired(e => e.TypeAccount1)
                .HasForeignKey(e => e.TypeAccount)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ThongTinUser>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<ThongTinUser>()
                .Property(e => e.Email)
                .IsUnicode(false);
        }
    }
}

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UrunTakip_EntityFr
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class UrunDbEntities : DbContext
    {
        public UrunDbEntities()
            : base("name=UrunDbEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Kategori> Kategori { get; set; }
        public virtual DbSet<Musteri> Musteri { get; set; }
        public virtual DbSet<Satıs> Satıs { get; set; }
        public virtual DbSet<Urun> Urun { get; set; }
    
        public virtual ObjectResult<string> MarkaGetir()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("MarkaGetir");
        }
    }
}

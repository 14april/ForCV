using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace EStoreWeb.Models
{
    public class AplicationDBcontext : DbContext
    {

        public AplicationDBcontext(DbContextOptions<AplicationDBcontext> options) : base(options)
        {
           
        }
        //khia bao entitis
        public DbSet<Category> Categories { set; get; }

        //seed data
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>().HasData(
                new Category {Id =1, CategoryName="Dien Thoai", DisplayOrder=1},
                new Category { Id = 2, CategoryName = "Tablest", DisplayOrder = 2 },
                new Category { Id = 3, CategoryName = "Laptop", DisplayOrder = 3 },
                new Category { Id = 4, CategoryName = "Phu kien", DisplayOrder = 4 }
                );
        }
        


    }
}

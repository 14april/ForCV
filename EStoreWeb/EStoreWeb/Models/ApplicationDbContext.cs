using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
namespace EStoreWeb.Models
{
    public class ApplicationDbContext:IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options):base(options)
        {

        }
        public DbSet<Category> Categories { set; get; }
        public DbSet<Product> Products { set; get; }
        //Seed data
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Category>().HasData(
                new Category { Id=1,Name="Điện Thoại",DisplayOrder=1},
                new Category { Id = 2, Name = "Máy Tính Bảng", DisplayOrder = 2 },
                new Category { Id = 3, Name = "Phụ Kiện", DisplayOrder = 3 }
                );
            modelBuilder.Entity<Product>().HasData(
                new Product { Id = 1, Name = "Iphone 14 Pro", Price=900,CategoryId=1 },
                new Product { Id = 2, Name = "Iphone 13 Pro", Price = 700, CategoryId = 1 },
                new Product { Id = 3, Name = "Iphone 12 Pro", Price = 600, CategoryId = 1 },
                new Product { Id = 4, Name = "Gaming TUF ", Price = 2000, CategoryId = 2 },
                new Product { Id = 5, Name = "Chuột Gaming", Price = 500, CategoryId = 3 },
                new Product { Id = 6, Name = "Iphone 14 Pro", Price = 700, CategoryId = 1 },
                new Product { Id = 7, Name = "Iphone 11 Pro", Price = 600, CategoryId = 1 },
                new Product { Id = 8, Name = "Gaming TUF VIP ", Price = 2000, CategoryId = 2 },
                new Product { Id = 9, Name = "Chuột Gaming VIP", Price = 500, CategoryId = 3 },
                new Product { Id = 10, Name = "Tai nghe VIP", Price = 3000, CategoryId = 3 }
                );
        }
       

    }
}

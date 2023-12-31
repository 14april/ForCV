﻿// <auto-generated />
using EStoreWeb.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace EStoreWeb.Migrations
{
    [DbContext(typeof(AplicationDBcontext))]
    [Migration("20230819084720_SeedDataToTableCategory")]
    partial class SeedDataToTableCategory
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("ProductVersion", "5.0.17")
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("EStoreWeb.Models.Category", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int")
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("CategoryName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<int>("DisplayOrder")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.ToTable("Categories");

                    b.HasData(
                        new
                        {
                            Id = 1,
                            CategoryName = "Dien Thoai",
                            DisplayOrder = 1
                        },
                        new
                        {
                            Id = 2,
                            CategoryName = "Tablest",
                            DisplayOrder = 2
                        },
                        new
                        {
                            Id = 3,
                            CategoryName = "Laptop",
                            DisplayOrder = 3
                        },
                        new
                        {
                            Id = 4,
                            CategoryName = "Phu kien",
                            DisplayOrder = 4
                        });
                });
#pragma warning restore 612, 618
        }
    }
}

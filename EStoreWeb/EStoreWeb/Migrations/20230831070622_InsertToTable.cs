using Microsoft.EntityFrameworkCore.Migrations;

namespace EStoreWeb.Migrations
{
    public partial class InsertToTable : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "CategoryId", "Name", "Price" },
                values: new object[] { 1, "Iphone 14 Pro", 700.0 });

            migrationBuilder.InsertData(
                table: "Products",
                columns: new[] { "Id", "CategoryId", "Description", "ImageUrl", "Name", "Price" },
                values: new object[,]
                {
                    { 7, 1, null, null, "Iphone 11 Pro", 600.0 },
                    { 8, 2, null, null, "Gaming TUF VIP ", 2000.0 },
                    { 9, 3, null, null, "Chuột Gaming VIP", 500.0 },
                    { 10, 3, null, null, "Tai nghe VIP", 3000.0 }
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 7);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 8);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 9);

            migrationBuilder.DeleteData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 10);

            migrationBuilder.UpdateData(
                table: "Products",
                keyColumn: "Id",
                keyValue: 6,
                columns: new[] { "CategoryId", "Name", "Price" },
                values: new object[] { 3, "Tai nghe VIP", 3000.0 });
        }
    }
}

using EStoreWeb.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace EStoreWeb.Controllers
{
    [Area("Admin")]
    [Authorize(Roles =SD.Role_Admin)]
    public class ProductController : Controller
    {
        private readonly ApplicationDbContext db;
        private readonly IHostingEnvironment hostingEnvironment;
        public ProductController(ApplicationDbContext _db, IHostingEnvironment _host)
        {
            db = _db;
            hostingEnvironment = _host;
        }
        public IActionResult Index(int ?page)
        {
            int PageSize = 5;
            int PageIndex;
            if (page == null)
                PageIndex = 1;
            else
                PageIndex = (int)page;
            var lstProduct = db.Products.Include(x => x.Category).ToList();
            //Thống kê trang có thể có
            var PageSum = (lstProduct.Count() / PageSize) + (lstProduct.Count() % PageSize > 0 ? 1 : 0);
            //Truyền Pagesum qua view
            ViewBag.PageSum = PageSum;
            ViewBag.PageIndex = PageIndex;
            //Phân trang theo pageindex và pagesize
            return View(lstProduct.Skip((PageIndex - 1) * PageSize).Take(PageSize).ToList());
        }
        public IActionResult Create()
        {
            //Truyền danh sách thể loại choview để sinh ra điều khiển drodownlist
            ViewBag.category = db.Categories.Select(s => new SelectListItem { Value = s.Id.ToString(), Text = s.Name });
            return View();
        }
        [HttpPost]
        public IActionResult Create(Product pro,IFormFile file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    //Xử lý upload FileHinh
                    string tenFile = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);//Tạo tên file cần lưu dùng guid.NewGuid() để lấy file ngẫu nhiên 
                    string duongDan = Path.Combine(hostingEnvironment.WebRootPath, @"images/products");// lấy đường dẫn lưu trữ trên server
                    var filestream = new FileStream(Path.Combine(duongDan, tenFile), FileMode.Create);
                    file.CopyTo(filestream);//sao chép lên server
                    filestream.Close();
                    pro.ImageUrl = @"images/products/" + tenFile;
                }
                //Thêm ctgr vào table Categories
                db.Products.Add(pro);
                db.SaveChanges();
                TempData["success"] = "Đã Insert thành công";
                return RedirectToAction("Index");
            }
            return View();
        }
        //Action xử lý edit Category
        public IActionResult Edit(int id)
        {
            ViewBag.category = db.Categories.Select(s => new SelectListItem { Value = s.Id.ToString(), Text = s.Name });
            //Truy vấn category theo id
            var objCategory1 = db.Products.Find(id);
            if (objCategory1 == null)
                return NotFound();
            return View(objCategory1);
        }
        [HttpPost]
        public IActionResult Edit(Product obj, IFormFile file)
        {
            if (ModelState.IsValid)
            {
                if (file != null)
                {
                    //Xử lý upload FileHinh
                    string tenFile = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);//Tạo tên file cần lưu dùng guid.NewGuid() để lấy file ngẫu nhiên 
                    string duongDan = Path.Combine(hostingEnvironment.WebRootPath, @"images/products");// lấy đường dẫn lưu trữ trên server
                    var filestream = new FileStream(Path.Combine(duongDan, tenFile), FileMode.Create);
                    file.CopyTo(filestream);//sao chép lên server
                    filestream.Close();
                    //Kiểm tra hình cũ
                    if (!string.IsNullOrEmpty(obj.ImageUrl))
                    {
                        var oldfilepath = Path.Combine(hostingEnvironment.WebRootPath, obj.ImageUrl);
                        if (System.IO.File.Exists(oldfilepath))
                        {
                            System.IO.File.Delete(oldfilepath);
                        }
                    }
                    
                    obj.ImageUrl = @"images/products/" + tenFile;
                }
                //Cập nhật obj vào table categories
                db.Update<Product>(obj);
                // db.Entry<Category>(obj).state = microsoft.EntityFrameworkCore.EntityState.Modified
                db.SaveChanges();
                TempData["success"] = "Đã Update thành công";
                return RedirectToAction("Index");
            }
            return View();
        }
        //Action xử lý edit Category
        public IActionResult Delete(int id)
        {
            ViewBag.category = db.Categories.Select(s => new SelectListItem { Value = s.Id.ToString(), Text = s.Name });
            //Truy vấn category theo id
            var objCategory1 = db.Products.Find(id);
            if (objCategory1 == null)
                return NotFound();
            //Xóa
            return View(objCategory1);
        }
        [HttpPost, ActionName("Delete")]
        public IActionResult DeletePost(int id)
        {
            //truy van the loai theo id
            var obj = db.Products.Find(id);
            if (obj == null)
            {
                return NotFound();
            }
            //Kiểm tra hình cũ
            if (!string.IsNullOrEmpty(obj.ImageUrl))
            {
                var oldfilepath = Path.Combine(hostingEnvironment.WebRootPath, obj.ImageUrl);
                if (System.IO.File.Exists(oldfilepath))
                {
                    System.IO.File.Delete(oldfilepath);
                }
            }
            //xoá
            db.Products.Remove(obj);
            db.SaveChanges();
            TempData["success"] = "Category deleted success";
            return RedirectToAction("Index");
        }

    }
}

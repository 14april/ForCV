using EStoreWeb.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EStoreWeb.Controllers
{
    [Area("Admin")]
    [Authorize(Roles =SD.Role_Admin)]
    public class CategoryController : Controller
    {
        private readonly ApplicationDbContext db;
        public CategoryController(ApplicationDbContext _db)
        {
            db = _db;
        }
        public IActionResult Index()
        {
            var dsCategory = db.Categories.ToList();
            return View(dsCategory);
        }
        public IActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Create(Category ctgr)
        {
            if (ModelState.IsValid){
                //Thêm ctgr vào table Categories
                db.Categories.Add(ctgr);
                db.SaveChanges();
                TempData["success"] = "Đã Insert thành công";
                return RedirectToAction("Index");
            }
            return View();
        }
        //Action xử lý edit Category
        public IActionResult Edit(int id)
        {
            //Truy vấn category theo id
            var objCategory1 = db.Categories.Find(id);
            if(objCategory1 == null)
                return NotFound();         
            return View(objCategory1);
        }
        [HttpPost]
        public IActionResult Edit(Category obj)
        {
            if (ModelState.IsValid)
            {
                //Cập nhật obj vào table categories
                db.Update<Category>(obj);
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
            //Truy vấn category theo id
            var objCategory1 = db.Categories.Find(id);
            if (objCategory1 == null)
                return NotFound();
            //Xóa
            return View(objCategory1);
        }
        [HttpPost, ActionName("Delete")]
        public IActionResult DeletePost(int id)
        {
            //truy van the loai theo id
            var objCategory = db.Categories.Find(id);
            if (objCategory == null)
            {
                return NotFound();
            }
            //xoá
            db.Categories.Remove(objCategory);
            db.SaveChanges();
            TempData["success"] = "Category deleted success";
            return RedirectToAction("Index");
        }
    }
}

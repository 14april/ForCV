using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStoreWeb.Models;

namespace EStoreWeb.Controllers
{
    public class CategoryController : Controller
    {

        private readonly AplicationDBcontext db;
        public CategoryController(AplicationDBcontext _db)
        {
            db = _db;
        }

        //liet ke cac danh sach category 
        public IActionResult Index()
        {
            //query syntax
            //var dsCategory = (from x in db.Categories select x).ToList();

            var dsCategory = db.Categories.ToList();

            //var dsCategory = db.Categories.Where(w=> w.CategoryName.Contains("h")). ToList();
            return View(dsCategory);
        }

        public IActionResult Create()
        {
            
            return View();
        }
        //[HttpPost, ActionName("Create")]
        [HttpPost]
        public IActionResult Create(Category obj)
        {
            //kiem tra hop le du lieu nhap vao 
            if (ModelState.IsValid)
            {
                //them obj vao table Categories 
                db.Categories.Add(obj);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();

        }

        //action sua du lieu
        public IActionResult Edit(int id)
        {
            //truy van categories theo id
            var obj = db.Categories.Find(id);
            if (obj == null)
                return NotFound();
            //var obj2 = db.Categories.Single(x => x.Id == id);
            //var obj3 = db.Categories.Where(w => w.Id == id).SingleOrDefault();
            //tra ve view de edit
            return View(obj);
        }
        [HttpPost]

        public IActionResult Edit(Category obj)
        {
            //kiem tra hop le du lieu nhap vao 
            if (ModelState.IsValid)
            {
                //them obj vao table Categories 
                db.Update<Category>(obj);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        //action delete categiry
        public IActionResult Delete(int id)
        {
            //truy van categories theo id
            var obj = db.Categories.Find(id);
            if (obj == null)
                return NotFound();
            //var obj2 = db.Categories.Single(x => x.Id == id);
            //var obj3 = db.Categories.Where(w => w.Id == id).SingleOrDefault();
            //tra ve view de edit
            return View(obj);
        }
        [HttpPost, ActionName("Delete")]
        public IActionResult DeletePost(int id)
        {

            //truy van categories theo id
            var obj = db.Categories.Find(id);
            if (obj == null)
                return NotFound();
            //var obj2 = db.Categories.Single(x => x.Id == id);
            //var obj3 = db.Categories.Where(w => w.Id == id).SingleOrDefault();
            //tra ve view de edit
            
            db.Categories.Remove(obj);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}

using EStoreWeb.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace EStoreWeb.Controllers
{
    [Area("Customer")]
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ApplicationDbContext db;

        public HomeController(ILogger<HomeController> logger, ApplicationDbContext _db)
        {
            _logger = logger;
            db = _db;
        }

        public IActionResult Index(int ?page)
        {
            int PageSize = 5;
            int PageIndex;
            if (page == null)
                PageIndex = 1;
            else
                PageIndex = (int)page;
            var lstProduct = db.Products.ToList();
            //Thống kê trang có thể có
            var PageSum = (lstProduct.Count() / PageSize) + (lstProduct.Count() % PageSize > 0 ? 1 : 0);
            //Truyền Pagesum qua view
            ViewBag.PageSum = PageSum;
            ViewBag.PageIndex = PageIndex;
            //Phân trang theo pageindex và pagesize
            return View(lstProduct.Skip((PageIndex - 1) * PageSize).Take(PageSize).ToList());
        }

        public IActionResult Detail(int id)
        {
            var obj = db.Products.Find(id);
            var listobj = db.Products.Where(x => x.CategoryId == obj.CategoryId && x.Id != obj.Id).Take(6);
            ViewBag.list = listobj;
            if (obj == null)
            {
                return NotFound();
            }
            return View(obj);
        }

    }
}

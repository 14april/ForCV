using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanDienThoai.Models
{
    public class TaiKhoan
    {
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string DienThoai { get; set; }
        public string MatKhau { get; set; }
        public int IDQuyen { get; set; }
        public string DiaChi { get; set; }
    }
}
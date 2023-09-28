using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebBanDienThoai.Models;

namespace WebBanDienThoai
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TaiKhoan tk = (TaiKhoan)Session["USER"];
            if (tk == null || tk.IDQuyen != 2)
            {
                //Response.Redirect("DangNhap.aspx");
            }
            else
            {
                lbUserName.Text = "Tên đăng nhập:" + tk.Email;
            }
        }
    }
}
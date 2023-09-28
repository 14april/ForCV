using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanDienThoai.Admin
{
    public partial class ThemNSX : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] == null)
            {
                Response.Redirect("../DangNhap.aspx");
            }
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            dsnsx.InsertParameters["mansx"].DefaultValue = txtMaNSX.Text;
            dsnsx.InsertParameters["tennsx"].DefaultValue = txtTenNSX.Text;
            dsnsx.InsertParameters["diachi"].DefaultValue = txtdiachi.Text;
            dsnsx.InsertParameters["dienthoai"].DefaultValue = txtsdt.Text;
            if (dsnsx.Insert() > 0)
                lbThongBao.Text = "Bạn đã thêm thành công";
            else
                lbThongBao.Text = "Bạn đã thêm thất bại.Nhập lại nhé!";
            txtMaNSX.Text = "";
            txtTenNSX.Text = "";
            txtdiachi.Text = "";
            txtsdt.Text = "";
            txtMaNSX.Focus();
        }
    }
}
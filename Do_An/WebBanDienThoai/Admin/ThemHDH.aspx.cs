using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanDienThoai.Admin
{
    public partial class ThemHDH : System.Web.UI.Page
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
            dshdh.InsertParameters["mahdh"].DefaultValue = txtMaHDH.Text;
            dshdh.InsertParameters["tenhdh"].DefaultValue = txtTenHDH.Text;
            if (dshdh.Insert() > 0)
                lbThongBao.Text = "Bạn đã thêm thành công";
            else
                lbThongBao.Text = "Bạn đã thêm thất bại.Nhập lại nhé!";
            txtMaHDH.Text = "";
            txtTenHDH.Text = "";
            txtMaHDH.Focus();
        }
    }
}
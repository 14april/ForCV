using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanDienThoai
{
    public partial class ThemDT : System.Web.UI.Page
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
            dsdt.InsertParameters["madt"].DefaultValue = txtmadt.Text;
            dsdt.InsertParameters["tendt"].DefaultValue = txtten.Text;
            if (FHinh.HasFile)
            {
                string path = Server.MapPath("~/Hinh") + "/" + FHinh.FileName;
                FHinh.SaveAs(path);
                dsdt.InsertParameters["hinh"].DefaultValue = FHinh.FileName;
            }
            else
            {
                dsdt.InsertParameters["tendt"].DefaultValue = "no_image.jpg";
            }
            dsdt.InsertParameters["mahdh"].DefaultValue = ddlhedieuhanh.SelectedValue;
            dsdt.InsertParameters["mansx"].DefaultValue = ddlnhasx.SelectedValue;
            dsdt.InsertParameters["ngaycapnhat"].DefaultValue = cldngaycapnhat.SelectedDate.ToString();
            dsdt.InsertParameters["soluotxem"].DefaultValue = "0";
            if (dsdt.Insert() > 0)
                lbThongbao.Text = "Bạn đã thêm thành công 1 sản phẩm";
            else
                lbThongbao.Text = "Bạn đã thêm thất bại. Thử lại nhé ";
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebBanDienThoai.Admin
{
    public partial class QTDienThoai : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] == null)
            {
                Response.Redirect("../DangNhap.aspx");
            }
        }

        protected void bttracuu_Click(object sender, EventArgs e)
        {
            dsdt.SelectCommand = "select * from dienthoai where TenDT like N'%" + txttendt.Text + "%'";
            gvdt.DataSourceID = "dsdt";
            gvdt.DataBind();
        }
    }
}
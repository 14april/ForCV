using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using WebBanDienThoai.Models;

namespace WebBanDienThoai
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int mansx = 1;
            if (Request.QueryString["mansx"] != null)
            {
                mansx = int.Parse(Request.QueryString["mansx"]);
            }
            // truy xuất CSDL để thống kê sản phẩm theo loại
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DienThoaiDBConnectionString"].ConnectionString);
            conn.Open();
            string sqlloai = "select NhaSX.MaNSX, TenNSX,COUNT(madt) as Dem from NhaSX left join DienThoai on NhaSX.MaNSX = DienThoai.MaNSX where NhaSX.MaNSX = @mansx group by NhaSX.MaNSX, TenNSX";
            SqlCommand cm = new SqlCommand(sqlloai, conn);
            cm.Parameters.AddWithValue("@mansx", mansx);
            SqlDataReader dr = cm.ExecuteReader();
            if (dr.Read())
            {
                lbNhaSX.Text = "Danh mục:" + " " + dr["TenNSX"].ToString() + " " + "có" + " " + dr["Dem"].ToString() + " " + "sản phẩm";
            }
            if (Session["USER"] == null)
            {
                Response.Redirect("DangNhap.aspx");
            }
            
        }

        protected void btAddTocart_Click(object sender, EventArgs e)
        {
            //Lấy mã sản phẩm từ người dùng chọn
            int layMaDT= int.Parse(((Button)sender).CommandArgument);
            //Thêm sản phẩm vào giỏ hàng (dùng lớp Cart,CartItem và đối tượng Session)
            Cart cart = (Cart)Session["CART"]; // Vào Session lấy ra giỏ hàng của người dùng
            if (cart == null)
            {
                cart = new Cart(); //Tạo giỏ hàng
                //Lưu vào Session
                Session["CART"] = cart;
            }
            //Thêm sản phẩm vào giỏ
            cart.Add(layMaDT);
            //Thông báo cho người dùng 
        }
    }
}
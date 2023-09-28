using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace WebBanDienThoai.Models
{
    public class Cart
    {
        private List<Cartitem> items;

        public Cart()
        {
            items = new List<Cartitem>();
        }
        //Phương thức trả về danh sách các sản phẩm trong giỏ
        public List<Cartitem> Items { get { return items; } }
        //Phương thức thêm sản phẩm vào giỏ
        public void Add(int masp)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DienThoaiDBConnectionString"].ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from dienthoai where madt=@madt", conn);
            cmd.Parameters.AddWithValue("@madt", masp);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                //Tạo đối tượng cartitem
                Cartitem sp = new Cartitem();
                sp.MaSP = masp;
                sp.TenSP = dr["Tendt"].ToString();
                sp.Hinh = dr["Hinh"].ToString();
                sp.DonGia = int.Parse(dr["DonGia"].ToString());
                sp.SoLuong = 1;
                //Thêm vào giỏ (đề nghị sinh viên tự lập trình cho trường hợp sản phẩm đã có trong giỏ
                items.Add(sp);
            }
        }
        //Phương thúc cập nhật số lượng
        public void Update(int masp, int soluong)
        {
            for (int i = 0; i < items.Count; i++)
            {
                if (items[i].MaSP == masp)
                {
                    if (soluong > 0)
                        items[i].SoLuong = soluong;
                    else
                        items.RemoveAt(i);
                    break;

                }

            }
        }
        //Phương thức xóa sản phẩm <Khỏi giỏ>
        public void Delete(int masp)
        {
            for (int i = 0; i < items.Count; i++)
            {
                if (items[i].MaSP == masp)
                {
                    items.RemoveAt(i);
                    break;
                }

            }
        }
        //Tính tổng thành tiền
        public int TongTien
        {
            get
            {
                int tong = 0;
                foreach (Cartitem item in items)
                {
                    tong += item.ThanhTien;
                }
                return tong;
            }
        }
    }
}

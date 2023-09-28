/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import dao.NhanVienDAO;
import dao.PhongDAO;
import dto.NhanVien;
import dto.Phong;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/NhanVienServlet"})
public class NhanVienServlet extends HttpServlet {

    NhanVienDAO dao = new NhanVienDAO();
    PhongDAO phongdao = new PhongDAO();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("btAction");
	
        if (action == null) {
            List<NhanVien> kq = dao.getAll();
            request.setAttribute("listNhanVien", kq);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } else if (action.equals("delete")) {
            int manv = Integer.parseInt(request.getParameter("manv"));
            dao.delete(manv);
            List<NhanVien> kq = dao.getAll();
            request.setAttribute("listNhanVien", kq);
            request.getRequestDispatcher("list.jsp").forward(request, response);
        } else if (action.equals("add")) {
            request.setAttribute("listPhong", phongdao.getAll());
            request.getRequestDispatcher("add.jsp").forward(request, response);
        } else if (action.equals("save")) {
            //code
            String hoNV = request.getParameter("hoNV");
            String tenNV = request.getParameter("tenNV");
            Boolean phai = Boolean.parseBoolean(request.getParameter("phai"));
            int namSinh = Integer.parseInt(request.getParameter("namSinh"));
            String noiSinh = request.getParameter("noiSinh");
            int maPhong = Integer.parseInt(request.getParameter("maphong"));

            NhanVien nv = new NhanVien();
            nv.setHoNV(hoNV);
            nv.setTenNV(tenNV);
            nv.setPhai(phai);
            nv.setNamSinh(namSinh);
            nv.setNoiSinh(noiSinh);

            Phong phong = phongdao.find(maPhong);
            nv.setMaPhong(phong);

            dao.insert(nv);
            List<NhanVien> kq = dao.getAll();
            request.setAttribute("listNhanVien", kq);
            request.getRequestDispatcher("list.jsp").forward(request, response);

        } else if (action.equals("edit")) {
            int manv = Integer.parseInt(request.getParameter("manv"));
            request.setAttribute("nv", dao.find(manv));
            request.setAttribute("listPhong", phongdao.getAll());
            request.getRequestDispatcher("edit.jsp").forward(request, response);
        } else if (action.equals("update")) {
            String manvParam = request.getParameter("manv");

            // Kiểm tra xem manvParam có khác null và không rỗng
            if (manvParam != null && !manvParam.isEmpty()) {
                try {
                    int manv = Integer.parseInt(manvParam);

                    // Truy vấn và lấy đối tượng nhân viên từ cơ sở dữ liệu bằng mã nhân viên
                    NhanVien nv = dao.find(manv);

                    // Kiểm tra xem đối tượng nhân viên có tồn tại
                    if (nv != null) {
                        // Cập nhật thông tin của đối tượng nhân viên
                        nv.setHoNV(request.getParameter("hoNV"));
                        nv.setTenNV(request.getParameter("tenNV"));
                        nv.setPhai(Boolean.parseBoolean(request.getParameter("phai")));
                        nv.setNamSinh(Integer.parseInt(request.getParameter("namSinh")));
                        nv.setNoiSinh(request.getParameter("noiSinh"));

                        int maPhong = Integer.parseInt(request.getParameter("maphong"));
                        Phong phong = phongdao.find(maPhong);
                        nv.setMaPhong(phong);

                        // Gọi phương thức update từ DAO để cập nhật ttnv
                        dao.update(nv);
                    }

                    List<NhanVien> kq = dao.getAll();
                    request.setAttribute("listNhanVien", kq);
                    request.getRequestDispatcher("list.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    // Xử lý trường hợp khi giá trị không thể chuyển đổi thành số nguyên
                    // Ví dụ: Hiển thị thông báo lỗi cho người dùng
                    request.setAttribute("error", "Vui lòng nhập giá trị số hợp lệ!");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

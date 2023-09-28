/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.NhanVien;
import dto.Phong;
import java.util.List;
import javax.persistence.Query;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author Admin
 */
public class NhanVienDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("QLNhanSu_Unit");

    //phuong thuc doc du lieu
    public List<NhanVien> getAll() {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("NhanVien.findAll");

        return q.getResultList();
    }

    public List<NhanVien> searchName(String ten) {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("select n from NhanVien n where n.tenNV like : tenNV");
        q.setParameter("tenNV", "%" + ten + "%");

        return q.getResultList();
    }

    public NhanVien find(int manv) {
        EntityManager em = emf.createEntityManager();

        return em.find(NhanVien.class, manv);
    }

    public boolean insert(NhanVien nv) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(nv);
        em.getTransaction().commit();

        return true;
    }

    public boolean delete(int manv) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        NhanVien nv = em.find(NhanVien.class, manv);
        if (nv != null) {
            em.remove(nv);
        }
        em.getTransaction().commit();
        return true;
    }

    public boolean update(NhanVien nv) {
    EntityManager em = emf.createEntityManager();
    em.getTransaction().begin();

    try {
        // Kiểm tra xem đối tượng NhanVien có trong cơ sở dữ liệu hay không
        NhanVien existingNv = em.find(NhanVien.class, nv.getMaNV());

        if (existingNv != null) {
            // Cập nhật thông tin của đối tượng NhanVien có sẵn với thông tin từ đối tượng nv
            existingNv.setHoNV(nv.getHoNV());
            existingNv.setTenNV(nv.getTenNV());
            existingNv.setPhai(nv.getPhai());
            existingNv.setNamSinh(nv.getNamSinh());
            existingNv.setNoiSinh(nv.getNoiSinh());
            existingNv.setMaPhong(nv.getMaPhong()); // Nếu cần cập nhật maPhong

            // Gọi merge để cập nhật đối tượng trong cơ sở dữ liệu
            em.merge(existingNv);

            em.getTransaction().commit();
            return true; // Trả về true nếu cập nhật thành công
        }
    } catch (Exception e) {
        e.printStackTrace(); // Xử lý các ngoại lệ tại đây (nếu có)
        em.getTransaction().rollback();
    } 

    return false; // Trả về false nếu không tìm thấy hoặc có lỗi trong quá trình cập nhật
}

    public static void main(String[] args) {
        NhanVienDAO dao = new NhanVienDAO();
        System.out.println("Tat ca nhan vien");
        for (NhanVien x : dao.getAll()) {
            System.out.println(x.getTenNV() + " -" + x.getNamSinh());
        }
    }
}

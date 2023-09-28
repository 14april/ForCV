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
public class PhongDAO {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("QLNhanSu_Unit");

    //phuong thuc doc du lieu
    public List<Phong> getAll() {
        EntityManager em = emf.createEntityManager();
        Query q = em.createNamedQuery("Phong.findAll");

        return q.getResultList();
    }

    public Phong find(int maPhong) {
        EntityManager em = emf.createEntityManager();

        try {
            // Sử dụng EntityManager để tìm đối tượng Phong dựa trên mã phòng
            return em.find(Phong.class, maPhong);
        } finally {
            em.close();
        }
    }
}

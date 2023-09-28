/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Admin
 */
@Entity
@Table(catalog = "QLNhanVien", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Phong.findAll", query = "SELECT p FROM Phong p"),
    @NamedQuery(name = "Phong.findByMaPhong", query = "SELECT p FROM Phong p WHERE p.maPhong = :maPhong"),
    @NamedQuery(name = "Phong.findByTenPhong", query = "SELECT p FROM Phong p WHERE p.tenPhong = :tenPhong")})
public class Phong implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer maPhong;
    @Size(max = 50)
    private String tenPhong;
    @OneToMany(mappedBy = "maPhong")
    private List<NhanVien> nhanVienList;

    public Phong() {
    }

    public Phong(Integer maPhong) {
        this.maPhong = maPhong;
    }

    public Integer getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(Integer maPhong) {
        this.maPhong = maPhong;
    }

    public String getTenPhong() {
        return tenPhong;
    }

    public void setTenPhong(String tenPhong) {
        this.tenPhong = tenPhong;
    }

    @XmlTransient
    public List<NhanVien> getNhanVienList() {
        return nhanVienList;
    }

    public void setNhanVienList(List<NhanVien> nhanVienList) {
        this.nhanVienList = nhanVienList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (maPhong != null ? maPhong.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Phong)) {
            return false;
        }
        Phong other = (Phong) object;
        if ((this.maPhong == null && other.maPhong != null) || (this.maPhong != null && !this.maPhong.equals(other.maPhong))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.Phong[ maPhong=" + maPhong + " ]";
    }
    
}

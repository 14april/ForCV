/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Admin
 */
@Entity
@Table(catalog = "QLNhanVien", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "NhanVien.findAll", query = "SELECT n FROM NhanVien n"),
    @NamedQuery(name = "NhanVien.findByMaNV", query = "SELECT n FROM NhanVien n WHERE n.maNV = :maNV"),
    @NamedQuery(name = "NhanVien.findByHoNV", query = "SELECT n FROM NhanVien n WHERE n.hoNV = :hoNV"),
    @NamedQuery(name = "NhanVien.findByTenNV", query = "SELECT n FROM NhanVien n WHERE n.tenNV = :tenNV"),
    @NamedQuery(name = "NhanVien.findByPhai", query = "SELECT n FROM NhanVien n WHERE n.phai = :phai"),
    @NamedQuery(name = "NhanVien.findByNamSinh", query = "SELECT n FROM NhanVien n WHERE n.namSinh = :namSinh"),
    @NamedQuery(name = "NhanVien.findByNoiSinh", query = "SELECT n FROM NhanVien n WHERE n.noiSinh = :noiSinh")})
public class NhanVien implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    private Integer maNV;
    @Size(max = 30)
    private String hoNV;
    @Size(max = 20)
    private String tenNV;
    private Boolean phai;
    private Integer namSinh;
    @Size(max = 50)
    private String noiSinh;
    @JoinColumn(name = "MaPhong", referencedColumnName = "MaPhong")
    @ManyToOne
    private Phong maPhong;

    public NhanVien() {
    }

    public NhanVien(Integer maNV) {
        this.maNV = maNV;
    }

    public Integer getMaNV() {
        return maNV;
    }

    public void setMaNV(Integer maNV) {
        this.maNV = maNV;
    }

    public String getHoNV() {
        return hoNV;
    }

    public void setHoNV(String hoNV) {
        this.hoNV = hoNV;
    }

    public String getTenNV() {
        return tenNV;
    }

    public void setTenNV(String tenNV) {
        this.tenNV = tenNV;
    }

    public Boolean getPhai() {
        return phai;
    }

    public void setPhai(Boolean phai) {
        this.phai = phai;
    }

    public Integer getNamSinh() {
        return namSinh;
    }

    public void setNamSinh(Integer namSinh) {
        this.namSinh = namSinh;
    }

    public String getNoiSinh() {
        return noiSinh;
    }

    public void setNoiSinh(String noiSinh) {
        this.noiSinh = noiSinh;
    }

    public Phong getMaPhong() {
        return maPhong;
    }

    public void setMaPhong(Phong maPhong) {
        this.maPhong = maPhong;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (maNV != null ? maNV.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof NhanVien)) {
            return false;
        }
        NhanVien other = (NhanVien) object;
        if ((this.maNV == null && other.maNV != null) || (this.maNV != null && !this.maNV.equals(other.maNV))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "dto.NhanVien[ maNV=" + maNV + " ]";
    }

    public void setMaPhong(NhanVien phong) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}

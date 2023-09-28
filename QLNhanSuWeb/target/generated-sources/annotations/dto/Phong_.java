package dto;

import dto.NhanVien;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.10.v20211216-rNA", date="2023-09-22T16:33:08")
@StaticMetamodel(Phong.class)
public class Phong_ { 

    public static volatile SingularAttribute<Phong, String> tenPhong;
    public static volatile SingularAttribute<Phong, Integer> maPhong;
    public static volatile ListAttribute<Phong, NhanVien> nhanVienList;

}
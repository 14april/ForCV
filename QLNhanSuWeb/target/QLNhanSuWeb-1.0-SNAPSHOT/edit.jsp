<%-- 
    Document   : add
    Created on : Sep 15, 2023, 8:14:58 AM
    Author     : KHOACNTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!--nhung noi dung header.jsp-->
<jsp:include page="shared/header.jsp" />

<!--nhung noi dung nav.jsp-->
<jsp:include page="shared/nav.jsp" />

<div class="container" id="main-content">
    <div class="row justify-content-center">
        <form action="NhanVienServlet" style="min-width: 300px;" method="post">
            <h5 class="text-center">Add Employee</h5>
            <input type="hidden" value="${nv.maNV}" name="maNV" />
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input class="form-control" value="${nv.hoNV}" name="hoNV" type="text"  />
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input class="form-control" value="${nv.tenNV}" name="tenNV" type="text"  />
            </div>
            <div class="mb-3">
                <label class="form-label">Sex</label>
                <div>
                    <input class="form-check-input" type="radio" value="${nv.phai}" ${nv.phai == true ? "checked" : ""} name="phai" />  Male                       
                    <input class="form-check-input" type="radio" value="${nv.phai}" ${nv.phai == true ? "checked" : ""} name="phai"  />  Female                
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Year of birth</label>
                <input class="form-control" type="text" value="${nv.namSinh}" name="namSinh" placeholder="Year of birth..." />
            </div>
            <div class="mb-3">
                <label class="form-label">Place of birth</label>
                <input class="form-control" type="text" value="${nv.noiSinh}" name="noiSinh" placeholder="Place of birth..." />
            </div>

            <div class="mb-3">
                <label class="form-label">Department</label>
                <select class="form-control" name="maphong">
                    <c:forEach var="x" items="${listPhong}">
                        <option value="${x.maPhong}" ${x.maPhong == nv.maPhong.maPhong ? "selected":""}>${x.tenPhong}</option>
                    </c:forEach>

                </select>
            </div>

            <div class="mb-3">
                <button type="submit" class="btn btn-block btn-primary" name="btAction" value="update">
                    <i class="fa fa-save"></i> Save
                </button>
            </div>
        </form>
    </div>
</div>       

<!--nhung noi dung footer.jsp-->
<jsp:include page="shared/footer.jsp" />     
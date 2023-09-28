<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebBanDienThoai.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung" runat="server">
    <br />
    <div class="row">
        <div class="col-md-3">
            <div class="container">
                <ul class="list-group">
                    <li class="list-group-item active"><i class="fa fa-bars"></i> Danh mục điện thoại</li>
                    <asp:Repeater ID="rptmenu" runat="server" DataSourceID="dsnhasx">
                    <ItemTemplate>
                        <a href='<%# Eval("mansx","Default.aspx?mansx={0}") %>' class="list-group-item list-group-item-action">
                            <%# Eval("tennsx") %>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="col-md-9">
            <div id="demo" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="Hinh/banner_01.jpg" alt="Oppo" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="Hinh/banner_02.jpg" alt="Samsung" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="Hinh/banner_03.jpg" alt="Iphone" width="1100" height="500">
                    </div>
                </div>
                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
            <br />
            <%--Toan bo san pham--%>
            <div class="alert alert-info" style="padding-top:15px;font-weight:bold">
                <asp:Label ID="lbNhaSX" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="data_item row">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="dsdttheonhasx" >
                    <ItemTemplate>
                        <div class="item col-md-3 col-sm-6">
                            <div class="i">
                                <a href="#">
                                    <img style="height: 175px" src='<%# Eval("Hinh","Hinh/{0}") %>' />
                                </a>
                            </div>
                            <div class="t">
                                <asp:Label ID="lbTenDT" runat="server" Text='<%# Eval("TenDT") %>'></asp:Label>
                                <br />
                                Gia Ban:<asp:Label ID="lbDonGia" runat="server" CssClass="mau" Text='<%# Eval("DonGia","{0: #,##} đ") %>'></asp:Label>
                                <br />                                
                                <asp:Button ID="btAddTocart" CssClass="btn btn-warning" runat="server" Text="Thêm vào giỏ" 
                                    CommandArgument='<%# Eval("MaDT") %>' OnClick="btAddTocart_Click"
                                    />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="dsnhasx" runat="server"
        ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>"
        SelectCommand="SELECT * FROM [NhaSX]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsdttheonhasx" runat="server"
        ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>"
        SelectCommand="SELECT * FROM [DienThoai] WHERE ([MaNSX] = @MaNSX)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="mansx" DefaultValue="2" Name="MaNSX" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

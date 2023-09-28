<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TraCuu.aspx.cs" Inherits="WebBanDienThoai.TraCuu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung" runat="server">
    <br />
     <div class="form-inline" style="text-align:center;margin-bottom:20px">
         Đơn giá từ&nbsp;&nbsp; <asp:TextBox ID="txttu" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="cvGiatu" runat="server" ErrorMessage="Lỗi nhập đơn giá tra cứu (giá từ)" ControlToValidate="txttu" Type="Integer" Operator="DataTypeCheck">(*)</asp:CompareValidator>
          Đến&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtden" CssClass="form-control" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="cvGiaden" runat="server" ErrorMessage="Lỗi nhập đơn giá tra cứu (giá đến)" ControlToValidate="txtden" Type="Integer" Operator="DataTypeCheck">(*)</asp:CompareValidator>
        <asp:CompareValidator ID="cvsosanhGia" runat="server" ErrorMessage="Lỗi giá từ &lt;= giá đến" ControlToCompare="txttu" ControlToValidate="txtden" Operator="GreaterThan" Type="Integer">(*)</asp:CompareValidator>
        <asp:Button ID="bttracuu" runat="server" Text="Tìm kiếm" />
        <asp:ValidationSummary ID="vsloi" runat="server" style="background-color: #CC3300" />
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="data_item row">
                <asp:Repeater ID="Repeater2" runat="server" DataSourceID="dsdttheogia" >
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
                                Gia Ban:<asp:Label ID="lbDonGia" runat="server" CssClass="mau" Text='<%# Eval("DonGia","{0: #,##} dong") %>'></asp:Label>
                                <br />                                
                                <asp:Button ID="btAddTocart" CssClass="btn btn-info" runat="server" Text="Thêm vào giỏ"                          
                                    />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    
    <asp:SqlDataSource ID="dsdttheogia" runat="server" ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" SelectCommand="SELECT * FROM [DienThoai] WHERE (([DonGia] &gt;= @DonGia) AND ([DonGia] &lt;= @DonGia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txttu" Name="DonGia" PropertyName="Text" Type="Decimal" />
            <asp:ControlParameter ControlID="txtden" Name="DonGia2" PropertyName="Text" Type="Decimal" />
        </SelectParameters>
     </asp:SqlDataSource>
</asp:Content>

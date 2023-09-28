<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Layout2.Master" AutoEventWireup="true" CodeBehind="ThemDT.aspx.cs" Inherits="WebBanDienThoai.ThemDT" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung2" runat="server">
    <br />
    <table align="center" style="width: 600px;">
        <tr>
            <td style="text-align: justify">Danh Mục Điện Thoại</td>
            <td>
                <asp:DropDownList ID="ddlnhasx" runat="server" 
                    DataSourceID="dsnhasx" DataTextField="TenNSX" 
                    DataValueField="MaNSX" Width="278px"></asp:DropDownList></td>
        </tr>
        <tr>
            <td style="height: 29px; text-align: justify;">Hệ Điều Hành</td>
            <td style="height: 29px">
                <asp:DropDownList ID="ddlhedieuhanh" Width="278px" runat="server" DataSourceID="dshedieuhanh" DataTextField="TenHDH" DataValueField="MaHDH">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="text-align: justify">Mã Điện Thoại</td>
            <td>
                <asp:TextBox ID="txtmadt" runat="server" Width="278px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="text-align: justify">Tên Điện Thoại</td>
            <td>
                <asp:TextBox ID="txtten" runat="server" Width="278px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: justify">Đơn Giá</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="278px"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="text-align: justify">Ngày cập nhật</td>
            <td>
                <asp:Calendar ID="cldngaycapnhat" runat="server"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td style="text-align: justify">Hình</td>
            <td>
                <asp:FileUpload ID="FHinh" runat="server" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btThem_Click" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Label ID="lbThongbao" runat="server" Text="" style="color: #FF0000"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:SqlDataSource ID="dsnhasx" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" 
                    SelectCommand="SELECT * FROM [NhaSX] "></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="dshedieuhanh" runat="server" ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" SelectCommand="SELECT * FROM [HeDieuHanh]"></asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="dsdt" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" 
                    DeleteCommand="DELETE FROM [DienThoai] WHERE [MaDT] = @MaDT" 
                    InsertCommand="INSERT INTO [DienThoai] ([MaDT], [TenDT], [MaHDH], [MaNSX], [DonGia], [Hinh], [NgayCapNhat], [SoLuotXem]) VALUES (@MaDT, @TenDT, @MaHDH, @MaNSX, @DonGia, @Hinh, @NgayCapNhat, @SoLuotXem)" SelectCommand="SELECT * FROM [DienThoai]" UpdateCommand="UPDATE [DienThoai] SET [TenDT] = @TenDT, [MaHDH] = @MaHDH, [MaNSX] = @MaNSX, [DonGia] = @DonGia, [Hinh] = @Hinh, [NgayCapNhat] = @NgayCapNhat, [SoLuotXem] = @SoLuotXem WHERE [MaDT] = @MaDT">
                    <DeleteParameters>
                        <asp:Parameter Name="MaDT" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="MaDT" Type="Int32" />
                        <asp:Parameter Name="TenDT" Type="String" />
                        <asp:Parameter Name="MaHDH" Type="Int32" />
                        <asp:Parameter Name="MaNSX" Type="Int32" />
                        <asp:Parameter Name="DonGia" Type="Decimal" />
                        <asp:Parameter Name="Hinh" Type="String" />
                        <asp:Parameter Name="NgayCapNhat" Type="DateTime" />
                        <asp:Parameter Name="SoLuotXem" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="TenDT" Type="String" />
                        <asp:Parameter Name="MaHDH" Type="Int32" />
                        <asp:Parameter Name="MaNSX" Type="Int32" />
                        <asp:Parameter Name="DonGia" Type="Decimal" />
                        <asp:Parameter Name="Hinh" Type="String" />
                        <asp:Parameter Name="NgayCapNhat" Type="DateTime" />
                        <asp:Parameter Name="SoLuotXem" Type="Int32" />
                        <asp:Parameter Name="MaDT" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />

</asp:Content>

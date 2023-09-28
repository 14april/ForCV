<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Layout2.Master" AutoEventWireup="true" CodeBehind="QTDienThoai.aspx.cs" Inherits="WebBanDienThoai.Admin.QTDienThoai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung2" runat="server">
    <br />
    <div class="form-inline">
        Tên Điện Thoại&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txttendt" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;<asp:Button ID="bttracuu" CssClass="btn btn-secondary" runat="server" Text="Tra cứu" OnClick="bttracuu_Click" />
    </div>
    <br />
    <asp:GridView ID="gvdt" CssClass="table table-bordered table-hover " runat="server" AutoGenerateColumns="False" DataKeyNames="MaDT" 
        DataSourceID="dsdt" AllowPaging="True" CellPadding="5" PageSize="8">
        <Columns>
            <asp:BoundField DataField="TenDT" HeaderText="Tên điện thoại" SortExpression="TenDT" ItemStyle-HorizontalAlign="Center" />
            <asp:BoundField DataField="DonGia" DataFormatString="{0: #,##0} đ" HeaderText="Đơn giá" SortExpression="DonGia" ItemStyle-HorizontalAlign="Center" />
            <asp:ImageField DataImageUrlField="Hinh" DataImageUrlFormatString="Hinh/{0}"
                ControlStyle-Width="100px" HeaderText="Hình ĐT" SortExpression="Hinh" ItemStyle-HorizontalAlign="Center">
                <ControlStyle Width="100px"></ControlStyle>
            </asp:ImageField>
            <asp:BoundField DataField="NgayCapNhat" DataFormatString="{0: dd/MM/yyyy}" HeaderText="Ngày cập nhật" SortExpression="NgayCapNhat" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btEdit" CommandName="Edit" runat="server" Text="Sửa"
                        CssClass="btn btn-success" />
                    <asp:Button ID="btDelete" OnClientClick="return confirm('Bạn có muốn xóa không ?')" CommandName="Delete" runat="server"
                        Text="Xóa" CssClass="btn btn-danger" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btghi" CssClass="btn btn-info" CommandName="Update" runat="server" Text="Ghi" />
                    <asp:Button ID="btkhong" CssClass="btn btn-light" CommandName="cancel" runat="server" Text="Không" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dsdt" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" 
        DeleteCommand="DELETE FROM [DienThoai] WHERE [MaDT] = @MaDT" 
        InsertCommand="INSERT INTO [DienThoai] ([MaDT], [TenDT], [MaHDH], [MaNSX], [DonGia], [Hinh], [NgayCapNhat], [SoLuotXem]) VALUES (@MaDT, @TenDT, @MaHDH, @MaNSX, @DonGia, @Hinh, @NgayCapNhat, @SoLuotXem)" 
        SelectCommand="SELECT * FROM [DienThoai]" 
        UpdateCommand="UPDATE [DienThoai] SET [TenDT] = @TenDT,[DonGia] = @DonGia, [Hinh] = @Hinh, [NgayCapNhat] = @NgayCapNhat WHERE [MaDT] = @MaDT">
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
</asp:Content>

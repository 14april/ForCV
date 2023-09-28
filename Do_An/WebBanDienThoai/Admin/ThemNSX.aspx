<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Layout2.Master" AutoEventWireup="true" CodeBehind="ThemNSX.aspx.cs" Inherits="WebBanDienThoai.Admin.ThemNSX" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung2" runat="server">
    <br />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2">Mã NSX</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtMaNSX" runat="server" CssClass="form-control">
                </asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Tên NSX</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtTenNSX" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Địa Chỉ</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtdiachi" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Số Điện Thoại</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtsdt" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btThem" runat="server" Text="Thêm" CssClass="btn 
btn-info"
                    OnClick="btThem_Click" />
            </div>
        </div>
        <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server"
            Text=""></asp:Label>
    </div>
    <asp:GridView ID="gvnsx" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="MaNSX" DataSourceID="dsnsx" CellPadding="4" AllowPaging="True" ForeColor="#333333" GridLines="None" PageSize="4">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MaNSX" HeaderText="Mã Nhà Sản Xuất" ReadOnly="True" SortExpression="MaNSX" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TenNSX" HeaderText="Tên Nhà Sản Xuất" SortExpression="TenNSX" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" SortExpression="DiaChi" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DienThoai" HeaderText="Điện Thoại" SortExpression="DienThoai" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Button ID="btcapnhat" CssClass="btn btn-success" CommandName="Edit" runat="server" Text="Sửa" />
                    <asp:Button ID="btxoa" CssClass="btn btn-danger" CommandName="Delete" OnClientClick="return confirm('Bạn có muốn xóa không ?')" runat="server" Text="Xóa" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button ID="btghi" CssClass="btn btn-info" CommandName="Update" OnClientClick="alert('Cập nhật thành công')" runat="server" Text="Ghi" />
                    <asp:Button ID="btkhong" CssClass="btn btn-light" CommandName="cancel" runat="server" Text="Không" />
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsnsx" runat="server" ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" DeleteCommand="DELETE FROM [NhaSX] WHERE [MaNSX] = @MaNSX" InsertCommand="INSERT INTO [NhaSX] ([MaNSX], [TenNSX], [DiaChi], [DienThoai]) VALUES (@MaNSX, @TenNSX, @DiaChi, @DienThoai)" SelectCommand="SELECT * FROM [NhaSX]" UpdateCommand="UPDATE [NhaSX] SET [TenNSX] = @TenNSX, [DiaChi] = @DiaChi, [DienThoai] = @DienThoai WHERE [MaNSX] = @MaNSX">
        <DeleteParameters>
            <asp:Parameter Name="MaNSX" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaNSX" Type="Int32" />
            <asp:Parameter Name="TenNSX" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenNSX" Type="String" />
            <asp:Parameter Name="DiaChi" Type="String" />
            <asp:Parameter Name="DienThoai" Type="String" />
            <asp:Parameter Name="MaNSX" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Layout2.Master" AutoEventWireup="true" CodeBehind="ThemHDH.aspx.cs" Inherits="WebBanDienThoai.Admin.ThemHDH" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung2" runat="server">
    <br />
    <div class="form-horizontal">
        <div class="form-group">
            <label class="control-label col-sm-2">Mã HĐH:</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtMaHDH" runat="server" CssClass="form-control">
                </asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2">Tên HĐH</label>
            <div class="col-sm-10">
                <asp:TextBox ID="txtTenHDH" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btThem" runat="server" Text="Thêm" CssClass="btn 
btn-info" OnClick="btThem_Click"/>
            </div>
        </div>
        <asp:Label ID="lbThongBao" ForeColor="#cc3300" runat="server"
            Text=""></asp:Label>
    </div>
    <asp:GridView id="gvhdh" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="MaHDH" DataSourceID="dshdh" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MaHDH" HeaderText="Mã Hệ Điều Hành" ReadOnly="True" SortExpression="MaHDH" ItemStyle-HorizontalAlign="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="TenHDH" HeaderText="Tên Hệ Điều Hành" SortExpression="TenHDH" ItemStyle-HorizontalAlign="Center">
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
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource id="dshdh" runat="server" ConnectionString="<%$ ConnectionStrings:DienThoaiDBConnectionString %>" DeleteCommand="DELETE FROM [HeDieuHanh] WHERE [MaHDH] = @MaHDH" InsertCommand="INSERT INTO [HeDieuHanh] ([MaHDH], [TenHDH]) VALUES (@MaHDH, @TenHDH)" SelectCommand="SELECT * FROM [HeDieuHanh]" UpdateCommand="UPDATE [HeDieuHanh] SET [TenHDH] = @TenHDH WHERE [MaHDH] = @MaHDH">
        <DeleteParameters>
            <asp:Parameter Name="MaHDH" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="MaHDH" Type="Int32" />
            <asp:Parameter Name="TenHDH" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="TenHDH" Type="String" />
            <asp:Parameter Name="MaHDH" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

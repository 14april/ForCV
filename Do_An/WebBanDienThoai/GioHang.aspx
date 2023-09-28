<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebBanDienThoai.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Noi_dung" runat="server">
    <br />
    <asp:GridView ID="gvgiohang" runat="server" CssClass="table table-bordered"
        AutoGenerateColumns="false" OnRowDeleting="gvgiohang_RowDeleting" DataKeyNames="MaSP" OnRowUpdating="gvgiohang_RowUpdating">
        <Columns>
            <asp:ImageField DataImageUrlField="hinh" DataImageUrlFormatString="Hinh/{0}"
                HeaderText="Ảnh Sản Phẩm" ControlStyle-Width="50px" ControlStyle-Height="50px">
            </asp:ImageField>
            <asp:BoundField HeaderText="Tên Sản Phẩm" DataField="TenSP" />
            <asp:BoundField HeaderText="Đơn Giá" DataField="DonGia" DataFormatString="{0:#,##0 đ}" />
            <asp:TemplateField HeaderText="Số Lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtsoluong" TextMode="Number" runat="server" Text='<%# Eval("soluong") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Thành tiền" DataField="ThanhTien" DataFormatString="{0:#,##0 đ}" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btxoa" OnClientClick="return confirm('Bạn có muốn xóa sản phẩm này không ?')" runat="server" ToolTip="Xóa" CommandName="Delete" ImageUrl="~/Images/delete.gif" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton ID="btcapnhat" runat="server" ToolTip="Cập nhật" CommandName="Update" ImageUrl="~/Images/disk.gif" />
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EmptyDataTemplate>
            <div class="alert alert-info">
                Chưa Có Sản Phẩm Nào Trong Giỏ. Bạn Vui Lòng Vào Mua Hàng Nhé!
            </div>
        </EmptyDataTemplate>
    </asp:GridView>
    <br />
        <div class="row">
            <div class="col-md-6">
                <a href="Default.aspx" class="btn btn-info">Quay về SHOPPING tiếp</a>
            </div>
            <div class="col-md-6 text-right">
                Tổng thành tiền:<asp:Label ID="lbTongtien" CssClass="btn btn-danger" runat="server" Text=""></asp:Label>
            </div>
        </div>
    <br />
    <div class="row" style="padding-bottom: 10px">
        <div class="col-md-12">
            <asp:Button ID="btdathang" CssClass="btn btn-success" runat="server" Text="Đặt hàng" />
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="manage_promos.aspx.cs" Inherits="CarTrust.WebForm11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center" class="services-title-badge">Manage Promos</h1>
    <div class="text-right">
    <asp:Button ID="btnAddPromo" runat="server" Text="Add new Promo" CssClass="btn-primary mb-15 mx-15" OnClick="btnAddPromo_Click" />
        </div>
    <asp:GridView ID="grdAdminPromos" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowCommand="grdPromos_RowCommand">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="promo_name" HeaderText="promo_name" SortExpression="promo_name" />
            <asp:TemplateField HeaderText="Promo Image">
                <ItemTemplate>
                    <asp:Image id="image" Width="200" runat="server" ImageUrl='<%# "~/Front/img/promo_detail/" + Eval("file_name") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" Text="Edit Promo" CommandName="edit_promo" />
            <asp:ButtonField ButtonType="Button" Text="Remove Promo" CommandName="remove_promo" />
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [promo_name], [file_name] FROM [promo]"></asp:SqlDataSource>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="edit_promo.aspx.cs" Inherits="CarTrust.WebForm12" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="services-title-badge">Edit Promo</h1>
    <asp:FormView ID="promoEditView" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            promo_name:
            <asp:TextBox ID="promo_nameTextBox" runat="server" Text='<%# Bind("promo_name") %>' />
            <br />
            file_name:
            <asp:TextBox ID="file_nameTextBox" runat="server" Text='<%# Bind("file_name") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            promo_name:
            <asp:TextBox ID="promo_nameTextBox" runat="server" Text='<%# Bind("promo_name") %>' />
            <br />
            file_name:
            <asp:TextBox ID="file_nameTextBox" runat="server" Text='<%# Bind("file_name") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="service-edit-table">
                <tr>
                    <td colspan="2">Promo ID:
                        <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' /></td>
                </tr>
                <tr>
                    <td>Promo Name:</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="promoName" runat="server" Text='<%# Bind("promo_name") %>'></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Promo Image:</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="promoImage" Width="200" runat="server" ImageUrl='<%# "~/Front/img/promo_detail/" + Eval("file_name") %>' /></td>
                </tr>
                <tr>
                    <td width="120px">
                        <asp:FileUpload ID="promoImageUpload" runat="server" /></td>
                    <td>
                        <asp:Button ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" /></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnSvcUpdate" runat="server" Text="Update" OnClick="btnPromoUpdate_Click"/></td>
                    <td><asp:Button ID="btnDismiss" runat="server" Text="Back" OnClick="btnDismiss_Click" CausesValidation="false"/></td>
                </tr>
                <%--file_name:
            <asp:Label ID="file_nameLabel" runat="server" Text='<%# Bind("file_name") %>' />
            <br />--%>
            </table>

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [promo_name], [file_name] FROM [promo]"></asp:SqlDataSource>
</asp:Content>

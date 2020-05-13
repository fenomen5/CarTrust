<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="service.aspx.cs" Inherits="CarTrust.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 120px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="service-table">
        <tr>
            <td colspan="2"><asp:Image ID="svcImage" runat="server" /></td>
            <td colspan="2" class="service-description"><asp:Label ID="svcDescription" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td class="field">Service Name</td>
            <td colspan="2">
                <asp:Label ID="svcId" runat="server" Text="Label" Visible="False"></asp:Label>
                <asp:Label ID="svcName" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="service-cart-btn"><asp:Button ID="CartAdd" runat="server" Text="Add to Cart" CssClass="cart-add-btn" OnClick="CartAdd_Click" /></td>
            
        </tr>
        <tr>
            <td class="field">Service Category</td>
            <td>
                <asp:Label ID="svcCategory" runat="server" Text="Label"></asp:Label>
            </td>
            <td></td>
        </tr>
        <tr>
            <td class="field">Service Cost</td>
            <td class="auto-style1">
                <asp:Label ID="svcPrice" runat="server" Text="Label"></asp:Label>
            </td>
            <td></td>
        </tr>
    </table>
</asp:Content>

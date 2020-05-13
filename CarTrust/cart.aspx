<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="CarTrust.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="cartServicesGrid" runat="server" AutoGenerateColumns="false" CssClass="cartServicesGrid" OnRowCommand="cartServicesGrid_RowCommand" OnSelectedIndexChanged="cartServicesGrid_SelectedIndexChanged" DataKeyNames="service_id">
        <Columns>
            <asp:BoundField Datafield="service_id"  HeaderText="ID" ShowHeader="false" Visible="false" />
            <asp:ImageField DataImageUrlField="service_image" ControlStyle-CssClass ="cart-service-image" HeaderText="Image" HeaderStyle-CssClass="services-header"/>
            <asp:BoundField Datafield="service_name" ItemStyle-CssClass="cart-service-name" HeaderText="Name" HeaderStyle-CssClass="services-header" />
            <asp:BoundField Datafield="service_cost" ItemStyle-CssClass="cart-service-price" HeaderText="Price" HeaderStyle-CssClass="services-header"/>
            <asp:ButtonField CommandName="remove_service" Text="X" ControlStyle-CssClass="remove-service"/>
        </Columns>
    </asp:GridView>
    <div class="cart-services-total">
        <h2>Total services count: <asp:Label ID="lblTotalCount" runat="server" Text="0"></asp:Label></h2>
        <h2>Total services cost: <asp:Label ID="lblTotalCost" runat="server" Text="0"></asp:Label>$</h2>
    </div>
    <div style="text-align:center; margin:40px;">
        <asp:Button ID="bookVisit" runat="server" Text="Book a Visit" CssClass="book-visit" OnClick="bookVisit_Click"/>
    </div>
    
</asp:Content>

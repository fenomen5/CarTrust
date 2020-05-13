<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="manage_visits.aspx.cs" Inherits="CarTrust.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center" class="services-title-badge">Manage Visits</h1>
    <div class="text-right">
    <asp:Button ID="Button1" runat="server" Text="Add new Visit" CssClass="btn-primary mb-15 mx-15"  OnClick="Button1_Click"/>
     </div>
    <asp:GridView ID="gridAdminVisits" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="visit_time" HeaderText="Visit Time" SortExpression="visit_time" />
            <asp:BoundField DataField="visitor_name" HeaderText="Visitor Name" SortExpression="visitor_name" />
            <asp:BoundField DataField="visitor_email" HeaderText="Visitor Email" SortExpression="visitor_email" />
            <asp:BoundField DataField="visitor_car_model" HeaderText="Car Model" SortExpression="visitor_car_model" />
            <asp:BoundField DataField="visitor_car_released" HeaderText="Year Manufactured" SortExpression="visitor_car_released" />
            <asp:ButtonField ButtonType="Button" Text="Edit Visit" CommandName="edit_visit" />
            <asp:ButtonField ButtonType="Button" Text="Remove Visit" CommandName="remove_visit" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [visit_time], [visitor_name], [visitor_email], [visitor_car_model], [visitor_car_released] FROM [scheduled_visit]"></asp:SqlDataSource>
</asp:Content>

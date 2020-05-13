<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="manage_users.aspx.cs" Inherits="CarTrust.WebForm17" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center" class="services-title-badge">Manage Users</h1>
    
      <table style="line-height:2px">
            <tr>
                <td width="35%" class="auto-style1">
                    <h2>User name</h2>
                </td>
                <td class="auto-style1 text-left">
                    <asp:TextBox ID="txtUserName" runat="server" Font-Size="X-Large" CssClass="mx-15"></asp:TextBox>
                </td>
                <tr>
                    <td width="35%" class="auto-style1">
                        <h2>Visited from</h2>
                    </td>
                    <td class="auto-style1 text-left">
                        <asp:TextBox ID="txtVisitedStart" runat="server" Font-Size="X-Large" CssClass="mx-15" TextMode="Date">Enter start date</asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="35%" class="auto-style1">
                        <h2>Visited to</h2>
                    </td>
                    <td class="auto-style1 text-left">
                        <asp:TextBox ID="txtVisitedEnd" runat="server" Font-Size="X-Large" CssClass="mx-15" TextMode="Date">Enter end date</asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td class="text-center" colspan="2">
                    <asp:Button ID="btnSearch" runat="server" Font-Size="X-Large" OnClick="btnSearchUsers_Click" Text="Search" />
                </td>
            </tr>
        </table>
    <div class="text-right">
    <asp:Button ID="Button1" runat="server" Text="Add new User" CssClass="btn-primary mb-15 mx-15"  OnClick="Button1_Click"/>
     </div>
    <asp:GridView ID="gridAdminUsers" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnRowCommand="GridView1_RowCommand" AllowSorting="True">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="user_name" HeaderText="User Name" SortExpression="user_name" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="active" HeaderText="User Active" SortExpression="active" />
            <asp:BoundField DataField="isAdmin" HeaderText="User Admin" SortExpression="isAdmin" />
            <asp:BoundField DataField="visits_num" HeaderText="Visits Count" SortExpression="visits_num" />
            <asp:ButtonField ButtonType="Button" Text="Edit User" CommandName="edit_user" />
            <asp:ButtonField ButtonType="Button" Text="Remove User" CommandName="remove_user" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT users.id, users.user_name, users.email, users.active, users.isAdmin, visits.visits_num
FROM users 
LEFT JOIN 
(select user_id, count(user_stat.user_id) as visits_num 
from user_stat 
group by user_id) as visits on
visits.user_id = users.id 
"></asp:SqlDataSource>
</asp:Content>

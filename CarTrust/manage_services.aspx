<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="manage_services.aspx.cs" Inherits="CarTrust.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center" class="services-title-badge">Manage Services</h1>
    <div class="text-right">

        <table>
            <tr>
                <td width="35%" class="auto-style1">
                    <h2>Service name</h2>
                </td>
                <td class="auto-style1 text-left">
                    <asp:TextBox ID="txtServiceName" runat="server" Font-Size="X-Large" CssClass="mx-15"></asp:TextBox>
                </td>
                <tr>
                    <td width="35%" class="auto-style1">
                        <h2>Service description keyword</h2>
                    </td>
                    <td class="auto-style1 text-left">
                        <asp:TextBox ID="txtServiceDescription" runat="server" Font-Size="X-Large" CssClass="mx-15"></asp:TextBox>
                    </td>
                </tr>
            <tr>
                <td width="35%">
                    <h2>Service category</h2>
                </td>
                <td class="text-left">
                    <asp:DropDownList ID="listServiceCategory" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" Font-Size="X-Large" CssClass="mx-15" OnDataBound="listServiceCategory_DataBound"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [name] FROM [service_category]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="text-center" colspan="2">
                    <asp:Button ID="btnSearch" runat="server" Font-Size="X-Large" OnClick="btnSearchServices_Click" Text="Search" />
                </td>
            </tr>
        </table>
    <asp:Button ID="Button1" runat="server" Text="Add new Service" CssClass="btn-primary mb-15 mx-15"  OnClick="Button1_Click"/>
        </div>
    <asp:GridView ID="gridAdminServices" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" DataKeyNames="id" OnDataBound="gridAdminServices_DataBound" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="Service ID" SortExpression="service_id" Visible="false"/>
            <asp:BoundField DataField="service_name" HeaderText="Service Name" SortExpression="service_name" />
            <asp:BoundField DataField="service_cost" HeaderText="Service Cost" SortExpression="service_cost" />
            <asp:BoundField DataField="service_description" HeaderText="Service Description" SortExpression="service_description" />
            <asp:TemplateField HeaderText="Service Image">
                <ItemTemplate>
                    <asp:Image id="image" Width="200" runat="server" ImageUrl='<%# "~/Front/img/service_detail/" + Eval("image_path") %>'/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="name" HeaderText="Category" SortExpression="name" />
            <asp:ButtonField ButtonType="Button" Text="Edit Service" CommandName="edit_service" />
            <asp:ButtonField ButtonType="Button" Text="Remove Service" CommandName="remove_service" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT service.id, service.service_name, service.service_cost, service.service_description, service_image.image_path, service_category.name FROM service INNER JOIN service_category ON service.service_category = service_category.id INNER JOIN service_image ON service.id = service_image.service_id"></asp:SqlDataSource>
</asp:Content>

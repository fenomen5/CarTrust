<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="edit_service.aspx.cs" Inherits="CarTrust.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="services-title-badge">Edit Service</h1>
    <asp:FormView ID="ServiceEditView" runat="server" DataKeyNames="id,category_id,image_id" DataSourceID="SqlDataSource1" OnDataBound="ServiceEditView_DataBound">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            service_name:
            <asp:TextBox ID="service_nameTextBox" runat="server" Text='<%# Bind("service_name") %>' />
            <br />
            service_cost:
            <asp:TextBox ID="service_costTextBox" runat="server" Text='<%# Bind("service_cost") %>' />
            <br />
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />
            category_id:
            <asp:Label ID="category_idLabel1" runat="server" Text='<%# Eval("category_id") %>' />
            <br />
            service_id:
            <asp:TextBox ID="service_idTextBox" runat="server" Text='<%# Bind("service_id") %>' />
            <br />
            image_path:
            <asp:TextBox ID="image_pathTextBox" runat="server" Text='<%# Bind("image_path") %>' />
            <br />
            image_id:
            <asp:Label ID="image_idLabel1" runat="server" Text='<%# Eval("image_id") %>' />
            <br />
            service_description:
            <asp:TextBox ID="service_descriptionTextBox" runat="server" Text='<%# Bind("service_description") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            service_name:
            <asp:TextBox ID="service_nameTextBox" runat="server" Text='<%# Bind("service_name") %>' />
            <br />
            service_cost:
            <asp:TextBox ID="service_costTextBox" runat="server" Text='<%# Bind("service_cost") %>' />
            <br />
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />

            service_id:
            <asp:TextBox ID="service_idTextBox" runat="server" Text='<%# Bind("service_id") %>' />
            <br />
            image_path:
            <asp:TextBox ID="image_pathTextBox" runat="server" Text='<%# Bind("image_path") %>' />
            <br />
            
            service_description:
            <asp:TextBox ID="service_descriptionTextBox" runat="server" Text='<%# Bind("service_description") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="service-edit-table">
                <tr>
                    <td colspan="2">Service ID: <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' /></td>
                </tr>
                <tr>
                    <td>Service Name:</td>
                </tr>
                <tr>
                    <td colspan="2"><asp:TextBox ID="serviceName" runat="server" Text='<%# Bind("service_name") %>'></asp:TextBox></td>
                </tr>
                 <tr>
                    <td>Service Cost:</td>
                </tr>
                <tr>
                    <td colspan="2"><asp:TextBox ID="serviceCost" runat="server" Text='<%# Bind("service_cost") %>'></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" runat="server" ErrorMessage="Enter a decimal value" ControlToValidate="serviceCost" ValidationExpression="^\d*\.?\d*$"></asp:RegularExpressionValidator></td>
                </tr>
                 <tr>
                    <td>Service Category:</td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Label ID="categoryId" runat="server" Text='<%# Eval("category_id") %>' Visible="false" />
                        <asp:DropDownList ID="serviceCategories" runat="server" DataSourceID="CategoriesDS" DataValueField='id' DataTextField="name"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Service Image:</td>
                </tr>
                <tr>
                    <td colspan="2"><asp:Image ID="serviceImage" Width="200" runat="server" ImageUrl='<%# "~/Front/img/service_detail/" + Eval("image_path") %>'/></asp:DropDownList></td>
                </tr>
                <tr>
                    <td width="120px"><asp:FileUpload ID="serviceImageUpload" runat="server" /></td>
                    <td><asp:Button ID="btnUpload" runat="server" Text="Upload Image" OnClick="btnUpload_Click" /></td>
                </tr>
                <tr>
                    <td>Service Description:</td>
                </tr>
                <tr>
                    <td colspan="2"><asp:TextBox ID="serviceDescription" runat="server" Text='<%# Bind("service_description") %>' TextMode="MultiLine" Rows="3"></asp:TextBox></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnSvcUpdate" runat="server" Text="Update" OnClick="btnSvcUpdate_Click"/></td>
                    <td><asp:Button ID="btnDismiss" runat="server" Text="Back" OnClick="btnDismiss_Click" CausesValidation="false"/></td>
                </tr>
            <br />
            </table>
        </ItemTemplate>

    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT service.id, service.service_name, service.service_cost, service_category.name, service_category.id AS category_id, service_image.service_id, service_image.image_path, service_image.id AS image_id, service.service_description FROM service INNER JOIN service_category ON service.service_category = service_category.id INNER JOIN service_image ON service.id = service_image.service_id"></asp:SqlDataSource>
    <asp:SqlDataSource ID="CategoriesDS" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [name] FROM [service_category]"></asp:SqlDataSource>
</asp:Content>

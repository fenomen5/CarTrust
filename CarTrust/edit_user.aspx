<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="edit_user.aspx.cs" Inherits="CarTrust.WebForm18" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="services-title-badge">Edit User Account</h1>
    <asp:FormView ID="UserEditView" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            User ID:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            User Name:
            <asp:TextBox ID="txtUserNameE" runat="server" Text='<%# Bind("user_name") %>' />
            <br />
            User Email:
            <asp:TextBox ID="txtUserEmailE" runat="server" Text='<%# Bind("email") %>' />
            <br />
            User Active:
            <asp:CheckBox ID="chkUserActiveE" runat="server" checked='<%# Bind("active") %>' />
            <br />
            User Admin:
            <asp:CheckBox ID="chkUserAdminE" runat="server" checked='<%# Bind("isAdmin") %>' />
           
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            visit_time:
            <asp:TextBox ID="visit_timeTextBox" runat="server" Text='<%# Bind("visit_time") %>' />
            <br />
            visitor_name:
            <asp:TextBox ID="visitor_nameTextBox" runat="server" Text='<%# Bind("visitor_name") %>' />
            <br />
            visitor_email:
            <asp:TextBox ID="visitor_emailTextBox" runat="server" Text='<%# Bind("visitor_email") %>' />
            <br />
            visitor_car_model:
            <asp:TextBox ID="visitor_car_modelTextBox" runat="server" Text='<%# Bind("visitor_car_model") %>' />
            <br />
            visitor_car_released:
            <asp:TextBox ID="visitor_car_releasedTextBox" runat="server" Text='<%# Bind("visitor_car_released") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table class="visit-edit-table">
                <tr>
                    <td colspan="2">User ID: <asp:Label ID="userId" runat="server" Text='<%# Eval("id") %>' /></td>
                </tr>
                <tr>
                    <td>User Name:</td
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtUserName" runat="server" Text='<%# Bind("user_name") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Please enter user name" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="User name should be at least 3 symbols long" ValidationExpression="\w{3,}" ForeColor="#CC0066"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>User Email:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="txtUserEmail" runat="server" Text='<%# Bind("email") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Please enter user email" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtUserEmail" ErrorMessage="Incorrect email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC0066"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                 <tr>
                    <td>User Active:</td>
                </tr>
                <tr>
                    <td><asp:CheckBox ID="chkUserActive" runat="server" checked='<%# (Eval("active").ToString()=="1") %>'/>
                       </td>
                </tr>
                 <tr>
                    <td>User Admin:</td>
                </tr>
                <tr>
                    <td> <asp:CheckBox ID="chkUserAdmin" runat="server" checked='<%# (Eval("isAdmin").ToString()=="1") %>'/></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnSvcUpdate" runat="server" Text="Update" OnClick="btnUserUpdate_Click"/></td>
                    <td><asp:Button ID="btnDismiss" runat="server" Text="Back" OnClick="btnDismiss_Click" CausesValidation="false"/></td>
                </tr>
           </table>
        </ItemTemplate>

    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [user_name], [email], [active], [isAdmin] FROM [users]"></asp:SqlDataSource>
                    </asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CarTrust.WebForm13" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="login-table">
        <tr>
            <td colspan="2">
                <h1>Login</h1>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="mb-15">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h3>Email</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input input-long"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please, enter your email" ControlToValidate="txtEmail" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Please, enter correct email" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h3>Password</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input input-long" Font-Bold="True" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please, enter your password" ControlToValidate="txtPassword" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <a href="forgot_password.aspx" class="mx-30">Forgot your Password?</a>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Button ID="btnLogin" CssClass="btn" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMessage" runat="server" Text="Label" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>

</asp:Content>

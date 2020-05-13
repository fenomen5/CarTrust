<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="forgot_password.aspx.cs" Inherits="CarTrust.WebForm15" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="login-table">
        <tr>
            <td colspan="2">
                <h1>Password recovery form</h1>
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
                <p>Enter email to get the reset password link
                </p>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" Visible="False"></asp:Label>
                <asp:Button ID="btnSend" CssClass="btn" runat="server" Text="Send reset request" OnClick="btnSend_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

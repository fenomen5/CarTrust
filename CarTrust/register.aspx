<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="CarTrust.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table class="login-table">
        <tr>
            <td colspan="2">
                <h1>Register</h1>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <hr class="mb-15">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <h3>First Name</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-input input-long"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please, enter your name" ControlToValidate="txtFirstName" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Name value should be more than 3 symbols " Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" ValidationExpression="\w{3,}"></asp:RegularExpressionValidator>
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
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPassword" Display="Dynamic" ErrorMessage="Password length should be not less than 8 characters" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" ValidationExpression="\w{8,}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="auto-style1">
                <h3>Confirm Password</h3>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input input-long" Font-Bold="True" TextMode="Password"></asp:TextBox>
            </td>
            <td>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwordrs do not match" Font-Bold="True" Font-Size="1.1em" ForeColor="#FF0066" Display="Dynamic" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtConfirmPassword" Display="Dynamic" ErrorMessage="Please, confirm your password" Font-Bold="True" Font-Overline="False" Font-Size="1.1em" ForeColor="#FF0066"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnRegister" CssClass="btn" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

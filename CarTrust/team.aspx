<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="team.aspx.cs" Inherits="CarTrust.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            menu.select('team');
        })
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:center">Our Team</h1>
    <table class="main-banner-three-btn" cellspacing=35>
        <tr>
            <td width="20%" class="item-border-left">
                
                <img src="Front/img/staff/accountant.jpg" width="200" height="200" /><br>
                Accountant: Sylvia Delorian
            </td>
            <td width="20%" class="item-border-left">
                
                <img src="Front/img/staff/manager.jpg" width="200" height="200"/>
                <br>Manager: Nicolas Saab
            </td>
        </tr>
        <tr>
            <td width="20%" class="item-border-left">
                <img src="Front/img/staff/mecanic%201.jpg" width="200" height="200" />
                <br>Mechanic: Deniel Subaru 
            </td>
            <td width="20%" class="item-border-left">
                <img src="Front/img/staff/mecanic%202.jpg" width="200" height="200" />
                <br>Mechanic: Eaton McLaren
            </td>
        </tr>
    </table>
</asp:Content>

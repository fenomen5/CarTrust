<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="visit.aspx.cs" Inherits="CarTrust.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            menu.select('visit');
            gmap.init('gmap-wide');
        })
    </script>
    <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAWWTUDXQdBpMkpg4sndZLSFGSouA3cOB0"></script>
<style type="text/css">
    table input {
        line-height:20px;
        font-size:x-large;
        padding:5px;
    }
    .auto-style1 {
        width: 100%;
    }
    .auto-style2 {
        width: 323px;
        font-size:x-large;
        padding:10px;
    }
    .auto-style3 {
        width: 238px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Request for a visit</h1>
    <form>
        <div class="visit-form" id="visit_form" runat="server" >

            &nbsp;&nbsp;<br><br>
                
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Enter date</td>
                    <td class="auto-style3">
            <asp:TextBox ID="txtVisitDate" runat="server" TextMode="Date"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVisitDate" ErrorMessage="Please enter visit date" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:Label ID="Label2" runat="server" Text="Enter time"></asp:Label>
                    </td>
                    <td class="auto-style3">
            <asp:TextBox ID="txtVisitTime" runat="server" TextMode="Time"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtVisitTime" ErrorMessage="Please enter visit time" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        Enter name</td>
                    <td class="auto-style3">
            <asp:TextBox ID="txtClientName" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtClientName" ErrorMessage="Please enter your name" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        Enter email</td>
                    <td class="auto-style3">
            <asp:TextBox ID="txtClientEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtClientEmail" ErrorMessage="Please enter your email" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtClientEmail" ErrorMessage="Incocorrect email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC0066"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:Label ID="Label3" runat="server" Text="Enter your car model"></asp:Label>
                    </td>
                    <td class="auto-style3">
            <asp:TextBox ID="txtCarModel" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCarModel" ErrorMessage="Please enter car model" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:Label ID="Label4" runat="server" Text="Enter the year it was produced"></asp:Label>
                    </td>
                    <td class="auto-style3">
            <asp:TextBox ID="txtYearProduced" runat="server" TextMode="Number"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtYearProduced" ErrorMessage="Please enter the year the car was produced" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtYearProduced" ErrorMessage="Please enter the car production year" ForeColor="#CC0066" ValidationExpression="\d{4}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
            <asp:Button ID="btnCreateVisit" runat="server" Text="Send request" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br><br>
        </div>
  
    </form>
    <div id="gmap-wide"></div>
</asp:Content>


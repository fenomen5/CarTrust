<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="contacts.aspx.cs" Inherits="CarTrust.WebForm19" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            menu.select('contacts');
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
    <h1 class="text-center">Contacts</h1>
    <form>
        <div class="contacts-form">

            <div class="footer-logo text-center" >
                        <div class="footer-address" style="width:30%;float:left;padding:30px 20px 30px 20px"><i class="fa fa-address-card" style="font-size:3.0em"></i><br><br>402 Great North Rd, Grey Lynn, Auckland 1021</div>
                        <div class="footer-email" style="width:30%;float:left;padding:30px 20px 30px 20px"><i class="fa fa-envelope" style="font-size:3.0em"></i><br><br>cartrust@gmail.com</div>
                        <div class="footer-phone" style="width:30%;float:left;padding:30px 20px 30px 20px"><i class="fa fa-phone" style="font-size:3.0em"></i><br><br>0402 142 14 16</div>
                    </div>
          
            <br><br>
        </div>
    </form>
    <div id="gmap-wide"></div>
</asp:Content>


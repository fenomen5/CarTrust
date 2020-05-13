<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="mainpage.aspx.cs" Inherits="CarTrust.MainPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            menu.select('main');
            gmap.init('gmap-wide');
            slider.init();
        })
        
    </script>
    <script  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAWWTUDXQdBpMkpg4sndZLSFGSouA3cOB0"></script>
    <script  src="Front/js/libs/slider.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background: url(/Front/img/mainpageback.png) no-repeat scroll left;background-size:cover;height: 185px;padding: 50px;color: #09152f;margin: 0px 0px 20px 0px;">
        <div style="background-color: rgba(255, 255, 255, 0.6);padding: 5px;">
        <h1 class="text-center">The mechanics you can trust your car</h1>
        <p class="text-center pb-10 font-16">
            When it comes to enjoying a reliable vehicle that gives you trouble free motoring, 
            there’s a simple truth to face, you need to service your car regularly. 
            But servicing your car needn’t be a stressful time. 
            Not with the <b>CarTrust</b> approach to peace of mind motoring at least. 
        </p>
            </div>
    </div>
    <ul runat="server" id="promo_slider" class="promo-slider"> 
       <%-- <li><img src="http://placehold.it/500x250" alt="" /></li>
        <li><img src="http://placehold.it/500x250" alt="" /></li>
        <li><img src="http://placehold.it/500x250" alt="" /></li>
        <li><img src="http://placehold.it/500x250" alt="" /></li>--%>
    </ul>
    <table class="main-banner-three-btn" cellspacing=35>
        <tr>
            <td width="20%" class="item-border-left">
                <asp:HyperLink NavigateUrl="~/services.aspx" runat="server" CssClass="link-simple">Service options </asp:HyperLink>
            </td>
            <td width="20%" class="item-border-left">
                <asp:HyperLink NavigateUrl="~/visit.aspx" runat="server" CssClass="link-simple"> Book a visit </asp:HyperLink>
            </td>
        </tr>
    </table>
    <h1 class="section1 text-center">Contacts</h1>
    <%--<table class="main-banner-three-btn" cellspacing=35>
        <tr>
            <td width="20%" class="item-border-left">
                <h2>Auckland Location:</h2> <br>
                <h3>402 Great North Rd, Grey Lynn, Auckland 1021</h3>

            </td>
        </tr>
    </table>--%>

    <div id="gmap-wide"></div>
</asp:Content>

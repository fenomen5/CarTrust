<%@ Page Title="" Language="C#" MasterPageFile="~/Admins.Master" AutoEventWireup="true" CodeBehind="edit_visit.aspx.cs" Inherits="CarTrust.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="services-title-badge">Edit Visit</h1>
    <asp:FormView ID="VisitEditView" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            Visit ID:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
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
                    <td colspan="2">Visit ID: <asp:Label ID="visitId" runat="server" Text='<%# Eval("id") %>' /></td>
                </tr>
                <tr>
                    <td>Visit Time:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="visitTime" runat="server" Text='<%# Bind("visit_time") %>'/></td>
                </tr>
                <tr>
                    <td>Visitor Name:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="visitorName" runat="server" Text='<%# Bind("visitor_name") %>'/></td>
                </tr>
                 <tr>
                    <td>Visitor Email:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="visitorEmail" runat="server" Text='<%# Bind("visitor_email") %>'/><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="visitorEmail" ErrorMessage="Please enter your email" ForeColor="#CC0066"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="visitorEmail" ErrorMessage="Incocorrect email format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC0066"></asp:RegularExpressionValidator></td>
                </tr>
                 <tr>
                    <td>Car Model:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="carModel" runat="server" Text='<%# Bind("visitor_car_model") %>'/></td>
                </tr>
                <tr>
                    <td>Year Manufactured:</td>
                </tr>
                <tr>
                    <td><asp:TextBox ID="yearManufactured" runat="server" Text='<%# Bind("visitor_car_released") %>'/></td>
                </tr>
                <tr>
                    <td><asp:Button ID="btnSvcUpdate" runat="server" Text="Update" OnClick="btnSvcUpdate_Click"/></td>
                    <td><asp:Button ID="btnDismiss" runat="server" Text="Back" OnClick="btnDismiss_Click" CausesValidation="false"/></td>
                </tr>
           </table>
        </ItemTemplate>

    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [visit_time], [visitor_name], [visitor_email], [visitor_car_model], [visitor_car_released] FROM [scheduled_visit]"></asp:SqlDataSource>
                    </asp:Content>

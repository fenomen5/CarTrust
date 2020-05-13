<%@ Page Title="" Language="C#" MasterPageFile="~/CarTrust.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="CarTrust.WebForm1" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            menu.select('services');
        })
        
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="text-center">Services we provide</h1>

    <table class="custom-services-table">
        <tr>
            <td width="35%"><h2>Select custom service category</h2></td>
            <td>
                <asp:DropDownList ID="listServiceCategory" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" Font-Size="X-Large" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT [id], [name] FROM [service_category]" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td width="35%" class="auto-style1"><h2>Enter custom service name</h2></td>
            <td class="auto-style1">
                <asp:TextBox ID="txtServiceName" runat="server" Font-Size="X-Large"></asp:TextBox>
                <asp:Button ID="btnSearchByName" runat="server" Font-Size="X-Large" OnClick="btnSearchByName_Click" Text="Search" />
            </td>
        </tr>
        <tr>
            <td colspan="2" class="custom-services-table">

                <asp:GridView ID="gridServices" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnRowDataBound="gridServices_RowDataBound" OnSelectedIndexChanged="gridServices_SelectedIndexChanged" Width="1019px" OnRowCommand="gridServices_RowCommand" CssClass="custom-services-grid" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" Visible="False" />
                        <asp:BoundField DataField="service_name" HeaderText="Service Name" SortExpression="service_name" />
                        <asp:BoundField DataField="service_cost" HeaderText="Service Cost" SortExpression="service_cost" />
                        <asp:BoundField DataField="service_category" HeaderText="Servie Category" SortExpression="service_category" />
                        <asp:ButtonField Text="Add to Cart" HeaderText="Action" CommandName="serviceAddClick"/>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#202c45" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="services-row" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbcartrust %>" SelectCommand="SELECT service.id, service.service_name, service.service_cost, service_category.name as service_category FROM service
INNER JOIN service_category ON service.service_category = service_category.id 
WHERE (service_category = @service_category)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="listServiceCategory" Name="service_category" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
    <h1 class="text-center">Maintenance Packages</h1>
    <table class="services-table">
        <tr valign="top">
            <td>
                <div class="services-title">Basic</div>
                <div class="services-description text-center">A simple service – ideal as a quick check between full vehicle services.</div>
                <div class="services-price">$148</div>
                <div class="services-content">
                    <ul>
                        <li>Replace engine oil up to 4.5L standard oil</li>
                        <li>Replace engine oil filter up to $20</li>
                        <li>Check and top-up under bonnet fluids</li>
                        <li>Check and set tyre pressures</li>
                        <li>Lubricate doors and chassis </li>
                    </ul>
                    <div style="align-items:center;text-align:center;position:absolute;bottom:10px;width:100%">
                    <asp:Button ID="btnBasic" runat="server" Text="Add to Cart" CssClass="cart-add-btn" OnClick="CartAdd_Click" CommandName="addBasic"/>
                        </div>
                </div>
            </td>
            <td>
                <div class="services-title">Standard</div>
                <div class="services-description">Our recommended (and most popular) standard service for peace of mind motoring.</div>
                <div class="services-price">$189</div>
                <div class="services-content">
                    <ul>
                        <li>Replace engine oil up to 4.5L standard oil</li>
                        <li>Replace engine oil filter up to $20</li>
                        <li>Check and top-up under bonnet fluids</li>
                        <li>Check and set tyre pressures</li>
                        <li>Lubricate doors and chassis </li>
                        <li>Reset service/maintenance light </li>
                        <li>33 point comprehensive visual inspection
                                Checking: Fluids, under bonnet, under vehicle, brakes and tyres. 
                        </li>
                    </ul>
                    <div style="align-items:center;text-align:center;position:absolute;bottom:10px;width:100%">
                        <asp:Button ID="btnStandard" runat="server" Text="Add to Cart" CssClass="cart-add-btn" OnClick="CartAdd_Click" CommandName="addStandard"/>
                            </div>
                </div>
            </td>
            <td>
                <div class="services-title">Premium</div>
                <div class="services-description">Our most comprehensive service – ideal when you’ve gone a little too long between services.</div>
                <div class="services-price">$229</div>
                <div class="services-content">
                    <ul>
                        <li>Replace engine oil up to 4.5L standard oil</li>
                        <li>Replace engine oil filter up to $20</li>
                        <li>Check and top-up under bonnet fluids</li>
                        <li>Check and set tyre pressures</li>
                        <li>Lubricate doors and chassis </li>
                        <li>Reset service/maintenance light </li>
                        <li>Perform engine management system scan</li>
                        <li>33 point comprehensive visual inspection
                                Checking: Fluids, under bonnet, under vehicle, brakes and tyres. 
                        </li>
                    </ul>
                    <div style="align-items:center;text-align:center;position:absolute;bottom:10px;width:100%">
                    <asp:Button ID="btnPremium" runat="server" Text="Add to Cart" CssClass="cart-add-btn" OnClick="CartAdd_Click" CommandName="addPremium"/>
                     </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

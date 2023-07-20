<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Order_Master.aspx.cs" Inherits="Admin_Order_Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        .HyLink {
            text-decoration:none;
            padding:5px;
        }
    </style>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField HeaderText="Order_Id" DataField="Order_Id">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Customer Name">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label id="lblCustName" runat="server" Text='<%#Eval("Cust_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email_Id">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label id="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Contact">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label id="lblContact" runat="server" Text='<%#Eval("Contact") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label id="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="Payment Type" DataField="Payment_Type" >
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Order Status">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemTemplate>
                     <asp:CheckBox ID="ChkOrder" runat="server" AutoPostBack="true" OnLoad="ChkOrder_Load" OnCheckedChanged="ChkOrder_CheckedChanged"/>
                     <asp:Label ID="Label2" runat="server" Text="Shipped"></asp:Label>
                 </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Payment Status">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemTemplate>
                     <asp:Label ID="lblPStatus" runat="server" Text="P"></asp:Label>
                 </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="Added On" DataField="Added_On" >
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:HyperLinkField HeaderText="View Details" Text="View" DataNavigateUrlFields="Order_Id" DataNavigateUrlFormatString="Order_DetailsMaster.aspx?Order_Id={0}">
                <HeaderStyle BackColor="#003220" ForeColor="White" HorizontalAlign="Center" />
                <ControlStyle BackColor="#FF9900" ForeColor="White" BorderStyle="Solid" CssClass="HyLink"/>
                <ItemStyle HorizontalAlign="Center" />
            </asp:HyperLinkField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>

</asp:Content>


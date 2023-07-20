<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Pro_master.aspx.cs" Inherits="Pro_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        .HyLink {
            text-decoration:none;
            padding:5px;
        }
    </style>

    <a href="Manage_Cate.aspx">Add Category</a><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" Height="254px" Width="605px" DataKeyNames="Prod_Id" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" ForeColor="Black" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Prod_Id" HeaderText="Id" ReadOnly="True">
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Prod_Name" HeaderText="Name">
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Sub Category">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlSub_Cate" runat="server" DataSourceID="SqlDataSource1" onLoad="ddlSub_Cate_Load" DataTextField="Sub_Cat" DataValueField="Sub_Cat">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT [Sub_Cat] FROM [tbl_Sub_Cat]"></asp:SqlDataSource>
                </EditItemTemplate>
                <HeaderStyle BackColor="#013220" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Brand">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlBrand" runat="server" DataSourceID="SqlDataSource2" DataTextField="Brand" DataValueField="Brand">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT [Brand] FROM [tbl_Brand]"></asp:SqlDataSource>
                </EditItemTemplate>
                <HeaderStyle BackColor="#013220" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Consumers">
                <HeaderStyle BackColor="#013220" />
                <ItemTemplate>
                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Description">
                 <HeaderStyle BackColor="#013220" />
                 <ItemTemplate>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                    </div>
                </ItemTemplate>
                 <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Status">
                 <ItemTemplate>
                     <asp:CheckBox ID="ChkEmpty" runat="server" AutoPostBack="true" OnLoad="ChkEmpty_Load" OnCheckedChanged="ChkEmpty_CheckedChanged"/>
                     <asp:Label ID="Label2" runat="server" Text="Active"></asp:Label>
                 </ItemTemplate>
                 <HeaderStyle Height="25px" BackColor="#013220" />
                 <ItemStyle Height="80px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
             </asp:TemplateField>
            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" >
            <ControlStyle BackColor="#003300" ForeColor="White" BorderColor="#003300" BorderStyle="Double" BorderWidth="5px" />
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            
            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True">
            <ControlStyle BackColor="Red" ForeColor="White" BorderColor="Red" BorderStyle="Double" BorderWidth="5px" />
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>

            <asp:HyperLinkField DataNavigateUrlFields="Prod_Id" DataNavigateUrlFormatString="Sub_Pro_master.aspx?Prod_Id={0}" HeaderText="View SubProducts" Text="View" >
            
            <ControlStyle BackColor="#6666FF" ForeColor="White" BorderStyle="Solid" CssClass="HyLink"/>
            <HeaderStyle BackColor="#013220" />
            </asp:HyperLinkField>
            
            <asp:HyperLinkField DataNavigateUrlFields="Prod_Id,Prod_Name" DataNavigateUrlFormatString="Manage_Sub_Pro.aspx?Prod_Id={0} &amp;Prod_Name={1}" HeaderText="Add SubProducts" Text="Add">
            <ControlStyle BackColor="#FF9900" ForeColor="White" BorderStyle="Solid" CssClass="HyLink"/>
            <HeaderStyle BackColor="#013220" />
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
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
&nbsp;
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Sub_Cate_master.aspx.cs" Inherits="Cate_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <a href="Manage_Cate.aspx">Add Category</a><br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" Height="254px" Width="800px" DataKeyNames="Sub_Cat_Id" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" ForeColor="Black" OnRowDeleting="GridView1_RowDeleting">
        <Columns>
            <asp:BoundField DataField="Sub_Cat_Id" HeaderText="Id" ReadOnly="True">
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Sub_Cat" HeaderText="Name">
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Image">
                <EditItemTemplate>
                    <img src="Images/Sub_Cat/<%#Eval("Image") %>" style="width:80px; height:70px;" />
                    <asp:FileUpload ID="FU" runat="server" style="width:auto"/>
                </EditItemTemplate>
                <ItemTemplate>
                    <img src="Images/Sub_Cat/<%#Eval("Image") %>" style="width:80px; height:70px;" />
                </ItemTemplate>
                <HeaderStyle BackColor="#013220" />
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Status">
                 <ItemTemplate>
                     <asp:CheckBox ID="ChkEmpty" runat="server" AutoPostBack="true" OnLoad="ChkEmpty_Load" OnCheckedChanged="ChkEmpty_CheckedChanged"/>
                     <asp:Label ID="Label2" runat="server" Text="Active"></asp:Label>
                 </ItemTemplate>
                 <HeaderStyle Height="25px" BackColor="#013220" />
                 <ItemStyle Height="80px" HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
             </asp:TemplateField>
            <asp:TemplateField HeaderText="Parent Categories">
                <HeaderStyle BackColor="#013220" />
                <ItemTemplate>
                    
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:CommandField ButtonType="Button" HeaderText="Edit" ShowEditButton="True" >
            <ControlStyle BackColor="#003300" BorderColor="#003300" BorderStyle="Double" BorderWidth="5px" ForeColor="White" />
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" HeaderText="Delete" ShowDeleteButton="True">
            <ControlStyle BackColor="Red" BorderColor="Red" BorderStyle="Double" BorderWidth="5px" ForeColor="White" />
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
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


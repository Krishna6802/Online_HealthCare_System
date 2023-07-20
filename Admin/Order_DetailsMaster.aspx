<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/MasterPage.master" AutoEventWireup="true" CodeFile="Order_DetailsMaster.aspx.cs" Inherits="Admin_Order_DetailsMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" GridLines="Horizontal" Height="254px" Width="605px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <HeaderStyle BackColor="#013220" ForeColor="White"/>
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <img src="Images/Cat/<%#Eval("Image") %>" style="width:100px; height:100px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.35);" />
                </ItemTemplate>
           </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <HeaderStyle BackColor="#013220" ForeColor="White"/>
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="LblName" runat="server" Text='<%#Eval("Prod_Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size">
                <HeaderStyle BackColor="#013220" ForeColor="White"/>
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="LblSize" runat="server" Text='<%#Eval("Size") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MRP">
                <HeaderStyle BackColor="#013220" ForeColor="White"/>
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="LblMRP" runat="server" Text='<%#Eval("MRP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty">
                <ControlStyle Width="30px" />
                <HeaderStyle BackColor="#013220" ForeColor="White"/>
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="LblQty" runat="server" Text='<%#Eval("Qty") %> ' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SubTotal">
                <ControlStyle Width="30px" />
                <HeaderStyle BackColor="#013220" ForeColor="White"/>
                <ItemStyle HorizontalAlign="Center"/>
                <ItemTemplate>
                    <asp:Label ID="LblSubTot" runat="server" Text="" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Label ID="lbl_OrderId" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblGrandTot" runat="server" Text="Label"></asp:Label>

</asp:Content>


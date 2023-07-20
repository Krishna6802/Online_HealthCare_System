<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <style>
        .box {
            height:30px;
            width:280px;
            box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);
            text-align:center;
            padding:10px;
            margin-left:800px;
            color:#013220;
            background-color:white;
            font-weight:900;
            padding-top:8px;
            padding-bottom:8px;
            font-size:18px;
            border:dashed;
            border-color:#013220;
            font-family:Verdana;
        }
        </style>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" style="margin-left:200px; margin-top:30px;">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Image">
                <HeaderStyle BackColor="#013220" ForeColor="White" Height="30px" />
                <ItemStyle HorizontalAlign="Center" Height="150px" Width="150px" />
                <ItemTemplate>
                    <img src="Admin/Images/Cat/<%#Eval("Image") %>" style="width:120px; height:120px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.35);" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <HeaderStyle BackColor="#013220" ForeColor="White" HorizontalAlign="Center" />
                <ItemTemplate>
                    <asp:Label ID="LblName" runat="server" Text='<%#Eval("Prod_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="300px" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size">
                <HeaderStyle BackColor="#013220" ForeColor="White" />
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="LblSize" runat="server" Text='<%#Eval("Size") %>'></asp:Label>
                    <asp:Label ID="LblCart_Detail_Id" runat="server" Text='<%#Eval("Cart_Detail_Id") %>' Visible="false"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MRP">
                <HeaderStyle BackColor="#013220" ForeColor="White" />
                <ItemStyle HorizontalAlign="Center" Width="80px" />
                <ItemTemplate>
                    <asp:Label ID="LblMRP" runat="server" Text='<%#Eval("MRP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty">
                <ControlStyle Width="30px" />
                <HeaderStyle BackColor="#013220" ForeColor="White" />
                <ItemStyle HorizontalAlign="Center" Width="40px" />
                <ItemTemplate>
                    <asp:TextBox ID="LblQty" runat="server" TextMode="Number" Max="99" Text='<%#Eval("Qty") %> ' OnTextChanged="LblQty_TextChanged" AutoPostBack="true"></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SubTotal">
                <HeaderStyle BackColor="#013220" ForeColor="White" />
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="LblSubTot" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" ButtonType="Button">
            <ControlStyle BackColor="Red" BorderColor="Red" BorderStyle="Double" BorderWidth="5px" ForeColor="White"/>
            <HeaderStyle BackColor="#013220" ForeColor="White" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    
    <asp:Label ID="lblCart_Id" runat="server" Text="Cart_Id" Visible="False"></asp:Label>
       

        <div class="box">
            <asp:Label ID="lblGrandTot" runat="server" Text="Grand Total : "></asp:Label></div>        
       <br />
            <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" PostBackUrl="AllProducts.aspx" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="220px" Height="38px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:400px; margin-top:50px; margin-bottom:40px;"/>
            <asp:Button ID="btnProceed" runat="server" Text="Proceed To Checkout" OnClick="btnProceed_Click" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="240px" Height="38px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:80px; margin-top:50px; margin-bottom:40px;"/>
      
</asp:Content>


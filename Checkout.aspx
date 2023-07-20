<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .box {
            height:30px;
            width:300px;
            box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);
            text-align:center;
            padding:10px;
        }
        .box1 {
            height:130px;
            width:300px;
            box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);
            text-align:center;
            padding:10px;
        }
    </style>

    <style>
        .box2 {
            text-align:center;
            padding:10px;
            margin-left:800px;
            color:#013220;
            background-color:white;
            font-weight:900;
           
            font-size:18px;
            border:dashed;
            border-color:#013220;
            font-family:Verdana;
        }
        </style>

    <asp:Label ID="lbl" runat="server" Text="Label" Visible="false"></asp:Label>
    <asp:Label ID="lblCustId" runat="server" Text="Label" Visible="false"></asp:Label>

    <table><tr><td style="">
        <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" align="center" CellPadding="30" DataKeyField="Cust_Id" DataSourceID="SqlDataSource1" Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="Black" GridLines="Horizontal" style="box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); float:left; margin-top:30px;">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                
                
                <div class="box">
                Cust_Name:
                <asp:Label ID="Cust_NameLabel" runat="server" Text='<%# Eval("Cust_Name") %>' /></div>
                <br />
                <div class="box">
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' /></div>
                <br />
                <div class="box">
                Contact:
                <asp:Label ID="ContactLabel" runat="server" Text='<%# Eval("Contact") %>' /></div>
                <br />
           
            </ItemTemplate>
            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
              
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_Customer] WHERE ([Cust_Id] = @Cust_Id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblCustId" Name="Cust_Id" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:DataList ID="DataList2" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" align="center" CellPadding="30"  Font-Bold="True" Font-Names="Arial Black" Font-Size="Large" ForeColor="Black" GridLines="Horizontal" style="box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); float:right; margin-left:10px; margin-top:30px;" DataKeyField="Address_Id">
            <ItemTemplate>
              
                <div class="box">
                City:
                <asp:Label ID="City_IdLabel" runat="server" Text='<%# Eval("City_Name") %>' /></div>
                <br />
                <div class="box1">
                Address:
                <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' /></div>
            </ItemTemplate>

        </asp:DataList>

        </td>
        <td style="padding-left:100px;">
            
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
                <Columns>
                    <asp:TemplateField HeaderText="Selected Items">
                        <HeaderStyle BackColor="#013220" ForeColor="White" />
                        <ItemTemplate>
                            <img src="Admin/Images/Cat/<%#Eval("Image") %>" style="width:100px; height:100px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.35);" />
                        </ItemTemplate>
                        <ItemStyle Height="120px" Width="120px" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <HeaderStyle BackColor="#013220" ForeColor="White" />
                        <ItemTemplate>
                            <asp:Label ID="LblName" runat="server" Text='<%#Eval("Prod_Name") %>'></asp:Label><br />
                            <asp:Label ID="Label1" runat="server" Text="Qty : "></asp:Label>
                            <asp:Label ID="LblQty" runat="server" Text='<%#Eval("Qty") %> '></asp:Label><br />
                            <asp:Label ID="Label2" runat="server" Text="MRP : "></asp:Label>
                            <asp:Label ID="LblMRP" runat="server" Text='<%#Eval("MRP") %>'></asp:Label><br />
                            <asp:Label ID="Label3" runat="server" Text="SubTotal : "></asp:Label>
                            <asp:Label ID="lblSubtot" runat="server" ></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="300px" />
                    </asp:TemplateField>
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
            
            <asp:Label ID="lblGrandTot" runat="server" Text="Grand Total : "></asp:Label>
            <br />
        </td>
        </tr>
        
        <tr>
            <td>
                <asp:Button ID="btnChange" runat="server" Text="Change Address" OnClick="btnChange_Click" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:150px; margin-top:80px; margin-bottom:40px;"/></td>
           <td>    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:150px; margin-top:80px; margin-bottom:40px;"/>
            </td>
        </tr>
        </table>
</asp:Content>


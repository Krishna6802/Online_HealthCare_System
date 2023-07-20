﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Invoice.aspx.cs" Inherits="Invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <table border="0" style="height:100%; width:100%; ">
            <tr style="height:100px; background-color:#013220"><td>
                <asp:Label ID="LabelLogo" runat="server" Font-Bold="True" Font-Names="Broadway" Font-Size="30px" ForeColor="White" Text="GreatFee" style="height:100px; margin-left:580px;"></asp:Label>
                <asp:Image ID="ImageLogo" runat="server" Height="40px" ImageUrl="~/l2.png" Width="30px" />
                           
                </td></tr>
            <tr><td>
        <p style="color:#013220; font-size:18px; font-family:Verdana; font-weight:600; text-align:center">Your Order Has Been Successfully Placed !! </p>
            </td>    </tr>
            <tr>
                <td>
                    
                </td>
            </tr>
            </table>
        <asp:Panel ID="Panel1" runat="server">
            <table border="1" align="center" cellpadding="30">
                        <tr><td><p style="font-size:18px; font-family:Verdana; text-align:center; font-weight:700">GreatFeel Electronic Invoice</p></td>
                        </tr>
                        
                        <tr>
                            <td>
                                <p style="font-size:14px; font-family:Verdana;">Order Id : <asp:Label ID="lblOId" runat="server" Text="Label" style="font-size:14px; font-family:Verdana;"></asp:Label></p>
                                <p style="font-size:14px; font-family:Verdana;">Order Date : <asp:Label ID="lblODate" runat="server" Text="Label" style="font-size:14px; font-family:Verdana;"></asp:Label></p>
                                <p style="font-size:14px; font-family:Verdana; ">Address : <asp:Label ID="lblAdd" runat="server" Text="Label" style="font-size:14px; font-family:Verdana;"></asp:Label></p>
                                <p style="font-size:14px; font-family:Verdana; ">Payment Type : <asp:Label ID="lblPayType" runat="server" Text="Label" style="font-size:14px; font-family:Verdana;"></asp:Label></p>
                                <p style="font-size:14px; font-family:Verdana;">Payment Status : <asp:Label ID="lblPayStatus" runat="server" Text="Label" style="font-size:14px; font-family:Verdana;"></asp:Label></p>
                                <p style="font-size:14px; font-family:Verdana;">Order Status : Panding</p>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top:30px; ">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Name">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" ForeColor="#013220" Font-Names="Verdana" Height="50px"/>
                <ItemTemplate>
                    <asp:Label ID="LblName" runat="server" Text='<%#Eval("Prod_Name") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="400px" Height="30px"/>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Size">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" ForeColor="#013220" Font-Names="Verdana"/>
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="LblSize" runat="server" Text='<%#Eval("Size") %>'></asp:Label>
                   
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="MRP">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" ForeColor="#013220" Font-Names="Verdana"/>
                <ItemStyle HorizontalAlign="Center" Width="80px" />
                <ItemTemplate>
                    <asp:Label ID="LblMRP" runat="server" Text='<%#Eval("MRP") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Qty">
                <ControlStyle Width="30px" />
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" ForeColor="#013220" Font-Names="Verdana"/>
                <ItemStyle HorizontalAlign="Center" Width="40px" />
                <ItemTemplate>
                    <asp:Label ID="LblQty" runat="server" Text='<%#Eval("Qty") %> ' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="SubTotal">
                <HeaderStyle HorizontalAlign="Center" Font-Bold="true" ForeColor="#013220" Font-Names="Verdana"/>
                <ItemStyle HorizontalAlign="Center" Width="100px" />
                <ItemTemplate>
                    <asp:Label ID="LblSubTot" runat="server" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
                            
                </td>
            </tr>
            <tr><td><div class="box">
            <asp:Label ID="lblGrandTot" runat="server" Text="Grand Total : " style="margin-left:200px;"></asp:Label></div>  </td></tr>
                <tr><td><pre>Declaration : We declare that this invoice shows actual price of the goods described inclusive of taxes
              and all particulars are true and correct. Incase you find selling price on this invoice to 
              be more than MRP mentioned on product,Please inform us on greatfeel@gmail.com</pre>
                    <p style="font-size:15px; font-family:Verdana; text-align:center; font-weight:600">THIS IS COMPUTER GENERATED INVOICE AND DOES NOT REQUIRED SIGNATURE</p>
                    </td></tr>
            </table>
        </asp:Panel>
                    
        <asp:Button ID="btnDownload" runat="server" Text="Download" OnClick="btnDownload_Click" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:550px; margin-top:80px; margin-bottom:20px;"/>
        <asp:Button ID="Button1" runat="server" Text="Back" PostBackUrl="~/CustHome.aspx" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:550px; margin-top:10px; margin-bottom:40px;"/>
    </div>
    </form>
</body>
</html>

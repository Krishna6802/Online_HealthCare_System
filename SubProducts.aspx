<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="SubProducts.aspx.cs" Inherits="SubProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblHeading" runat="server" Text="SubProducts" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:550px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="Sub_Prod_Id" RepeatDirection="Horizontal" HorizontalAlign="Center" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="text-align:center; height:300px; width:250px;" class="auto-style2">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# "Admin/Images/Cat/"+Eval("Image") %>' style="height:300px; width:250px; border-radius:40px 0px 0px 0px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.35);"/>
                    </td>
                    <td style="text-align: left; padding:20px;" >
                     <b style="font-family:Verdana; font-size:16px; font-weight:600">Product Name : <asp:Label ID="Label2" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label></b><br /><br />
                     <p style="font-family:Verdana; font-size:14px; font-weight:500">Description : <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'></asp:Label></p><br />
                     <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>' Visible="false"></asp:Label>
                        <br />
                        
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" class="auto-style2">
                       <b style="font-family:Verdana; font-size:16px; font-weight:600; color:#013220"><asp:Label ID="Label4" runat="server" Text='<%# "Price : "+ Eval("MRP") %>'></asp:Label></b><br />
                    </td>
                    <td></td>
                        
                        
                </tr>
            </table>
          
        </ItemTemplate>
    </asp:DataList>

    <br />
     <asp:Label ID="lblStock" runat="server" Text="Size" style="margin:560px; font-family:Verdana; font-size:16px; font-weight:600"></asp:Label><br /><br />
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Size" DataValueField="Size" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" AutoPostBack="true" style="margin-left:550px">
    </asp:RadioButtonList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT [Size] FROM [tbl_Sub_Prod] WHERE ([Prod_Id] = @Prod_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Prod_Id" QueryStringField="Prod_Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:TextBox ID="TxtQty" runat="server" Text="1" TextMode="Number" max="99" Width="80px" Height="35px" style="margin-left:550px; border:none; background-color:#dcdcdc; border-radius:10px 10px 10px 10px; font-size:22px; text-align:center; font-weight:500" ></asp:TextBox>
    <asp:Button ID="btnCart" runat="server" Text="Add to Cart" OnClick="btnCart_Click" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); "/><br />

    <asp:Label ID="lbl_ProdId" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:Label ID="lbl_SubProdId" runat="server" Text="lbl" Visible="False"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblCartId" runat="server" Text="Cart_Id" Visible="False"></asp:Label>
    <br />
</asp:Content>


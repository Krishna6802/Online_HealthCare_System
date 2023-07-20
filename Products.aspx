﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblHeading" runat="server" Text="Products" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:550px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />

    <asp:DataList ID="DLProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" >
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="text-align: center; height:300px; width:250px; padding-right:70px; border-radius:40px 0px 0px 0px;" >
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "Admin/Images/Cat/"+Eval("Image") %>' PostBackUrl='<%#"SubProducts.aspx?Prod_Id="+Eval("Prod_Id")+"&Prod_Name="+Eval("Prod_Name") %>' style="height:300px; width:250px; border-radius:40px 0px 0px 0px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; padding-right:80px;">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Prod_Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center; padding-right:80px;"><br />
                        <asp:Button ID="Button1" runat="server" Text="View Product" PostBackUrl='<%#"SubProducts.aspx?Prod_Id="+Eval("Prod_Id")+"&Prod_Name="+Eval("Prod_Name") %>' Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); "/>
                        <br /><br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br /><br />
    <asp:Label ID="lbl" runat="server" Text="Label" Visible="False"></asp:Label>

</asp:Content>


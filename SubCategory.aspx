<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="SubCategory.aspx.cs" Inherits="SubCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <asp:Label ID="lblHeading" runat="server" Text="All Categories" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:550px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />

    <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="Sub_Cat_Id">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="text-align: center; height:400px; width:400px; padding-right:40px; border-radius:20px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "Admin/Images/Sub_Cat/"+Eval("Image") %>' PostBackUrl='<%#"Products.aspx?Sub_Cat_Id="+Eval("Sub_Cat_Id")+"&Sub_Cat_Name="+Eval("Sub_Cat") %>' style="height:400px; width:380px; border-radius:20px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Sub_Cat") %>'></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    
    </asp:DataList>
    <br />
    <asp:Label ID="lblCatId" runat="server" Text="Label" Visible="False"></asp:Label>
</asp:Content>


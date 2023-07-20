<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="AllCategories.aspx.cs" Inherits="AllCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
   
    <asp:Label ID="Label2" runat="server" Text="All Categories" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:550px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />

    <asp:DataList ID="DataList1" runat="server" DataKeyField="Cat_Id" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="text-align: center; height:400px; width:380px; padding-right:40px; border-radius:20px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "Admin/Images/Cat/"+Eval("Image") %>' PostBackUrl='<%#"SubCategory.aspx?Cat_Id="+Eval("Cat_Id")+"&Cat_Name="+Eval("Cat") %>'  style="height:400px; width:380px; border-radius:20px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Cat") %>' Font-Names="verdana"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_Categories] WHERE ([IsAct] = @IsAct)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="IsAct" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Manage_Cate.aspx.cs" Inherits="Manage_Cate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table id="tbl" runat="server" cellpadding="6" cellspacing="0" border ="0" width="700px" style="background-color:#DAF7A6;">
        <tr align="left" valign="top">
            <td align="center" valign="top" colspan="2">
                <h3 id="lblMsg" runat="server" visible="True" style="font-family:Verdana, Geneva, Tahoma, sans-serif; color:#FFFFFF; font-weight: 800; text-align: center; background-color: #013220;">Add Category</h3>
            </td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">Name : </td>
            <td align="left" valign="top">
                <asp:TextBox ID="tbCatName" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valReqCatName" runat="server" ControlToValidate="tbCatName" ErrorMessage="Category name is required" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">Image: </td>
            <td align="left" valign="top">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Label ID="lblImageErr" runat="server" Font-Names="Verdana" ForeColor="Red"></asp:Label>
            </td>
        </tr>

        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;</td>
            <td align="left" valign="top">
                <asp:Button ID="btn_Add" runat="server" Text="Add" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" OnClick="btn_Add_Click" OnClientClick="return onInsert()" />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="btn_Reset" runat="server" Text="Reset" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" />
            </td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
        </tr>
    </table>
</asp:Content>


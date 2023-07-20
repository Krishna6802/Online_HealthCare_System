<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="CustLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <center>
     <table id="tbl" runat="server" cellpadding="6" cellspacing="0" border ="0" width="75%" style="background-color:#DAF7A6;">

            <tr align="left" valign="top">
               <td align="center" valign="top" colspan="2">
                  
                   <h3 id="lblMsg" runat="server" visible="True" style="font-family:Verdana, Geneva, Tahoma, sans-serif; color:#FFFFFF; font-weight: 800; text-align: center; background-color: #013220;">Admin Login</h3>
               </td>   
           </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> UserName : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbUser" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqUserName" runat="server" ControlToValidate="tbUser" ErrorMessage="UserName is Required " Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator> 
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> Password : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbPass" runat="server" TextMode="Password" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqPass" runat="server" ControlToValidate="tbPass" ErrorMessage="Password is Required " Display="Dynamic" Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%">&nbsp;</td>
               <td align="left" valign="top">
                   &nbsp;</td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%">&nbsp;</td>
               <td align="left" valign="top">
                  <asp:Button ID="btn_Login" runat="server" Text="Login" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" OnClick="btn_Login_Click" />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="btn_Reset" runat="server" Text="Reset" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" />
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%">&nbsp;</td>
               
          </tr>
         
       </table>
            </center>
    </div>
</asp:Content>


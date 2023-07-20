<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="CustRegister.aspx.cs" Inherits="CustRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        <center>
     <table id="tbl" runat="server" cellpadding="6" cellspacing="0" border ="0" width="75%" style="background-color:#DAF7A6;">

            <tr align="left" valign="top">
               <td align="center" valign="top" colspan="2">
                  
                   <h3 id="lblMsg" runat="server" visible="True" style="font-family:Verdana, Geneva, Tahoma, sans-serif; color:#FFFFFF; font-weight: 800; text-align: center; background-color:#013220;">Customer Registration</h3>
               </td>   
           </tr>

           <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> UserName : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbName" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqName" runat="server" ControlToValidate="tbName" ErrorMessage="User Name is Required " Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator> 
               </td>   
          </tr>

          
            <tr>
               <td align="right" valign="top" style="width:40%;"> Select Country :</td>
               <td align="left" valign="top">
                   <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Country_Name" DataValueField="Country_Id" >
                       <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_Country] WHERE ([Country_IsAct] = @Country_IsAct)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="true" Name="Country_IsAct" Type="Boolean" />
                       </SelectParameters>
                   </asp:SqlDataSource>
            
                   <asp:RequiredFieldValidator ID="valReqCountry" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Please Select Country" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%;"> Select State : </td>
               <td align="left" valign="top">
                   <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="State_Name" DataValueField="State_Id" >
                       <asp:ListItem Value="0">--Select State--</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_State] WHERE (([State_IsAct] = @State_IsAct) AND ([Country_Id] = @Country_Id))">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="true" Name="State_IsAct" Type="Boolean" />
                           <asp:ControlParameter ControlID="ddlCountry" Name="Country_Id" PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
            
                   <asp:RequiredFieldValidator ID="valReqState" runat="server" ControlToValidate="ddlState" ErrorMessage="Please Select State" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </td>  
          </tr>

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%;"> Select City : </td>
               <td align="left" valign="top">
                   <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="City_Name" DataValueField="City_Id" >
                       <asp:ListItem Value="0">--Select City--</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_City] WHERE (([City_IsAct] = @City_IsAct) AND ([State_Id] = @State_Id))">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="true" Name="City_IsAct" Type="Boolean" />
                           <asp:ControlParameter ControlID="ddlState" Name="State_Id" PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
            
                   <asp:RequiredFieldValidator ID="valReqCity" runat="server" ControlToValidate="ddlCity" ErrorMessage="Please Select City" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>  
          </tr>

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%;"> Address : </td>
               <td align="left" valign="top">
                <asp:TextBox ID="tbAddress" runat="server" TextMode="MultiLine" style="resize:none; height: 155px; width: 343px;" cols="20" rows="1"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqAddress" runat="server" ControlToValidate="tbAddress" ErrorMessage="Address is Required " Display="Dynamic" Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>  
          </tr>

         

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> E-mail : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbEmail" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="E-mail is Required " Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ErrorMessage="Please Enter Valid E-mail Id" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Font-Size="Medium"></asp:RegularExpressionValidator>
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> Contact No. : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbContact" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqContact" runat="server" ControlToValidate="tbContact" ErrorMessage="Contact No is Required " Display="Dynamic" Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbContact" ErrorMessage="Please Enter Valid Contact Number" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^([0-9]{10})$"></asp:RegularExpressionValidator>
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> Password Policy : </td>
               <td align="left" valign="top">
                   Password must contain Minimum 8 digits, atleast 1 Uppercase alphabet, 1 Lowercase Alphabet, 1 Number & 1 Special Character($,@,!,%,*,?,&)
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%"> Password : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbPass" runat="server" TextMode="Password" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqPass" runat="server" ControlToValidate="tbPass" ErrorMessage="Password is Required " Display="Dynamic" Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbPass" ErrorMessage="Password must be according to Password Policy" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&amp;])[A-Za-z\d$@$!%*?&amp;]{8,}"></asp:RegularExpressionValidator>
               </td>   
          </tr>

           <tr align="left" valign="top">
               <td align="right" valign="top"> Confirm Password : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="tbCpass" runat="server" TextMode="Password" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
            
                   <asp:RequiredFieldValidator ID="valReqCpass" runat="server" ControlToValidate="tbCpass" ErrorMessage="Confirm Password is Required " Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="valCmpCPass" runat="server" ControlToCompare="tbPass" ControlToValidate="tbCpass" ErrorMessage="Confirm Password Must Match with Password" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:CompareValidator>
               </td>   
          </tr>

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%;"> Captcha : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="txtCaptcha1" runat="server" Width="100px" ReadOnly="True" style="font-stretch:expanded; font-kerning:initial; font-size:x-large; font-weight:700; font-family:'Comic Sans MS'; text-decoration:line-through; text-align:center; text-shadow:3px 3px 5px blue; letter-spacing:3px; background-color:lightblue; color:darkblue; border-radius:5px; border-color:lightblue;"></asp:TextBox>
                </td>  
          </tr>

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%;"> Enter Captcha : </td>
               <td align="left" valign="top">
                  <asp:TextBox ID="txtCaptcha2" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                   <asp:CompareValidator ID="valCompCaptcha" runat="server" ErrorMessage="Invalid Captcha" ControlToCompare="txtCaptcha2" ControlToValidate="txtCaptcha1" Display="Dynamic" Font-size="Medium" Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True">Invalid Captcha</asp:CompareValidator>
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
                  <asp:Button ID="btn_reg" runat="server" OnClick="btn_reg_Click" Text="Register" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="btn_reg0" runat="server" OnClick="btn_reg_Click" Text="Reset" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" />
               </td>   
          </tr>

          <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%">&nbsp;</td>
               <td align="left" valign="top">
                   &nbsp;</td>   
          </tr>

       </table>
            </center>
    </div>
    

</asp:Content>


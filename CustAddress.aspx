<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="CustAddress.aspx.cs" Inherits="CustAddress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }

        .HyLink {
            text-decoration:none;
            padding:5px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbl" runat="server" Text="Cust_Id" Visible="false"></asp:Label>
    <asp:Label ID="lbl2" runat="server" Text="Cart_Id" Visible="false"></asp:Label>
<table>
    <tr>
        <td>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" DataSourceID="SqlDataSource1">
        <Columns>

            <asp:BoundField DataField="Address_Id" HeaderText="Id" >
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" Width="450px" />
            </asp:BoundField>
            
            <asp:BoundField DataField="Address" HeaderText="Address" >
            <HeaderStyle BackColor="#013220" />
            <ItemStyle HorizontalAlign="Center" Width="450px" />
            </asp:BoundField>

            <asp:HyperLinkField DataNavigateUrlFields="Address_Id" DataNavigateUrlFormatString="Checkout.aspx?Address_Id={0}"  Text="Set" ControlStyle-CssClass="HyLink">
            
            <ControlStyle BackColor="#6666FF" ForeColor="White" BorderStyle="Solid" CssClass="HyLink" BorderColor="#6666FF" BorderWidth="5px"/>
            <HeaderStyle BackColor="#013220" />
            </asp:HyperLinkField>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_Address] WHERE ([Cust_Id] = @Cust_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Cust_Id" QueryStringField="Cust_Id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    
        </td>
        <td>
            <table style="margin-left:100px;">

                <tr>
               <td valign="top" style="width:40%; color:#013220; font-size:16px; font-family:Verdana; font-weight:600;" class="auto-style1"> &nbsp;</td>
               <td align="left" valign="top">
                   <asp:DropDownList ID="ddlCountry" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Country_Name" DataValueField="Country_Id" style="box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-bottom:10px; border:none; height:20px;" >
                       <asp:ListItem Value="0">--Select Country--</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_Country] WHERE ([Country_IsAct] = @Country_IsAct)">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="true" Name="Country_IsAct" Type="Boolean" />
                       </SelectParameters>
                   </asp:SqlDataSource>
            
                   <asp:RequiredFieldValidator ID="valReqCountry" runat="server" ControlToValidate="ddlCountry" ErrorMessage="Please Select Country" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>  
            </tr>
            

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%; color:#013220; font-size:16px; font-family:Verdana; font-weight:600; text-align: left;"> &nbsp;</td>
               <td align="left" valign="top">
                   <asp:DropDownList ID="ddlState" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="State_Name" DataValueField="State_Id" style="box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-bottom:10px; border:none; height:20px;">
                       <asp:ListItem Value="0">--Select State--</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_State] WHERE (([State_IsAct] = @State_IsAct) AND ([Country_Id] = @Country_Id))">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="true" Name="State_IsAct" Type="Boolean" />
                           <asp:ControlParameter ControlID="ddlCountry" Name="Country_Id" PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
            
                   <asp:RequiredFieldValidator ID="valReqState" runat="server" ControlToValidate="ddlState" ErrorMessage="Please Select State" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
               </td>  
          </tr>

         <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%; color:#013220; font-size:16px; font-family:Verdana; font-weight:600; text-align: left;"> &nbsp;</td>
               <td align="left" valign="top">
                   <asp:DropDownList ID="ddlCity" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="City_Name" DataValueField="City_Id" style="box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-bottom:10px; border:none; height:20px;">
                       <asp:ListItem Value="0">--Select City--</asp:ListItem>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_City] WHERE (([City_IsAct] = @City_IsAct) AND ([State_Id] = @State_Id))">
                       <SelectParameters>
                           <asp:Parameter DefaultValue="true" Name="City_IsAct" Type="Boolean" />
                           <asp:ControlParameter ControlID="ddlState" Name="State_Id" PropertyName="SelectedValue" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
            
                   <asp:RequiredFieldValidator ID="valReqCity" runat="server" ControlToValidate="ddlCity" ErrorMessage="Please Select City" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>  
          </tr>

                <tr align="left" valign="top">
               <td align="right" valign="top" style="width:40%; color:#013220; font-size:16px; font-family:Verdana; font-weight:600; text-align: left;">Enter New Address : </td>
               <td align="left" valign="top">
                <asp:TextBox ID="tbAddress" runat="server" TextMode="MultiLine" style="resize:none; height: 155px; width: 343px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);" cols="20" rows="1"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="valReqAddress" runat="server" ControlToValidate="tbAddress" ErrorMessage="Address is Required " Display="Dynamic" Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>  
          </tr>
            </table>

            <asp:Button ID="btnAdd" runat="server" Text="Add Address" OnClick="btnAdd_Click" Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:370px; margin-top:80px; margin-bottom:40px;"/>
        </td>
</tr>
</table>
</asp:Content>


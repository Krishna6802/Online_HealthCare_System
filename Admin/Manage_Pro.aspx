<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="Manage_Pro.aspx.cs" Inherits="Manage_Cate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #TextArea1 {
            height: 159px;
            width: 336px;
        }
        .auto-style1 {
            height: 53px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table id="tbl" runat="server" cellpadding="6" cellspacing="0" border ="0" width="700px" style="background-color:#DAF7A6;">
        <tr align="left" valign="top">
            <td align="center" valign="top" colspan="2" class="auto-style1">
                <h3 id="lblMsg" runat="server" visible="True" style="font-family:Verdana, Geneva, Tahoma, sans-serif; color:#FFFFFF; font-weight: 800; text-align: center; background-color: #013220;">Add Product</h3>
            </td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">Name : </td>
            <td align="left" valign="top">
                <asp:TextBox ID="tbProName" runat="server" Width="180px" BorderStyle="None" Height="20px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valReqroName" runat="server" ControlToValidate="tbProName" ErrorMessage="Product name is required" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">Sub Category : </td>
            <td align="left" valign="top">
                <asp:DropDownList ID="ddlSub_Cate" runat="server">
                </asp:DropDownList>
                &nbsp;<asp:RequiredFieldValidator ID="valReqSubCat" runat="server" ControlToValidate="ddlSub_Cate" ErrorMessage="Please select Sub Category" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;Brand :</td>
            <td align="left" valign="top">
                <asp:DropDownList ID="ddlBrand" runat="server">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="valReqBrand" runat="server" ControlToValidate="ddlBrand" ErrorMessage="Please Select Brand " Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
            </td>
        </tr>

        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">Consumer : </td>
            <td align="left" valign="top">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                    <Columns>
                        <asp:BoundField DataField="Consumer_Id" HeaderText="ID" >
                        <HeaderStyle BackColor="#013220" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Consumer_type" HeaderText="Consumers" >
                        <HeaderStyle BackColor="#013220" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Select Consumers">
                            <HeaderTemplate>
                                <asp:CheckBox ID="ChkHeader" runat="server" AutoPostBack="true" Text="Select All" OnCheckedChanged="ChkHeader_CheckedChanged"/>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="ChkItem" runat="server" OnCheckedChanged="ChkItem_CheckedChanged"/>
                            </ItemTemplate>
                            <HeaderStyle BackColor="#013220" />
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
                </td>
        </tr>

        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">Description : </td>
            <td align="left" valign="top">
                <asp:TextBox ID="tbProDesc" runat="server" TextMode="MultiLine" style="resize:none; height: 155px; width: 343px;" cols="20" rows="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="valReqProDesc" runat="server" ControlToValidate="tbProDesc" ErrorMessage="Product Description is required" Display="Dynamic"  Font-Names="Verdana" ForeColor="Red" SetFocusOnError="True" Font-Size="Medium"></asp:RequiredFieldValidator>
                </td>
        </tr>

        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;</td>
            <td align="left" valign="top">&nbsp;</td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;</td>
            <td align="left" valign="top">
                <asp:Button ID="btn_Add" runat="server" Text="Add" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" OnClick="btn_Add_Click" />
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Button ID="btn_Reset" runat="server" Text="Reset" BackColor="#013220" BorderStyle="None" Font-Bold="True" Font-Names="Verdana" Font-Size="Medium" ForeColor="White" Height="40px" Width="120px" />
            </td>
        </tr>
        <tr align="left" valign="top">
            <td align="right" valign="top" style="width:200px">&nbsp;</td>
            <td align="left" valign="top">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>


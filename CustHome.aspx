<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="CustHome.aspx.cs" Inherits="CustHome" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

.slideshow-container {
  max-width: 1200px;
  position: relative;
  margin-left: 70px;
}

.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

    .Container {
        height:500px;
        width:1300px;
        border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); 
    }
    .Container1 {
        height:600px;
        width:1300px;
        border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); 
    }

</style>
</head>
<body>

<div class="slideshow-container">

<div class="mySlides fade">
  <img src="Slider/b3.jpg" style="width:1200px; height:400px;" />
</div>

<div class="mySlides fade">
  <img src="Slider/b2.jpg" style="width:1200px; height:400px;" />
</div>

<div class="mySlides fade">
  <img src="Slider/b1.jpg" style="width:1200px; height:400px;" />
</div>

<div class="mySlides fade">
  <img src="Slider/b4.jpg" style="width:1200px; height:400px;" />
</div>

<div class="mySlides fade">
  <img src="Slider/b5.jpg" style="width:1200px; height:400px;" />
</div>

<div class="mySlides fade">
  <img src="Slider/b9.jpg" style="width:1200px; height:400px;" />
</div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
  <span class="dot" onclick="currentSlide(4)"></span> 
  <span class="dot" onclick="currentSlide(5)"></span> 
  <span class="dot" onclick="currentSlide(6)"></span> 
</div>

<script>
    var slideIndex = 1;
    showSlides(slideIndex);

    function plusSlides(n) {
        showSlides(slideIndex += n);
    }

    function currentSlide(n) {
        showSlides(slideIndex = n);
    }

    function showSlides(n) {
        var i;
        var slides = document.getElementsByClassName("mySlides");
        var dots = document.getElementsByClassName("dot");
        if (n > slides.length) { slideIndex = 1 }
        if (n < 1) { slideIndex = slides.length }
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        for (i = 0; i < dots.length; i++) {
            dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex - 1].style.display = "block";
        dots[slideIndex - 1].className += " active";
    }
</script>

</body>
</html> 

    <br />

    <asp:Label ID="Label2" runat="server" Text="Categories" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:550px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />
    <div class="Container">
<asp:DataList ID="DataList1" runat="server" DataKeyField="Cat_Id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="text-align: center; height:350px; width:250px; padding-right:70px; border-radius:20px;">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# "Admin/Images/Cat/"+Eval("Image") %>' PostBackUrl='<%#"SubCategory.aspx?Cat_Id="+Eval("Cat_Id")+"&Cat_Name="+Eval("Cat") %>'  style="height:300px; width:250px; border-radius:20px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);"/>
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
    <br /><br />
    <asp:Button ID="btnAllCat" runat="server" Text="View All" PostBackUrl='AllCategories.aspx' Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:550px"/>
    <br /><br /><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT TOP 4 [Cat_Id], [Cat], [Image], [IsAct] FROM [db_ecare].[dbo].[tbl_Categories] WHERE ([IsAct] = @IsAct)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="IsAct" Type="Boolean" />
        </SelectParameters>
        </asp:SqlDataSource>
        </div>
<br />
    <asp:Label ID="Label3" runat="server" Text="Products" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:550px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />
    <div class="Container1">
    <asp:DataList ID="DLProducts" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" >
        <ItemTemplate>
            <table class="auto-style1">
                <tr>
                    <td style="text-align: center; height:350px; width:250px; padding-right:70px; border-radius:40px 0px 0px 0px;" >
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
                        <br />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br /><br />
    <asp:Button ID="btnAllPro" runat="server" Text="View All" PostBackUrl='AllProducts.aspx' Font-Size="16px" Font-Names="verdana" BackColor="#013220" ForeColor="White" Font-Bold="true" Width="200px" Height="35px" BorderStyle="None" style="border-radius:30px 30px 30px 30px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25); margin-left:550px"/>
        </div>
    <br /><br />
    <asp:Label ID="lbl" runat="server" Text="Label" Visible="False"></asp:Label>

    <asp:Label ID="Label4" runat="server" Text="Brands" ForeColor="#013220" Font-Bold="True" align="center" style="margin-left:600px; margin-right:300px; padding-top:10px; padding-bottom:10px; font-weight:900" Font-Names="verdana" Font-Size="30px"></asp:Label><br /><br />

    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="7">
        <ItemTemplate>
            <table>
                <tr>
                    <td style="text-align: center; height:250px; width:400px; padding-right:30px; border-radius:20px;">
                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# "Admin/Images/Brands/"+Eval("Image") %>' PostBackUrl='<%#"Brand.aspx?Brand_Id="+Eval("Brand_Id")+"&Brand="+Eval("Brand") %>' style="height:100px; width:140px; border-radius:20px; box-shadow:0 0.5rem 1.5rem rgba(0, 0, 0, 0.25);"/>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:db_ecareConnectionString %>" SelectCommand="SELECT * FROM [tbl_Brand] WHERE ([IsAct] = @IsAct)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="IsAct" Type="Boolean" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />

    

</asp:Content>


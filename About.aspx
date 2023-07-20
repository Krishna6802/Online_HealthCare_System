<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage(User).master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
#wrapper {
  width: 1249px;
  margin: 0 auto;
 position: relative; 
}

#textbox {
  margin-top:12px;
  background: linear-gradient(rgba(0,0,0,1), rgba(0,0,0,1));
  position: absolute;
  width: 1249px;
  height: 400px;
  top: -12px;
  opacity: 0.8;
}

#content {
  padding: 100px 30px;
  color:white;
}

</style>
<?php
require 'top.php';
?>

<div id="wrapper">
    <img src="Admin/Images/About/h2.webp" style="height:400px; width:1249px;" />
    <div id="textbox">
      <div id="content">
        <p align="center" style="font-size:45px; font-family:KarlaJohnson8 HeavyCursiveSH;">Where care comes first</p><br>
        <p align="center" style="font-size:18px; font-family:KarlaJohnson8 HeavyCursiveSH; word-spacing: 5px;">
          Together, we are working toward a healthier community !!
        </p>
      </div>
    </div>
  </div>

<div style="height:400px; width:1349px; background-color:#F0F0F0; color:#013220; word-spacing: 2px; font-weight:900; font-size:23px;">
<pre align="center" style="font-family:KarlaJohnson8 HeavyCursiveSH; padding:40px;">" Not just better healthcare,
but a better healthcare experience "</pre>
<img src="Admin/Images/About/nature-is-good-seal.webp" style="height:200px; width:200px; margin-left:400px;" />
<img src="Admin/Images/About/here-for-your-health-seal.webp" style="height:200px; width:200px; margin-left:150px;" />
</div>

<div style="background-color:#013220 ; height:300px; width:1349px; color:white;">
<br><br><br>
<h1 align="center" style="font-family:KarlaJohnson8 HeavyCursiveSH;"> Why To Choose Us ??</h1>
<style>
.btn3
{
   width: 200px;
   border-radius:25px;
   color: white;
   padding: 10px 0px;
   text-align: center;
   text-decoration: none;
   font-size: 15px;
   margin: 0px 10px;
   cursor: pointer;
   transition: background 0.5s; 
   border: 2px solid white;
   background: transparent;
}
</style>
<a href="#why_us"><button type="button" class="btn3" style="margin-left:580px; margin-top:50px;">Know More</button></a>
</div>

<div style="height:500px; width:1299px; margin:50px; font-family:KarlaJohnson8 HeavyCursiveSH;">
<div style="height:400px; width:600px; background-color:#F0F0F0; color:#013220 ; word-spacing: 2px; font-weight:900; font-size:23px; float:left; margin-right:50px;">
<h2 align="center" style="padding:20px;">Our Mission is Life</h2><br>
<p style="text-align: justify; padding:30px; font-size:19px; word-spacing:8px;">"Great feel is on a mission to make quality healthcare affordable and accessible for over a billion+ Indians.We believe in empowering our users with the most accurate, comprehensive, and curated information and care, enabling them to make better healthcare decisions."</p>
</div>
<div style="height:400px; width:600px; float:left;"><img src="Admin/Images/About/mission.jpg" style="height:400px; width:600px;" /></div>
</div>

<div style="height:500px; width:1299px; margin:50px; font-family:KarlaJohnson8 HeavyCursiveSH;">
<div style="height:400px; width:600px; float:left; margin-right:50px;"><img src="Admin/Images/About/story.jpg" style="height:400px; width:600px;" /></div>
<div style="height:400px; width:600px; background-color:#F0F0F0; color:#013220 ; word-spacing: 2px; font-weight:900; font-size:23px; float:left;">
<h2 align="center" style="padding:20px;">Our Story</h2><br>
<p style="text-align: justify; padding:30px; font-size:19px; word-spacing:8px;">"It is the journey that takes you to new destinations every day with endless possibilities of life on the back of happiness, energy, and hope. Great feel wants to make this journey easy for every Indian and help them live healthier and longer lives."</p>
</div>
</div>

<div style="height:500px; width:1299px; margin:50px; font-family:KarlaJohnson8 HeavyCursiveSH;">
<div style="height:400px; width:600px; background-color:#F0F0F0; color:#013220 ; word-spacing: 2px; font-weight:900; font-size:23px; float:left; margin-right:50px;">
<h2 align="center" style="padding:20px;">How We Work</h2><br>
<p style="text-align: justify; padding:30px; font-size:19px; word-spacing:8px;">" We provide the fastest delivery of medical products at your doorstep without any extra delivery charges.
We provide hassle-free customer services and solve respective queries within a short period of time in a professional manner , because we value your time! "</p>
</div>
<div style="height:400px; width:600px; float:left;"><img src="Admin/Images/About/work.jpg" style="height:400px; width:600px;" /></div>
</div>

<div id="Div1">
    <img src="Admin/Images/About/bg23.jpeg" style="height:400px; width:1349px;" />
    <div id="Div2">
      <div id="Div3">
        <h1 align="center" style="font-size:45px; font-family:KarlaJohnson8 HeavyCursiveSH;">A Passion for Healing</h1><br>
        <p align="center" style="font-size:18px; font-family:KarlaJohnson8 HeavyCursiveSH; word-spacing: 5px; color:#013220;" >
          Dedicated to Hope, Healing, and Recovery. Committed to Care. 
        </p>
      </div>
    </div>
  </div>

<a id="why_us"></a>
<div style="height:500px; width:1349px; background-color:#F0F0F0; color:#013220; word-spacing: 2px; font-weight:900; font-size:23px;">
<h2 style="font-family:KarlaJohnson8 HeavyCursiveSH; padding:40px;" align="center">We are Right Where You Need Us</h2>
<p align="center" style="font-family:KarlaJohnson8 HeavyCursiveSH; padding:40px; text-align: justify; word-spacing:10px; font-size:19px;">We provide fastest delivery of the Healthcare prodoucts at your doorstep without any Extra charges. Consumers can see almost every possible Healthcare products at this place with different Size options. GreatFeel Provides Natural & Organic Products which are beneficial for Health.  </p>
<h4 align="center" style="font-family:KarlaJohnson8 HeavyCursiveSH; padding:40px;">"Growing to Meet Your Needs"</h4>


</div>

    </div>
</asp:Content>


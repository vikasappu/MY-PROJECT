<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
    <img src="images/vtwologo.jpg">

</div>

<div class="topnav">
    <a href="index.jsp">Home</a>
    <a href="allproducts.jsp">Product</a>
    <a href="#contact">Contact</a>
    <a href="#about">About</a>
    <div class="search-box">
        <form  action="searchitem.jsp" method="post">
            <input type="search" placeholder="Search here" name="ch">
            <button type="submit">Search</button>
        </form>
    </div>
    <div class="social-medialogo">
        <a href="//whatsapp.com"><i class="fa fa-whatsapp" aria-hidden="true"></i></a>
        <a href="//instagram.com/vikas__a_"><i class="fa fa-instagram" aria-hidden="true"></i></a>
        <a href="//Twitter.com/vikas189"><i class="fa fa-twitter" aria-hidden="true"></i></a>
    </div>
</div>
<div class="navbar">
    <a href="allhelmets.jsp">Helmets</a>
    <a href="alljackets.jsp">Jackets</a>
    <div class="dropdown">
        <button class="dropbtn">Riding Gears
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">Boots</a>
            <a href="#">Pants</a>
            <a href="#">Gloves</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Accessories
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-content">
            <a href="#">AUX Lights</a>
            <a href="#">Bike Care</a>
            <a href="#">Bike Covers</a>
            <a href="#">BMC Air filters</a>
        </div>
    </div>
</div>
<c:if test="${not empty userobj }">

<div class="acclogo">
    <a href="login.jsp"><i class="fa fa-user" aria-hidden="true"></i> ${userobj.name}</a>
    <a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
    <a href="setting.jsp"><i class="fa fa-cog" aria-hidden="true"></i></a>
    <a href="checkout.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
</div>

</c:if>

<c:if test="${empty userobj }">

<div class="acclogo">
    <a href="login.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i>  Login</a>
    <a href="register.jsp"><i class="fa fa-user" aria-hidden="true"></i>  Register</a>
     <a href="setting.jsp"><i class="fa fa-cog" aria-hidden="true"></i></a>
    <a href=""><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
</div>

</c:if>



</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="allcomponents/navbarstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/itemordersuccstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
<%@include file="allcomponents/navbar.jsp"%>
<div class="center">
<div class="icenter"><i class="fa fa-check-circle" aria-hidden="true"></i></div>

<h1>Thank You</h1>
<h2>Your Order Successfully</h2>
<h3>With in 7 Days Your Product will be Delivered In your Address</h3>
<a href="home.jsp"><button class="home">Home</button></a>
<a href=""><button class="view">View Order</button></a>
</div>
<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
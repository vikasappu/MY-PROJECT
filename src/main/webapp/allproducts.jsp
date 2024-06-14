<%@page import="com.entity.User"%>
<%@page import="com.entity.Itemdetails"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="allcomponents/navbarstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/allhelmetstyle.css">
     <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
	<%
User u =(User)session.getAttribute("userobj");
%>


<%@include file="allcomponents/navbar.jsp"%>
<div class="img-1">
		<img src="images/helmetbackgroundimg.jpg">
		<div class="top-left">
			<a class="a1" href="index.jsp">Home</a> 
			<a class="a2" href="allproducts.jsp">/Products</a>
			
		</div>
		<div href="#jj" class="centered">All Products</div>
</div>

<div class="card-container">
<%
      ItemDAOImpl dao =new ItemDAOImpl(DBConnect.getConn());
      List<Itemdetails> list= dao.getAllProducts();
      for (Itemdetails i : list){
     %>

		<div class="card-main">
			<div class="card">
				<img src="Item-Images/<%=i.getPhoto()%>" style="width:100% ;height :150px;">
				<h5><%=i.getItemName()%></h5>
				<p>Categories:<%=i.getItemCategory()%></p>
				<p class="price"><i class="fa fa-inr" aria-hidden="true"></i><%=i.getPrice()%></p>
				<p>
					<% 
				if (u==null) {
				%>
					<a href="login.jsp"><button>Add to Cart</button></a>
					<% 
				}else{
				%>
					<a href="cart?Iid=<%=i.getItemId() %>&&uid=<%=u.getId()%>"><button>Add
							to Cart</button></a>
					<%
				}
				%>

					<a href="viewitemdetails.jsp?id=<%=i.getItemId()%>"><button>View</button></a>
				</p>
			</div>
		</div>


		<%
}
%>
</div>
<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
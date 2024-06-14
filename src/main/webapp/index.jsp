<%@page import="com.entity.User"%>
<%@page import="com.entity.Itemdetails"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" type="text/css"
	href="allcomponents/navbarstyle.css">
<link rel="stylesheet" type="text/css"
	href="allcomponents/indexstyle.css">
<link rel="stylesheet" type="text/css"
	href="allcomponents/footerstyle.css">
</head>
<body>

	<%
User u =(User)session.getAttribute("userobj");
%>


	<%@include file="allcomponents/navbar.jsp"%>

	<div class="img-1">
		<img src="images/img 1.jpg">
		<div class="top-left">
			<a class="a1" href="index.jsp">Home</a> <a class="a2"
				href="allproducts.jsp">/Product</a> <a class="a3" href="a">/About</a>
		</div>

		<div href="#jj" class="centered">Bike Accessories</div>
	</div>
	
	
<c:if test="${not empty succMsg }">
		<div class="alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	 <c:if test="${not empty failedMsg}">
  <div class="alert-danger" role="alert">${failedMsg}</div>
  <c:remove var="failedMsg" scope="session"/>
 </c:if>
 
	<div class="card-container">
		<%
      ItemDAOImpl dao =new ItemDAOImpl(DBConnect.getConn());
      List<Itemdetails> list= dao.getNewItem();
      for (Itemdetails i : list){
     %>

		<div class="card-main">
			<div class="card">
				<img src="Item-Images/<%=i.getPhoto()%>"
					style="width: 100%; height: 150px;">
				<h5><%=i.getItemName()%></h5>
				<p>
					Categories:<%=i.getItemCategory()%></p>
				<p class="price">
					<i class="fa fa-inr" aria-hidden="true"></i><%=i.getPrice()%></p>
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
<%
ItemDAOImpl dao2= new  ItemDAOImpl(DBConnect.getConn());
List<Itemdetails>list2 = dao2.getAllItems();
for (Itemdetails i : list2 )
{
	%>

		<div class="card-main">
			<div class="card">
				<img src="Item-Images/<%=i.getPhoto() %>"
					style="width: 100%; height: 150px;">
				<h5><%=i.getItemName() %></h5>
				<p>
					Categories:
					<%=i.getItemCategory() %></p>
				<p class="price">
					<i class="fa fa-inr" aria-hidden="true"></i><%=i.getPrice() %></p>

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

				<a href="viewitemdetails.jsp?Iid=<%=i.getItemId()%>"><button>View</button></a>
			</div>
		</div>
		<%
}
%>
	</div>

	<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
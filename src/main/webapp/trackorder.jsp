<%@page import="com.entity.Itemorder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemorderImpl"%>
<%@page import="com.DAO.ItemDAOImpl"%>
<%@page import="com.entity.User"%>
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
    <link rel="stylesheet" type="text/css" href="allcomponents/trackorderstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
 <c:if test="${empty userobj}">
 <c:redirect url="login.jsp"></c:redirect>
 </c:if>

 <%@include file="allcomponents/navbar.jsp"%>
 <table class="center-table">
<thead>
<tr>
<th> Order id</th>
<th>Name</th>
<th>Item-Name</th>
<th>Price</th>
<th>Payment-Type</th>
</tr>
</thead>
<tbody>

<%
User u= (User) session.getAttribute("userobj");
ItemorderImpl dao = new ItemorderImpl(DBConnect.getConn());
List<Itemorder> ilist =dao.getItem(u.getEmail());
for(Itemorder i :ilist)
{%>
<tr>
<td><%=i.getOrderid() %></td>
<td><%=i.getUserName()%></td>
<td><%=i.getItemname() %></td>
<td><%=i.getPrice() %></td>
<td><%=i.getPaymentType() %></td>

</tr>
	
<%}

%>


</tbody>
</table>
 <%@include file="allcomponents/footer.jsp"%>
</body>
</html>
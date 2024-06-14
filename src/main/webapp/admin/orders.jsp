<%@page import="com.entity.Itemorder"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemorderImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin-All Books</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="navbarstyle.css">
     <link rel="stylesheet" type="text/css" href="orderstyle.css">
</head>
<body>
<c:if test="${empty userobj}">
      <c:redirect url="../login.jsp"/>
   </c:if>
<%@include file="navbar.jsp" %>
<h2>Hello,Admin</h2>
<table><thead>
<tr>
<th> Order Id</th>
<th>Name</th>
<th>Email</th>
<th>Address</th>
<th>PhNo</th> 
<th>Item-Name</th>
<th>Price</th> 
<th>Payment Method</th>
</tr>
</thead>
<tbody>

<%
ItemorderImpl dao = new ItemorderImpl(DBConnect.getConn());
List<Itemorder>ilist= dao.getAllOrder();
for(Itemorder i : ilist)
{%>
	<tr>
<td class="row" Scope="row"><%=i.getOrderid() %></td>
<td><%=i.getUserName() %></td>
<td><%=i.getEmail()	 %></td>
<td><%=i.getFullAdd() %></td>
<td><%=i.getPhno() %></td>
<td><%=i.getItemname() %></td>
<td><%=i.getPrice() %></td>
<td><%=i.getPaymentType() %></td>

</tr>
	
	
<%}


%>


</tbody>





</table>

</body>
</html>
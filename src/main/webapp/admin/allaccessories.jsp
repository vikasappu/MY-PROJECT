<%@page import="java.util.List"%>
<%@page import="com.entity.Itemdetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOImpl"%>
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
     <link rel="stylesheet" type="text/css" href="allaccessories.css">
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
      <c:redirect url="../login.jsp"/>
   </c:if>
<h2>Hello,Admin</h2>
<c:if test="${not empty succMsg }">
    <h5 style=text-align:center;color:green;>${succMsg}</h5>
    <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
    <h5 style=text-align:center;color:red;>${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session"/>
</c:if>
<table>
<thead>
<tr>
<th>Id</th>
<th>Images</th>
<th>Item-Name</th>
<th>Price</th>
<th>Item-Categories</th>
<th>Item-Status</th> 
<th>Action</th>
</tr>
</thead>
<tbody>
<%
  ItemDAOImpl dao =new ItemDAOImpl(DBConnect.getConn());
  List<Itemdetails> list=dao.getallitems();
  for(Itemdetails i : list) {
%>
<tr>
<td ><%=i.getItemId()%></td>
<td><img src="../Item-Images/<%=i.getPhoto()%>"style=" width:50px;height:50px;"></td>
<td><%=i.getItemName() %></td>
<td><%=i.getPrice() %></td>
<td><%=i.getItemCategory() %></td>
<td><%=i.getStatus() %></td>
<td><a href="edit-items.jsp?id=<%=i.getItemId()%>"><button class="edit-button" type="submit">Edit</button></a>
<a href="../delete?id=<%=i.getItemId()%>"><button class="delete-button" type="submit">Delete</button></a></td>
</tr>
<%
}

%>

</tbody>
</table>

</body>
</html>
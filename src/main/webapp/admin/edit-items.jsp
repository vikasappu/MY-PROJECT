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
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="navbarstyle.css">
     <link rel="stylesheet" type="text/css" href="addaccessories.css">
</head>

<body>
<%@include file="navbar.jsp"%>
<div class="card">
<h4>Edit-items</h4>

<%
int id =Integer.parseInt(request.getParameter("id"));
ItemDAOImpl dao =new  ItemDAOImpl(DBConnect.getConn());
Itemdetails i=dao.getitembyId(id);
%>

<form action="../edit-items" method="post" >
<input type="hidden" name="id" value="<%=i.getItemId()%>">
<div class="add-item">
            <label for="iname"><b>Item-Name*</b></label>
            <input type="text"  name="iname" id="iname" required value="<%=i.getItemName()%>">

            <label for="price"><b>Price*</b></label>
            <input type="text"  name="price" id="price" required value="<%=i.getPrice()%>">
            
             
             <label for="istatus"><b>Item-Status*</b></label>
             <select  name="istatus" id="istatus">
             <% if("Active".equals(i.getStatus()))
             {	 
             %>
            <option value="Active">Active</option>
             <option value="Inactive">Inactive</option>
             <%
             }else {
            	 %>
            	 <option value="Inactive">Inactive</option>
            	  <option value="Active">Active</option>
            	 <%
             }
             %>
             </select>
             
             <button type="submit">Update</button>
           
           
</div>
</form>
</div>
</body>
</html>
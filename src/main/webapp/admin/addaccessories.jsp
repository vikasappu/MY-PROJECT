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
<c:if test="${empty userobj}">
      <c:redirect url="../login.jsp"/>
   </c:if>
<div class="card">
<h4>Add-items</h4>

<c:if test="${not empty succMsg }">
    <h5 style=text-align:center;color:green;>${succMsg}</h5>
    <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg }">
    <h5 style=text-align:center;color:red;>${failedMsg}</h5>
    <c:remove var="failedMsg" scope="session"/>
</c:if>

<form action="../addaccessories" method="post" enctype="multipart/form-data">
<div class="add-item">

            <label for="iname"><b>Item-Name</b></label>
            <input type="text"  name="iname" id="iname" required>

            <label for="price"><b>Price</b></label>
            <input type="text"  name="price" id="price" required>

             <label for="cat"><b>Categories</b></label>
             <select  name="cat" id="cat">
             <option value="select">select	</option>
             <option value="Helmets">Helmets</option>
             <option value="Accessories">Accessories</option>
             <option value="Jackets">Jackets</option>
             </select>
             
             <label for="istatus"><b>Item-Status</b></label>
             <select  name="istatus" id="istatus">
             <option value="select">select</option>
             <option value="Active">Active</option>
             <option value="Inactive">Inactive</option>
             </select>
   
             <label for="image"><b>Upload Photo</b></label>
             <input type="file"  name="image" id="image" required>
             <hr>
             
             <button type="submit">Add</button>
           
           
</div>
</form>
</div>
</body>
</html>
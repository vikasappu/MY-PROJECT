<%@page import="com.entity.Itemdetails"%>

<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.ItemDAOImpl"%>
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
    <link rel="stylesheet" type="text/css" href="allcomponents/viewitemdetailstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>

<%
  int id = Integer.parseInt(request.getParameter("id"));
  ItemDAOImpl dao = new ItemDAOImpl(DBConnect.getConn());
  Itemdetails i=dao.getitembyId(id);
 %>
 <%@include file="allcomponents/navbar.jsp"%>
<div class="container1">
 

    <div class="left-side">
       <img src="Item-Images/<%=i.getPhoto()%>">
    </div>
    <div class="right-side">
        <p><%=i.getItemName() %></p>
        <h3><i class="fa fa-inr" aria-hidden="true"></i> <%=i.getPrice() %></h3>
        <h4>Category:<%=i.getItemCategory() %></h4>
        <div class="hr"></div>
       <div>
           <form>
               <br>
               <a href=""><button type="submit">Add Cart</button></a>
               <a href="index.jsp"><button type="submit">Home</button></a>
              
           </form>
       </div>
        <div class="hr1"></div>
    </div>
</div>
 
<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
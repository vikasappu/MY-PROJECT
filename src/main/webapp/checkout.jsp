<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
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
    <link rel="stylesheet" type="text/css" href="allcomponents/checkoutstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
 <%@include file="allcomponents/navbar.jsp"%>
 
 <c:if test="${empty userobj }">
      <c:redirect url="login.jsp"></c:redirect>
 </c:if>
 
 <c:if test="${not empty succMsg }">
  <div class="alert alert-success" role="alert">${succMsg}</div>
  <c:remove var="succMsg" scope="session"/> 
 </c:if>
 
 <c:if test="${not empty failedMsg}">
  <div class="alert alert-danger" role="alert">${failedMsg}</div>
  <c:remove var="failedMsg" scope="session"/>
 </c:if>
 
<div class="card">
    <h5>Your Selected Item</h5>

    <table>
        <thead>
          <tr>
            <th>Item-Name</th>
            <th>Price</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
       	 <%
       	 User u = (User)session.getAttribute("userobj");
       	 
        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
        List<Cart> cart = dao.getItemByUser(u.getId());	
        Double totalprice=0.00;
        for(Cart c: cart){
        	totalprice=c.getTotalprice();
        	%>
        	 <tr>
                <td><%=c.getItemname() %></td>
                <td><%=c.getPrice()%></td>
                <td><a href="removecartitem?Iid=<%=c.getIid()%>&&uid=<%=c.getUid()%>"><button class="delete-button" type="submit">Remove</button></a></td>
            </tr>	
       <%
       }
       %> 
       
       <tr>
       <td>Total Price </td>
       <td><b><%=totalprice %></b></td>
       <td></td>
       </tr>
       
       	
         
         
        </tbody>
    </table>
</div>

<div class="card2">
    <div class="row">
        <div class="col-75">
            <div class="container3">
            <h5>Your Details for Order</h5>
                <form action="order" method="post">
                     <input type="hidden" value="${userobj.id}" name="id" >
                    <div class="row">
                        <div class="col-50">

                            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
                            <input type="text" id="fname" name="firstname" value="${userobj.name }">

                            <label for="phoneno"><i class="fa fa-phone" aria-hidden="true"></i> Mobile Number</label>
                            <input type="text" id="phoneno" name="phoneno" value="${userobj.phno }">

                            <label for="landmark"><i class="fa fa-road" aria-hidden="true"></i> Landmark</label>
                            <input type="text" id="landmark" name="landmark"  required>

                            <label for="state"><i class="fa fa-institution"></i> State</label>
                            <input type="text" id="state" name="state" required >

                            <div class="row">
                                <div class="col-50">
                                    <label for="payment"><b>Payment-type</b></label>
                                    <select  name="payment" id="payment">
                                        <option value="noselect">--select--</option>
                                        <option value="COD">Cash on Delivery</option>
                                    </select>
                                </div>

                            </div>
                        </div>

                        <div class="col-50">
                            <label for="email"><i class="fa fa-envelope"></i> Email</label>
                            <input type="text" id="email" name="email"  value="${userobj.email }" >

                            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
                            <input type="text" id="adr" name="address" required >

                            <label for="city"><i class="fa fa-institution"></i> City</label>
                            <input type="text" id="city" name="city"  required>

                            <label for="pincode"><i class="fa fa-map-pin" aria-hidden="true"></i> Pincode</label>
                            <input type="text" id="pincode" name="pincode"  required>

                        </div>

                    </div>
                   
                    <input type="submit" value="Continue to checkout" class="btn">
                </form>
            </div>
        </div>
</div>
</div>
<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
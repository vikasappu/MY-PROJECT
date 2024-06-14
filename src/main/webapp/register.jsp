<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="allcomponents/navbarstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/registerstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
<%@include file="allcomponents/navbar.jsp"%>
<div class="card">

    <h5>Registration Page</h5>
    <c:if test="${not empty succMsg }">
    <p style="text-align:center;color:green;">${succMsg }</p>
    <c:remove var="succMsg" scope="session"/>
    </c:if>
    
    <c:if test="${not empty failedMsg }">
    <p style="text-align:center;color:red;">${failedMsg }</p>
    <c:remove var="failedMsg" scope="session"/>
    </c:if>

    <form action="register" method="post">
        <div class="registration">
            <label for="fname"><b>Full Name</b></label>
            <input type="text" placeholder="Full Name" name="fname" id="fname" required>

            <label for="email"><b>Email</b></label>
            <input type="text" placeholder="Enter Email" name="email" id="email" required>

            <label for="phno"><b>Phone Number</b></label>
            <input type="text" placeholder="Phone Number" name="phno" id="phno" required>

            <label for="password"><b>Password</b></label>
            <input type="password" placeholder="Enter Password" name="password" id="password" required>
            <hr>

            <input type="checkbox" id="check" name="check">
            <label for="check">Agree Terms & Conditions</label><br>

            <button type="submit" class="registerbtn">Register</button>
            <div class="container signin">
                <p>Already have an account? <a href="login.jsp">Sign in</a>.</p>
            </div>
        </div>
    </form>
</div>
<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
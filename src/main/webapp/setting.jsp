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
    <link rel="stylesheet" type="text/css" href="allcomponents/settingstyle.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>
</c:if>
 <%@include file="allcomponents/navbar.jsp"%>
  <div class="card-main">
    <a href="editprofile.jsp"><div class="card">
        <i class="fa fa-pencil-square-o" style="color: blue" aria-hidden="true"></i>
         <h4>Login and Security<p>Edit Profile</p>...........</h4>
    </div>
    
    <a href="trackorder.jsp"><div class="card">
        <i class="fa fa-archive" style="color: yellow" aria-hidden="true"></i>
     <h4>My Order<p>Track your Order</p>...........</h4>
    </div>
    </a>
    <a href="helpcenter.jsp" ><div class="card">
        <i class="fa fa-user-circle" style="color: #0a53be" aria-hidden="true"></i>
       <h4>Help Center<p>24/7 Service</p>...........</h4>
    </div>
    </a>
</div>
<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
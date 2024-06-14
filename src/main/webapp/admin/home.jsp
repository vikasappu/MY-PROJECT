<%@page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Home</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="navbarstyle.css">
      <link rel="stylesheet" type="text/css" href="homestyle.css">
</head>
<body>
<%@include file="navbar.jsp"%>
   <c:if test="${empty userobj}">
      <c:redirect url="../login.jsp"/>
   </c:if>
 <div class="card-main">
    <a href="addaccessories.jsp"><div class="card">
        <i class="fa fa-plus-square" style="color: blue" aria-hidden="true"></i>
         <h4>Add Accessories<br>...........</h4>
    </div>
    </a><a href="allaccessories.jsp"><div class="card">
        <i class="fa fa-motorcycle" style="color: #bb2d3b" aria-hidden="true"></i>
       <h4>All Accessories<br>...........</h4>
    </div>
    </a>
    <a href="orders.jsp"><div class="card">
        <i class="fa fa-archive" style="color: yellow" aria-hidden="true"></i>
     <h4>Orders<br>...........</h4>
    </div>
    </a>
    <a onclick="document.getElementById('id01').style.display='block'" ><div class="card">
        <i class="fa fa-sign-out" style="color: #0a53be" aria-hidden="true"></i>
       <h4>Log-Out<br>...........</h4>
    </div>
    </a>
</div>
<!-- logout modal -->



<div id="id01" class="modal">
    <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
    <form class="modal-content" action="/action_page.php">
        <div class="logout-container">
            <p>Are you sure you want to Logout</p>
            <hr>
            <div class="clearfix">
                <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
              <a href="../logout"> <button type="button" onclick="document.getElementById('id01').style.display='none'" class="deletebtn">Logout</button></a>
            </div>
        </div>
    </form>
</div>

<script>
    // Get the modal
    var modal = document.getElementById('id01');


    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>
<!-- end logout modal -->


</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container">
    <img src="images/vtwologo.jpg">

</div>

<div class="topnav">
    <a href="home.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a> 
    
    <div class="search-box">
        <form action="searchitem.jsp" method="post">
            <input type="search" placeholder="Search here" name="ch">
            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i>Search</button>
        </form>
    </div> 
    
    <div class="acclogo">
    
    <c:if test="${not empty userobj}">
     
    <a ><i class="fa fa-user-o" aria-hidden="true"></i> ${userobj.name}</a>
    <a onclick="document.getElementById('id01').style.display='block'" ><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a>
    </c:if>
    
    <c:if test="${empty userobj}">
    <a href="../login.jsp"><i class="fa fa-user-o" aria-hidden="true"></i> Login</a>
    <a href="../register.jsp"> Register</a>
    </c:if>
    </div>
    
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

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
    <link rel="stylesheet" type="text/css" href="allcomponents/editaddress_style.css">
    <link rel="stylesheet" type="text/css" href="allcomponents/footerstyle.css">
</head>
<body>
 <%@include file="allcomponents/navbar.jsp"%>
 <div class="card">
 <h5> Edit Address</h5>
 <form action="register" method="post">
        <div class="registration">
            <label for="address"><b>Address</b></label>
            <input type="text" placeholder="address" name="address" id="address" required>

            <label for="landmark"><b>Landmark</b></label>
            <input type="text" placeholder="landmark" name="landmark" id="landmark" required>

            <label for="city"><b>City</b></label>
            <input type="text" placeholder="city" name="city" id="city" required>

            <label for="state"><b>State</b></label>
            <input type="password" placeholder="state" name="state" id="state" required>
            <label for="pincode"><b>Pincode</b></label>
            <input type="text" placeholder="pincode" name="pincode" id="pincode" required>
            <hr>
            <button type="submit" class="registerbtn">Save Address</button>
        </div>
    </form>
 </div>
 <%@include file="allcomponents/footer.jsp"%>
</body>
</html>
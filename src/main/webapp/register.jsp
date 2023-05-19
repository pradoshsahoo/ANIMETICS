<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    
    <title>ANIMETICS</title>
    <link rel="icon" type="image/x-icon" href='/animetics.png'>
    <style>
    	@charset "ISO-8859-1";
*{
    margin:0;
    padding:0;
    box-sizing: border-box;
    font-family: Montserrat;
   	text-align: center;
}
.navbar {
  display: flex;
  align-items: center;
}
.navbar a {
  color: #333333;
  text-decoration:none;
}
.navbar a img{
  width:30px;
}

.navbar ul {
  margin: 0;
  padding: 0;
  list-style-type: none;
  display: flex;
  align-items:center;
}

.navbar .brand {
  display: block;
  color: #333333;
  padding: 0 24px;
  font-size: 20px;
}

.navbar ul li a {
  color: #333333;
  padding: 24px;
  display: block;
}
.navbar ul a:hover,
.navbar ul a:focus,
.navbar ul .active {
  background-color: #BEBEBE;
}
.heading{
    margin-bottom: 0px;
    text-align: center;
    /* background: url("../images/final.jpg"); */
    height: 90px;
    padding: 0px;
    font-size: 40px;
    font-weight:bold;
}
.heading::after{
    content: '';
    position: absolute;
    left: 47%;
    display: inline-block;
    height: 0.5em;
    width: 5.5%;
    margin-top: 30px;
    border-bottom: 4px solid #bd2308;
    
}
input[type="submit"]{
clear:both;
padding:15px 40px 15px 40px;
border:1px solid rgb(221 221 221 / 99%);
text-align:center;
border-radius:8px;
background-color:#010101;
color:white;
margin-bottom:50px;
font-weight:bold;
}
input[type="submit"]:hover{
clear:both;
padding:15px 41px 15px 41px;
border:1px solid rgb(221 221 221 / 99%);
text-align:center;
border-radius:8px;
color:white;
background-color:#212121;
margin-bottom:50px;
font-weight:bold;
}
.form-input2{
    text-align: center;
}
.form-input2 input[type="text"],.form-input2 input[type="email"],.form-input2 input[type="password"]{
    margin: 20px;
    width:400px;
    padding: 10px;
    margin-bottom: 0px;
    	border:1px solid rgb(221 221 221 / 99%);
    border-radius:7px;
}
.addUser{
    padding: 5px;
    width:100px;
    background-color: rgb(35, 35, 35);
    color: white;
    border: 2px solid rgb(37, 37, 37);
    border-radius: 3px;
}
.addUser{
    margin-top: 20px;
}
.addUser:hover{
    background-color: rgb(42, 42, 42);
}
form{
margin:auto;
background-color:rgb(221 221 221 / 81%);
width:40%;
padding:30px;
border-radius: 15px;
}
a{
text-decoration-color:black;}
</style>
</head>
<body>
    <div >
    <nav class="navbar">
	  <ul>
	  <li>
	      <a href="Landing.jsp">HOME</a>
	    </li>
	  
	    <li>
	      <a href="Blog.jsp">BLOG</a>
	    </li>
	   <%String admin=(String)session.getAttribute("admin"); %>
	    <li>
	    	<%if(admin==null){%>
	      		<a href="login.jsp">POST</a>
	      	<%}
	    	else{%>
	    		<a href="addanime.jsp">POST</a>
	    	<%} %>

	    </li>
	    <li>
	    	<%if(admin==null){%>
	      <a href="login.jsp">LOGIN</a>
	      	<%}
	    	else{%>
	    		<a href="logout.jsp">LOGOUT</a>
	    	<%} %>
	    </li>
	    
	  </ul>
	</nav> 
		<%String message = request.getParameter("invalid");%>
		<h1 class="heading">REGISTER</h1>
        <form action="addUser.jsp" method="post" onsubmit="return check()">
        		<%if(message!=null){
        			%>
        			<div class="message">
                    <%=message %>
                </div>
        		<%} %>
               	<div class="form-input2">
                <input type="text" name="adminName" placeholder='Full Name'/>
            </div>
            <div class="form-input2">
                <input type="email" name="adminEmail"  placeholder='Email'/>
            </div>
            <div class='clearfix'></div>
            <div class="form-input2">
                <input type="password" id="pass" name="adminPassword" placeholder='Password'/>
            </div>
            <div class="form-input2">
                <input type="password" id="cpass" name="adminCpassword" placeholder='Confirm Password'/>
            </div>
            <div class='clearfix'></div>
            <div class="form-input2">  
                <button id="reg" class="addUser" onclick="foo()">ADD</button>         
            </div>
        </form>
    </div>
<script>
function check()
{
	var pass=document.getElementById("pass").value;
	var pass1=document.getElementById("cpass").value;
	if(pass==pass1)
	{
		return true;
	}
	else{
		alert("Passwords do not match");
		return false;		
	}
}
</script>
</body>
</html>
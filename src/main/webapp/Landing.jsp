<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ANIMETICS</title>
<link rel="stylesheet" href="landing.css">
</head>
<body>
<div class="home">
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
    <div class="head-1">
      <div class="text--1">

        <a>
          THINK<br>
          SEARCH<br>
          <span class="village">WATCH.</span>
          <br>
          <hr>
        </a>
      </div>
      <div class="text--2">
        A place where you can search different animes
        <br>
        according to its genre ,airing status and view 
        <br>
        their ratings , all in order to find your perfect anime!!
      </div>
    </div>
    <div class="button-getStarted">
         <h1>
         <a href="Blog.jsp">
           <button>Get Started</button>
         </a>
         </h1>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
  </div>

	
</body>
</html>
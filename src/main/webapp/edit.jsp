<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("animeName");
String genre=request.getParameter("animeGenre");
String rating=request.getParameter("animeRating");
String status=request.getParameter("animeStatus");
String seasons=request.getParameter("animeSeasons");
String picture=request.getParameter("animeImage");
String about=request.getParameter("animeText");
%>
<!DOCTYPE html>
<html>
<head>
    
    <title>Registration</title>
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
.blogdetails{
    background-color: rgb(221 221 221 / 81%);
    border-radius: 20px;
    padding: 30px;
    width: 45%;
    float:left;
    margin:20px;
    margin-left:40px;
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
    left: 46%;
    display: inline-block;
    height: 0.5em;
    width: 7.5%;
    margin-top: 30px;
    border-bottom: 4px solid #bd2308;
    
}
.i_p{
    color: black;
    text-align: left;
    font-size: larger;
    padding: 10px;
    font-weight:300;
    /* border: 2px solid red; */
    margin: 10px;
    border:none;
}
.i_p input{
	text-align:left;
	margin-top:4px;
	border:1px solid rgb(221 221 221 / 99%);
	padding:10px;
	border-radius:8px;
	width:100%;
	font-size:20px;
}
/*.form_main{
    background-color: rgb(221 221 221 / 81%);
    border-radius: 20px;
    padding: 30px;
}*/
.right{
    background-color: rgb(221 221 221 / 81%);
    border-radius: 20px;
    padding: 30px;
    width: 45%;
    float:right;
    margin:10px;
    margin-top:16px;
    margin-right:40px;
        font-size: larger;
}
.radio{
margin:10px;
text-align:left;
margin-bottom:20px;
font-weight:300;}
.radio input{
margin:10px;
font-weight:100;}
.right .textarea{
margin:10px;
text-align:left;
}
#about{
text-align:left;
	margin-top:4px;
	border:1px solid rgb(221 221 221 / 99%);
	padding:10px;
	border-radius:8px;
	width:100%;
		font-size:17px;}

.form_ele{
clear:both;
text-align:center;

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
input[type="radio"]:checked{
color:black;}
</style>
</head>
<body onload="setStatus()">
    <div >
    <nav class="navbar">
	  <ul>
	  <li>
	      <a href="Landing.jsp">HOME</a>
	    </li>
	  
	    <li>
	      <a href="Blog.jsp">BLOG</a>
	    </li>
	    <li>
	      <a href="addanime.jsp">POST</a>
	    </li>
	    <li>
	    	<%String admin=(String)session.getAttribute("admin"); 
	    	if(admin==null){%>
	      <a href="login.jsp">LOGIN</a>
	      	<%}
	    	else{%>
	    		<a href="logout.jsp">LOGOUT</a>
	    	<%} %>
	    </li>
	    
	  </ul>
	</nav>
        <form action="editjdbc.jsp?animeName=<%=name%>" method="post" onsubmit="return validate()" >
               	<h1 class="heading">EDIT ANIME</h1>
               	<div class="form_main">
                <div class="blogdetails">
                    <div class=i_p>
                        <label for="name">Name</label><br>
                        <input type="text" name="name" id="name" value="<%=name %>" disabled/>
                    </div>
                    <div class="i_p">
                        <label for="genre">Genre</label><br>
                        <input type="text" id="genre" name="genre" value="<%=genre %>"/>
                    </div>
                    <div class="i_p">
                        <label for="rating">Rating</label><br>
                        <input type="text" id="rating" value="<%=rating %>" name="rating" />
                    </div>
                    <div class="i_p">
                        <label for="addr">Seasons</label><br>
                        <input type="number" min=1 name="seasons" value="<%=seasons%>" id="seasons"/>
                    </div>
                    <div class="i_p">
                        <label for="picture">Image</label><br>
                        <input type="text" name="picture" value="<%=picture %>" id="picture" />
                    </div>
                 </div>
                    
                    
                    
                 <div class="right">
                    <div class="radio">
                        <label for="status" >Status<br></label>
                        <input type="radio" name="status_shift" id="Ongoing" value="Ongoing">Ongoing<br>
                        <input type="radio" name="status_shift" id="Completed" value="Completed">Completed
                    </div>
                    <div class="textarea">
                        <label for="about">About</label><br>
                        <textarea id="about" name="about" rows="17" cols="50"><%=about %></textarea>

                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form_ele">
                        <input type="submit" name="submit" value="Submit" onclick="foo()"/>
                    </div>
                </div>
        </form>
    </div>
<script>
function validate()
{
	var name=document.getElementById("name").value;
	var genre=document.getElementById("genre").value;
	var rating=document.getElementById("rating").value;
	var seasons=document.getElementById("seasons").value;
	var picture=document.getElementById("picture").value;
	var about=document.getElementById("about").value;
	if(name=="" || genre=="" || rating=="" || seasons=="" || picture=="" || about=="" || !(document.getElementById("Ongoing").checked || document.getElementById("Completed").checked))
	{
		alert("Fill all the fields")
		return false;
	}
	else{
		alert("<%=name%> edited successfully");
		return true;		
	}
}
	function setStatus() {
		document.getElementById("<%=status%>").checked = true;
	}
</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    
    <title>ANIMETICS</title>
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
	width:100%;}
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
	      		<a href="login.jsp">LOGIN</a>
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
        <form action="addanimejdbc.jsp" method="post" onsubmit="return validate()">
               	<h1 class="heading">ADD ANIME</h1>
               	<div class="form_main">
                <div class="blogdetails">
                    <div class=i_p>
                        <label for="name">Name</label><br>
                        <input type="text" name="name" id="name" value=""/>
                    </div>
                    <div class="i_p">
                        <label for="genre">Genre</label><br>
                        <input type="text" id="genre" name="genre" value="" />
                    </div>
                    <div class="i_p">
                        <label for="rating">Rating</label><br>
                        <input type="text" id="rating" name="rating" />
                    </div>
                    <div class="i_p">
                        <label for="addr">Seasons</label><br>
                        <input type="number" id="seasons" name="seasons" id="seasons" value=""/>
                    </div>
                    <div class="i_p">
                        <label for="picture">Image</label><br>
                        <input type="text" id="picture" name="picture" id="picture" value=""/>
                    </div>
                 </div>
                    
                    
                    
                 <div class="right">
                    <div class="radio">
                        <label for="status" >Status<br></label>
                        <input type="radio" id="radio1" name="status_shift" value="Ongoing">Ongoing<br>
                        <input type="radio" id="radio2" name="status_shift" value="Completed">Completed
                    </div>
                    <div class="textarea">
                        <label for="about">About</label><br>
                        <textarea id="about" name="about" rows="19" cols="50"></textarea>

                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="form_ele">
                        <input type="submit" name="submit" value="Submit"/>
                    </div>
                </div>
        </form>
    </div>
</body>
<script>
function validate()
{
	var name=document.getElementById("name").value;
	var genre=document.getElementById("genre").value;
	var rating=document.getElementById("rating").value;
	var seasons=document.getElementById("seasons").value;
	var picture=document.getElementById("picture").value;
	var about=document.getElementById("about").value;
	if(name=="" || genre=="" || rating=="" || seasons=="" || picture=="" || about=="" || !(document.getElementById("radio1").checked || document.getElementById("radio2").checked))
	{
		alert("Fill all the fields")
		return false;
	}
	else{
		alert("New anime added");
		return true;		
	}
}
</script>
</html>
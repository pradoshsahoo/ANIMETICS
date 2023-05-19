<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
@charset "ISO-8859-1";
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
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
.blog_container{
    padding: 20px;
    background-color: rgb(237,237,237);
    float:left;
    margin: 3%;
    width: 27%;
    height: 420px;
    border-radius: 10px;
}
.blogImage{
position:relative;}
.edit{
position:absolute;
top:10px;
right:70px;}
.delete{
position:absolute;
top:10px;
right:5px;}
.blogImage .image{
    border-radius: 10px;
    width:100%;
    height:200px;
    object-fit: cover;
    margin-bottom: 5px;
}
.blogName{
    margin:0 0 5px 5px;
    float: left;
    font-size: 160%;
    font-weight: 600;
}
.productPrice{
    text-align: right;
    font-weight: bold;
    font-size: 25px; 
}
.seasons{
	margin:0 0 5px 5px;
    float: left;
    font-size: 25px;
    text-transform:capitalize;
    font-weight:bold;
}
.genre,.air{
	float:right;
    text-align: right;
    font-size: 15px; 
    background-color:#333333;
    border-radius: 10px;
    padding: 7px;
    color: white;
    margin-right:5px;
}
.rect{
    margin-left: 7px;
    width: 50px;
    height:5px;
    background-color: #000000;
    margin-bottom: 10px;
    margin-right: 0px;
    float:left;
}
.clearfix{
    clear:both;
}
.blogText{
	margin:10px;
	clear:both
    text-align: left;
    margin-left: 5px;
    color:#777777;
}
.productDesc{
    clear: both;
    margin-left: 20px;
    font-size: 15px;
}

.edit,.delete{
display:none;}
.dustbin{
display:none;}

.blogImage:hover .dustbin{
display:block;}
.delete{
margin-right:5px;}
.blogImage:hover .edit,.delete{
background-color:rgb(237,237,237);
border-radius:8px;

height:50px;
opacity:1;
display:block;}

.pencil,.dustbin{
opacity:1;
height:30px;
width:30px;
margin:10px;}






         
    .search button{
        background-color: #0074D9;
        color: #f2f2f2;
        padding: 5px 10px;
        font-size: 12px;
        border: none;
        cursor: pointer;
        padding:18px;
        border-radius:10px;
        
    }
   .search input[type="text"]{
	padding:15px;
	border: 3px solid black;
	border-radius:10px;
	margin-left:30%;
}
</style>
</head>
<body> 
	<nav class="navbar">
	  <ul>
	  <li>
	      <a href="Landing.jsp">HOME</a>
	    </li>
	  
	    <li>
	      <a href="Bloganime.jsp">BLOG</a>
	    </li>
	    <li>
	      <a href="addanime.jsp">POST</a>
	    </li>
	    <li>
	      <a href="login.jsp">LOGIN</a>
	    </li>
	    <li>
	    	<form action="searchBlog.jsp" method="post">
               <input type="text"
                   placeholder=" Search anime by name,genre"
                   name="search" >
               <button type="submit">
                   search
               </button>
           </form>
	    </li>
	    
	  </ul>
	</nav> 
	<div class="search">
     </div>
	
	<% Class.forName("oracle.jdbc.driver.OracleDriver");
	    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","1234");
	    Statement st=conn.createStatement();
		String command = "select * from ANIME";
		String search = request.getParameter("search");
		ResultSet rs = st.executeQuery(command);
	    while(rs.next()){ 
	    %>     
      <div class="blog_container">
        <div class="blogImage">
          <img class="image"
            src="<%= rs.getString(6) %>"
            width="300"
            alt=""
          />
          <%String url1 = "edit.jsp?animeName="+rs.getString(1)+"&animeImage="+rs.getString(6)+"&animeRating="+rs.getString(3)
          +"&animeSeasons="+rs.getString(5)+"&animeGenre="+rs.getString(2)+"&animeStatus="+rs.getString(4)+"&animeText="+rs.getString(7); %>
          <div class="edit"><a href="<%=url1%>"><img class="pencil" src="pencil.png"></a></div>
          <%String url = "delete.jsp?animeName="+rs.getString(1);%>
          <div class="delete"><a href="<%=url%>"><img class="dustbin" src="delete.png"></a></div>
          
        </div>
        <div class="blogName"><%=  rs.getString(1) %></div>
        <div class="productPrice"><%=  rs.getString(3) %></div>
        <div class="clearfix"></div>
        <div class="rect"></div>
        <div class="clearfix"></div>
        <div class="seasons">S<%=  rs.getString(5) %></div>
        <div class="genre"><%=  rs.getString(2) %></div>
        <div class="air"><%=  rs.getString(4) %></div>
        <div class="clearfix"></div>
        <div class="blogText">
        <%int len = rs.getString(7).length() ;
        	String s;
        if(len>=105)
        {
        	s=rs.getString(7).substring(0,105) + "...";
        	
        }
        else{
        	s=rs.getString(7);
        }%>
          <%=  s %>
        </div>
        <div class="clearfix"></div>
        </div>
           <%  }%>
</body>
</html>
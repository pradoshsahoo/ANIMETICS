<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("animeName");
String genre=request.getParameter("genre");
String rating=request.getParameter("rating");
String status=request.getParameter("status_shift");
String seasons=request.getParameter("seasons");
String picture=request.getParameter("picture");
String about=request.getParameter("about");
try
{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","pradosh");
        Statement st=conn.createStatement();
		String command = "update ANIME set genre ='"+ genre + "',"
        +"rating ='"+ rating + "',"+"status ='"+ status +"',"+"seasons ="+ seasons +","
		+"picture ='"+picture+"',"+"about ='"+ about +"' where name='" + name + "'";
		System.out.println(command);
		int i = st.executeUpdate(command);
        response.sendRedirect("Blog.jsp");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
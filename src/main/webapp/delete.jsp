<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("animeName");
try
{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","pradosh");
        Statement st=conn.createStatement();
		String command = "delete from ANIME where name=" +"'"+ name+"'" ;
		int i = st.executeUpdate(command);
        response.sendRedirect("Blog.jsp");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
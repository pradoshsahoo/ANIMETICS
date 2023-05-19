<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("adminName");
String email=request.getParameter("adminEmail");
String password=request.getParameter("adminPassword");
String cpassword=request.getParameter("adminCpassword");

try
{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","pradosh");
        Statement st=conn.createStatement();
		String command = "INSERT into ADMIN values('" + email + "','" + name + "','"+ password + "')";
		int i = st.executeUpdate(command);
		if(i<0){
			response.sendRedirect("register.jsp");
		}
        response.sendRedirect("login.jsp");
        }
        catch(Exception e)
        {
        	response.sendRedirect("register.jsp?invalid=Failed!");
        System.out.print(e);
        e.printStackTrace();
        }
 %>
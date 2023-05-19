<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("adminEmail");
String password=request.getParameter("adminPassword");

try
{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","pradosh");
        Statement st=conn.createStatement();
		String command ="select email,password from admin where email='"+email+"'";
		ResultSet rs = st.executeQuery(command);
		while(rs.next())
		{
			if(rs.getString(1).equals(email) && rs.getString(2).equals(password)){
				session.setAttribute("admin",email);
				response.sendRedirect("Blog.jsp");
			}
		}
        response.sendRedirect("login.jsp?msg=Invalid credentials");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
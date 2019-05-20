<%@ page import="java.sql.*"%>

<%
String username=request.getParameter("username");
String block=request.getParameter("blockstatus");
try{
	if(block=="block"){
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
		Statement s = con.createStatement();
		s.executeUpdate("UPDATE `users` SET `active`='0' WHERE `accno`='"+username+"'");
	}
	if(block=="unblock"){
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
		Statement s1 = con.createStatement();
		s1.executeUpdate("UPDATE `users` SET `active`='1' WHERE `accno`='"+username+"'");
	}
}
catch(Exception T){
	out.println(T.toString());
}
%>

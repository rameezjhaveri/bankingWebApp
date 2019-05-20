<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="login.css"></link>
Admin Account
<br>
*account status (1=active, 0=blocked)

<%
if (((Integer)session.getAttribute("role"))==0){
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT * FROM accounts");
	Statement s1 = con.createStatement();
	ResultSet rs1 = s1.executeQuery("SELECT * FROM users");
	int sno=1;
	out.print("<table border='1' style='border-collapse:collapse'>");
	out.print("<tr><td>Serial#</td><td>AccountNo</td><td>Name</td><td>Account Status</td><td>Edit</td><td>Delete</td><tr>");
	while (rs.next() && rs1.next()){
		out.println("<tr><td>"+sno+"</td>");
		sno++;
		out.println("<td><A href='http://localhost:8080/bankapp/account.jsp?username="+rs.getString(1)+"'>"+rs.getString(1)+"</A>");
		out.println("<td><A href='http://localhost:8080/bankapp/account.jsp?username="+rs.getString(1)+"'>"+rs.getString(2)+"</A>");
		out.println("<td>"+rs1.getString(4)+"</td>");
		out.println("<td><A href='http://localhost:8080/bankapp/edit.jsp'> Edit </td>");
		out.println("<td><A href='http://localhost:8080/bankapp/delete.jsp'> Delete </td>");
	}
}

%>

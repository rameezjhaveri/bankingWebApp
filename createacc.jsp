<%@ page import="java.sql.*"%>
<%

String name = (String)session.getAttribute("name");
String address = (String)session.getAttribute("address");
String accountNumber = (String)session.getAttribute("accountNumber");
String password = request.getParameter("password");
	
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
		Statement st2 = con.createStatement();
		st2.executeUpdate("INSERT INTO accounts VALUES('"+accountNumber+"', '"+name+"', '"+address+"')");
		Statement st3 = con.createStatement();
		st3.executeUpdate("INSERT INTO users VALUES('"+accountNumber+"', '"+password+"', '1', '1')");
		out.print("<script>");
		out.print("alert('ACCOUNT CREATED. REDIRECTING TO LOG IN PAGE...')");
		out.print("</script>");

		response.sendRedirect("index.html");
	}
	catch(Exception T){
		out.println(T.toString());
	}
%>
</html>

<%@ page import="java.sql.*"%>
<html>
<%
String username = (String)session.getAttribute("username");
out.print("Account Number: "+ username);

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
	Statement s1 = con.createStatement();
	ResultSet rs1 = s1.executeQuery("SELECT * FROM accounts WHERE accno = '" + username +"'");
	rs1.next();
}

catch(Exception T){
	T.toString();
}
out.println(rs1.getString(2));

%>

<body>
<form name="form1" id="form1" action="http://localhost:8080/bankapp/edit.jsp" method="post" align="middle">
Name: <input type="text" name="name"><br>
Address: <input type="text" name="address"><br>
Male: <input type = "radio" name="gender" value="M" checked> 
Female: <input type = "radio" name="gender" value="F"><br>
<input type="submit">
</body>

<%
out.println("<script>");
out.println("document.form1.name.value="+rs1.getString(2));
out.println("document.form1.address.value="+rs1.getString(3));
out.println("</script>");
%>
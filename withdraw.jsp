<%@ page import="java.sql.*"%>
<html>
<%
String username = (String)session.getAttribute("username");
out.print("Account Number: "+ username);
%>

<body>
<form name="form1" action="http://localhost:8080/bankapp/withdraw.jsp" method="post">
Withdraw Amount: <input type="number" name="amount"><br>
<input type="submit">
</form>
</body>

<%
String amount=request.getParameter("amount");
amount = "-" + amount; 
	try {
		if (amount==null){
		}
		else{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
			Statement st2 = con.createStatement();
			st2.executeUpdate("INSERT INTO transactions VALUES('"+username+"', 'withdraw', '"+amount+"', CURRENT_TIMESTAMP)");
			out.print("<script>");
			response.sendRedirect("account.jsp?username="+username);
			out.print("</script>");
		}
	}

catch(Exception T){
	T.toString();
}
%>

</html>

<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="login.css"></link>
<html>
<body>
<center>Account details</center>
<span id="buttonsUser" style="visibility:hidden">
<input type="button" name="withdraw" value="Withdraw" onclick="window.location.href='http://localhost:8080/bankapp/withdraw.jsp';">
<input type="button" name="deposit" value="Deposit" onclick="window.location.href='http://localhost:8080/bankapp/deposit.jsp';">
</span>

<span id="buttonsAdmin" style="visibility:hidden">
<input type="button" name="block" value="Block Account" onclick="window.location.href='http://localhost:8080/bankapp/block.jsp?username=username&blockstatus=block';">
<input type="button" name="unblock" value="Unblock Account" onclick="window.location.href='http://localhost:8080/bankapp/block.jsp?username=username&blockstatus=unblock';">
</span>
</body>


<%
String username=request.getParameter("username");
int b=0;
	if ((((Integer)session.getAttribute("role"))==1)){
		out.println("<script>");
		out.println("document.getElementById('buttonsUser').style.visibility='visible';");
		out.println("</script>");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
		Statement s = con.createStatement();
		ResultSet rs = s.executeQuery("SELECT * FROM `transactions` WHERE ACCNO = '" + username + "'");
		int sno=1;
		out.print("<table border='1'>");
		out.print("<tr><td>Serial#</td><td>Transaction Type</td><td>Amount $</td><td>Date</td>");
		while (rs.next()){
			int a;
			out.println("<tr><td>"+sno+"</td>");
			out.println("<td>"+rs.getString(2)+"</td>");
			out.println("<td>"+rs.getString(3)+"</td>");
			out.println("<td>"+rs.getString(4)+"</td>");
			sno++;
			a=rs.getInt(3);
			b=a+b;
		}
			out.println("Total Balance = " + b);
	}
	
	else if (((Integer)session.getAttribute("role"))==0){
	out.println("<script>");
	out.println("document.getElementById('buttonsAdmin').style.visibility='visible';");
	out.println("</script>");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("SELECT * FROM `transactions` WHERE ACCNO = '" + username + "'");
	int sno=1;
	out.print("<table border='1' style='border-collapse:collapse'>");
	out.print("<tr><td>Serial#</td><td>Transaction Type</td><td>Amount</td><td>Date</td>");
	while (rs.next()){
		out.println("<tr><td>"+sno+"</td>");
		out.println("<td>"+rs.getString(2)+"</td>");
		out.println("<td>"+rs.getString(3)+"</td>");
		out.println("<td>"+rs.getString(4)+"</td>");
		sno++;
		}
	}
	
	else {
		out.println("UNAUTHORISED ACCESS");
	}
	
%>
</html>


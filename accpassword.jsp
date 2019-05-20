<%@ page import="java.sql.*"%>
<html>
<body>
</body>

<%
String name=request.getParameter("name");
String address=request.getParameter("address");
String gender=request.getParameter("gender");
String acctype=request.getParameter("acctype");
String password=request.getParameter("password");
int accno;
String fullaccno="0";
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
	Statement st = con.createStatement();
	ResultSet previousaccno = st.executeQuery("SELECT MAX(SUBSTR(accno,3,3)) FROM users WHERE SUBSTR(accno,1,1)='" + acctype + "'");
		if (previousaccno.next()) {
			accno = (Integer.parseInt(previousaccno.getString(1))) + 1;
			fullaccno = Integer.toString(accno);
		}
		else {
			fullaccno="001";
		}
		if (fullaccno.length() < 3) {
			if (fullaccno.length() < 2) {
				fullaccno = ("00" + fullaccno);
			} 
			else {
				fullaccno = ("0" + fullaccno);
			}
		}
	
	fullaccno = acctype + gender + fullaccno;

	Statement st2 = con.createStatement();
	st2.executeUpdate("INSERT INTO accounts VALUES('"+fullaccno+"', '"+name+"', '"+address+"')");
	out.println("account created. Account number: " +fullaccno);
	out.println("<A href='http://localhost:8080/bankapp/accpassword.jsp?t="+fullaccno+"'><br>"+"Click here to create Password </A>");
}

catch(Exception T){
	out.println(T.toString());
}

%>
</html>

<%@ page import="java.sql.*"%>
<%
String username=request.getParameter("username");
String password=request.getParameter("password");
try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
	Statement s = con.createStatement();
	String query = "SELECT * FROM users WHERE accno = '" + username + "' and PASSWORD ='" + password + "'";
	ResultSet rs = s.executeQuery(query);
	if (rs.next()){
			Statement s1 = con.createStatement();
			ResultSet rs1 = s1.executeQuery("SELECT * FROM accounts WHERE accno = '" + username +"'");
			rs1.next();
		if (rs.getInt(3)==0){
			session.setAttribute("username",username);
			session.setAttribute("role",0);
			session.setAttribute("name",rs1.getString(2));
			response.sendRedirect("admin.jsp");
		}

		else{
			if (rs.getInt(4)==0){
				out.println("Account has been blocked. Please contact your admin for more information");
			}
			else {
				session.setAttribute("username",username);
				session.setAttribute("role",1);
				session.setAttribute("name",rs1.getString(2));
				response.sendRedirect("account.jsp?username="+username);
			}
		}
	}
	else {
		response.sendRedirect("index.html");
	}
	
}
catch(Exception T){
	out.println(T.toString());
}


%>
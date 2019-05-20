<%@ page import="java.sql.*"%>
<link rel="stylesheet" href="login.css"></link>

<%
String name=request.getParameter("name");
String address=request.getParameter("address");
String gender=request.getParameter("gender");
String accType=request.getParameter("accType");
String fullAccountNumber="";

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingwebapp", "root", "");
	Statement st1 = con.createStatement();
	ResultSet previousAccountNumber = st1.executeQuery("SELECT LPAD(COALESCE(MAX(SUBSTR(accno,3,3)+1),1),3,'0') FROM users WHERE SUBSTR(accno,1,1)='" + accType + "'");
	previousAccountNumber.next();
	fullAccountNumber = accType + gender + previousAccountNumber.getString(1);
	}
catch(Exception T){
		out.println(T.toString());
}
session.setAttribute("name",name);
session.setAttribute("address",address);
session.setAttribute("accountNumber",fullAccountNumber);

%>
<html>
Account Number: 
<%
out.print(fullAccountNumber);
%>


<div class="login-page">
  <div class="form">
    <form onsubmit="return submitchecker();" class="login-form" name="form1" action="http://localhost:8080/bankapp/createacc.jsp" method="post">
      <input type="text" placeholder="Password" name="password1" required />
      <input type="password" placeholder="Retype Password" name="password2" required />
	  <button>Submit</button>
	  	<p class="message">Already have an account? <a href="http://localhost:8080/bankapp/index.html">Log in</a></p>
    </form>
  </div>
</div>

<script>
function submitchecker(){
	var r = true;
	if (document.form1.password2.value==document.form1.password1.value){
		document.form1.submit();
		window.location.href = "createacc.jsp";}
	else {
		document.getElementById("nomatch").style.visibility="visible";
		return false;
	}	
}
</script>
</html>
<%@ page import="java.sql.*"%>

<html>
<body>
<form name="form1"action="http://localhost:8080/bankapp/createpassword.jsp" method="post">
Name: <input type="text" name="name"><span id="noname" style="color:red; visibility:hidden">Please enter a name</span><br>
Address: <input type="text" name="address"><span id="noaddress" style="visibility:hidden">Please enter a address</span><br>
Male: <input type = "radio" name="gender" value="M"> 
Female: <input type = "radio" name="gender" value="F"><span id="nogender" style="visibility:hidden">Please select a gender</span><br>
Current: <input type = "radio" name="acctype" value="C"> 
Savings: <input type = "radio" name="acctype" value="S"><span id="noacctype" style="visibility:hidden">Please select an account type</span><br>
<input type="button" name="back" value="Back" onclick="window.location.href='http://localhost:8080/bankapp/index.html';">
<input type="button" name="submit" value="Submit" onclick="submitchecker()">
</form>
</body>

<script>
function submitchecker(){
	var r = true;
	if (document.form1.name.value==""){
		document.getElementById("noname").style.visibility="visible";
		r = false;
	}
	else {
		document.getElementById("noname").style.visibility="hidden";
	}
	
	
	if (document.form1.address.value==""){
		document.getElementById("noaddress").style.visibility="visible";
		r = false;
	}
	else {
		document.getElementById("noaddress").style.visibility="hidden";
	}
	
	
	if (document.form1.gender.value==""){
		document.getElementById("nogender").style.visibility="visible";	
		r = false;
	}
	else {
		document.getElementById("nogender").style.visibility="hidden";	
	}
	
	
	if (document.form1.acctype.value==""){
		document.getElementById("noacctype").style.visibility="visible";	
		r = false;
	}
	else{
		document.getElementById("noacctype").style.visibility="hidden";	
	}
	
	
	if (r== true) {
	document.form1.submit();
	}
	
	return r;
</script>

</html>
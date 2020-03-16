<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

<script>
$(document).ready(function() {
	$('form[id="second_form"]').validate({
		  rules: {
			  first_Name: 'required',
		    last_name: 'required',
		    email: {
		      required: true,
		      email: true,
		    },
		    
		    password: {
		      required: true,
		      minlength: 8,
		    },
		    phno:'required'
		  },
		  messages: {
			  first_Name: 'This field is required',
		    last_name: 'This field is required',
		    email: 'Enter a valid email',
		    password: {
		      minlength: 'Password must be at least 8 characters long'
		    },
		    phno: {
		    	 minlength: 'Password must be at least 10 characters long'
			    }
		  },
		  submitHandler: function(form) {
		    form.submit();
		  }
		});
	
});
</script>

<style>
 table {
  display: inline-block;
  width: 100px;
}

td {
  margin-bottom: 10px;
   width: 100%;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.error {
  color: red;
  margin-left: 5px;
}

td.error {
  display: inline;
}

</style>
</head>
<body>
<h1 style="color: green;"> ${msg} </h1>
<h1 style="color: red;">Welcome to Registration Page</h1>
<form:form  id="second_form" method="post" action="/pageReg" modelAttribute="user">
	<table style="align-content: center;">
	<tr>
	<td>First Name<td>
	<td><form:input path="first_Name"/></td>
	</tr>
	<tr>
	<td>Last Name<td>
	<td><form:input path="last_name"/></td>
	
	</tr>
	<tr>
	<td>Email<td>
	<td><form:input path="email"/></td>
	</tr>
	<tr>
	<td>Password<td>
	<td><form:input path="password"/></td>
	</tr>
	<tr>
	<td>Mobile Number<td>
	<td><form:input path="phno"/></td>
	</tr>
	<tr>
	<td>Submit<td>
	<td><input type="submit" value="Submit"></td>
	</tr>
	<tr><td><button><a href="#">Reset</a></button></td><td> 
	<td><button><a href="getDetails">ViewUser</a></button></td></tr>
	</table>
</form:form> 
</body>
</html>
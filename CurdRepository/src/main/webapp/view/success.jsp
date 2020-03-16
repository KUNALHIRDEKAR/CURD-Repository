<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
${msg}
<form:form >
	<table>
		<thead>
			<tr>
				<td>First_Name</td>
				<td>Last_Name</td>
				<td>Email</td>
				<td>Password</td>
				<td>Mobile</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${user}" var="user" varStatus="theCount">
				<tr>
					<td>user.first_Name</td>
					<td>user.last_name</td>
					<td>user.email</td>
					<td>user.password</td>
					<td>user.phnos</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
</form:form>
</body>
</html>
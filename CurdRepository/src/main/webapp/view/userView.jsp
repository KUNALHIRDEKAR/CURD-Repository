<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Insert title here</title>
<script type="text/javascript">
function confirmation(){
    var result = confirm("Are you sure to delete?");
    if(result){
        // Delete logic goes here
    }
}
</script>
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color: #4CAF50;
  color: white;
}
a:hover {
  
  font-size: 150%;
}
a:hover .tooltiptext {
  visibility: visible;
}
a .tooltiptext {
  visibility: hidden;
  width: 120px;
  background-color: black;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 0;

  /* Position the tooltip */
  position: absolute;
  z-index: 1;
}

</style>

</head>
<body>
	<a href="getPage"><i class='fas fa-grin-stars'><span class="tooltiptext">Add User</span></i></a>
	&nbsp;&nbsp;
	
	<table border="1" >
		<thead>
			<tr>
				<th>Sr.</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th>Mobile Number</th>
				<th>Update</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList}" var="user" varStatus="myIndex">
				<tr>
					<td>${myIndex.index +1}</td>
					<td>${user.first_Name}</td>
					<td>${user.last_name}</td>
					<td>${user.email}</td>
					<td>${user.phno}</td>
					<td><a href="editUser?uid=${user.uid}"><i class='fas fa-edit' style='color:red'><span class="tooltiptext">Edit</span></i></a> &nbsp;&nbsp; <a href="deleteUser?uid=${user.uid}"
						onclick="return confirm('Are you sure to Delete?')"><i class='fas fa-trash-alt' ><span class="tooltiptext">Delete</span></i></a></td>
				</tr>
			</c:forEach>

		</tbody>

		</tbody>
	</table>
	<c:forEach begin="1" end="${tp}" var="i">
		<c:choose>
			<c:when test="${cp==i}">
				<c:out value="${i}"/>
			</c:when>
			<c:otherwise>
				<a href="getDetails2?pn=${cp}"><c:out value="${i}"/></a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${cp<tp}">
	<a href="getDetails2?pn=${cp+1}"><c:out value="${i}"/></a>
	</c:if>

</body>
</html>
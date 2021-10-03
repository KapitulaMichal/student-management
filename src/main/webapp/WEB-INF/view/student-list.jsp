<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student List</title>

<!-- My stylesheet -->

<link rel="stylesheet" type="text/css" href="/studentmanagement/resourcesLink/css/my-style-sheet.css">

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<!-- My Script -->
<script type="text/javascript">

	function deleteConfirm(id, name, surname)
	{
		if (confirm('Do you want to delete student ' + name + ' ' + surname + '?')) {
			window.location.href='deleteStudent?studentId=' + id;
		} 

	}
	
</script>

</head>
<body>

	<div class="container">
		
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="students">Students</a>
				<a class="navbar-brand" href="courses">Courses</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">

					</ul>
					<form class="d-flex">
						<a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">${login.name } ${login.surname }</a>
						<button class="btn btn-outline-primary" type="button" onclick="window.location.href='logout'">Logout</button>
					</form>
				</div>
			</div>
		</nav>

		<h1 class="h1" align="center">Students</h1>
		<br />

		<button type="button" class="btn btn-success"
			onclick="window.location.href='addStudent'">ADD</button>
		<br /> <br />

		<table class="table table-dark table-bordered">

			<tr>
				<th class="text-center">#</th>
				<th class="text-center">NAME</th>
				<th class="text-center">SURNAME</th>
				<th class="text-center">DATE OF BIRTH</th>
				<th class="text-center">PHONE</th>
				<th></th>
				<th></th>
			</tr>

			<c:forEach var="student" items="${students}" varStatus="loop">

				<tr>
					<td class="text-center">${loop.count}</td>
					<td class="text-center">${student.name }</td>
					<td class="text-center">${student.surname }</td>
					<td class="text-center">${student.dateOfBirth }</td>
					<td class="text-center">${student.phone }</td>
					<td class="text-center"><button type="button"
							class="btn btn-primary"
							onclick="window.location.href='editStudent?studentId=${student.id}'">EDIT</button></td>
					<td class="text-center"><button type="button"
							class="btn btn-danger"
							onclick="deleteConfirm(${student.id}, '${student.name}', '${student.surname }')">DELETE</button>
				</tr>

			</c:forEach>

		</table>
		<br /> <br />


	</div>

</body>
</html>
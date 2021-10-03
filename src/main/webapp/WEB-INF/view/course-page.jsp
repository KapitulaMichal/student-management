<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Management</title>
<!-- My stylesheet -->
<link rel="stylesheet" type="text/css"
	href="/studentmanagement/resourcesLink/css/my-style-sheet.css">

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

	function deleteConfirm(id, name, surname, courseId, courseName)
	{
		if (confirm('Do you want to delete student ' + name + ' ' + surname + ' from course ' + courseName + ' ?')) {
			window.location.href='deleteStudentFromCourse?studentId=' + id + '&courseId=' + courseId;
		} 

	}
	
</script>

</head>
<body>

	<div class="container">

		<!-- Modal -->
		<div class="modal fade" id="addStudentModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Add Student</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<table class="table table-dark table-bordered">

							<tr>
								<th class="text-center">#</th>
								<th class="text-center">NAME</th>
								<th class="text-center">SURNAME</th>
								<th></th>
							</tr>

							<c:forEach var="student" items="${otherStudents}"
								varStatus="loop">

								<tr>
									<td class="text-center">${loop.count}</td>
									<td class="text-center">${student.name }</td>
									<td class="text-center">${student.surname }</td>
									<td class="text-center"><button type="button"
											class="btn btn-success"
											onclick="window.location.href='addStudentToCourse?courseId=${course.id}&studentId=${student.id}'">ADD
											TO COURSE</button>
								</tr>

							</c:forEach>

						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="students">Students</a> <a
					class="navbar-brand" href="courses">Courses</a>
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
						<a class="nav-link disabled" href="#" tabindex="-1"
							aria-disabled="true">${login.name } ${login.surname }</a>
						<button class="btn btn-outline-primary" type="button"
							onclick="window.location.href='logout'">Logout</button>
					</form>
				</div>
			</div>
		</nav>


		<!-- Body -->
		<h1 align="center">${course.name }</h1>
		<br />

		<button type="button" class="btn btn-success" data-bs-toggle="modal"
			data-bs-target="#addStudentModal">ADD STUDENT</button>
		<br /> <br />

		<table class="table table-dark table-bordered">

			<tr>
				<th class="text-center">#</th>
				<th class="text-center">NAME</th>
				<th class="text-center">SURNAME</th>
				<th></th>
			</tr>

			<c:forEach var="student" items="${courseStudents}" varStatus="loop">

				<tr>
					<td class="text-center">${loop.count}</td>
					<td class="text-center">${student.name }</td>
					<td class="text-center">${student.surname }</td>
					<td class="text-center"><button type="button"
							class="btn btn-danger"
							onclick="deleteConfirm(${student.id}, '${student.name}', '${student.surname }', '${course.id }', '${course.name }')">DELETE
							FROM COURSE</button>
				</tr>

			</c:forEach>

		</table>
	</div>

</body>
</html>
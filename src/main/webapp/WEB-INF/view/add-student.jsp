<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

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
</head>
<body>

	<div class="container">

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

		<h1 align="center">Add Student</h1>
		<div class="row">

			<div class="col"></div>

			<div class="col-6">
				<form:form modelAttribute="student" action="addOrModifyStudent">
					<div class="mb-3">
						<label for="name" class="form-label">Name</label>
						<form:input class="form-control" type="text" path="name" id="name" />
						<form:errors path="name" class="error"></form:errors>

					</div>

					<div class="mb-3">
						<label for="surname" class="form-label">Surname</label>
						<form:input class="form-control" type="text" path="surname"
							id="surname" />
						<form:errors path="surname" class="error"></form:errors>
					</div>

					<div class="mb-3">
						<label for="dob" class="form-label">Date of birth</label>
						<form:input class="form-control" type="date" value="1995-01-01"
							min="1960-01-01" max="2022-12-31" path="dateOfBirth" id="dob" />
					</div>

					<div class="mb-3">
						<label for="phone" class="form-label">Phone</label>
						<form:input type="number" class="form-control" path="phone"
							id="phone" required="required" />
						<form:errors path="phone" class="error"></form:errors>
					</div>


					<button type="submit" class="btn btn-primary">Submit</button>


				</form:form>

			</div>

			<div class="col"></div>
		</div>
	</div>

</body>
</html>
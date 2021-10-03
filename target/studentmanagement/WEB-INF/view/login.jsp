<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<!-- My stylesheet -->
<link rel="stylesheet" type="text/css"	href="/studentmanagement/resourcesLink/css/my-style-sheet.css">

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

		<h1 align="center">Login</h1>
		<div class="row">

			<div class="col"></div>

			<div class="col-6">
			<span class="error">${message }</span>	<br/><br/>
			
				<form:form modelAttribute="login" action="loginProcess">
					<div class="mb-3">
						<label for="email" class="form-label">Email</label>
						<form:input class="form-control" type="email" path="email" id="email" />
						<form:errors path="email" class="error"></form:errors>					
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Password</label>
						<form:input class="form-control" type="password" path="password"
							id="surname" />
						<form:errors path="password" class="error"></form:errors>
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>

				</form:form>
				
				<br/>
							

			</div>

			<div class="col"></div>
		</div>
	</div>

</body>
</html>
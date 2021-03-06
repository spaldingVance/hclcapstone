<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html lang="en">
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
				aria-controls="navbarTogglerDemo01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				<a class="navbar-brand" href="#">Music Store</a>
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/displayproducts">Products</a></li>
					<li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 offset-md-3 mt-3 mb-3 text-center">
				<div class="row">
					<h2>Edit User</h2>
				</div>
				<form action="/edituser" method="post">
					<div class="row">
						ID : <input type="text" name="id" class="form-control"
							value="${user.id}" required> <br /> User Name : <input
							type="text" name="uname" class="form-control"
							value="${user.username}" required> <br /> Password:<input
							type="text" name="password" value="${user.password}" required>
						<br /> Role : <input type="text" name="role" class="form-control"
							value="${user.role}" required> <br />
					</div>
					<div class="row mt-3">
						<div class="col-md-6 text-center">
							<button class="btn btn-danger" type="button" name="back"
								onclick="history.back()">Back</button>
						</div>
						<div class="col-md-6 text-center">
							<button class="btn btn-primary" type="submit">Submit</button>
						</div>

					</div>
				</form>
			</div>

		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

</body>
</html>
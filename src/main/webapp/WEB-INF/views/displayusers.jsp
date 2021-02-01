<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page
	import="com.hcl.capstone.model.User,com.hcl.capstone.model.Product"%>
<%@ page import="java.util.*"%>
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
	<%
	User u = (User) request.getSession().getAttribute("user");
	%>
	<%
	List<Product> currCart = (List<Product>) request.getSession().getAttribute("cart");
	%>
	<%
	String role = "";
	if (u != null) {
		role = u.getRole();
	}
	%>
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
						aria-current="page" href="#">Home</a></li>


					<%
					if (u != null && role.equalsIgnoreCase("ADMIN")) {
					%>
					<li class="nav-item"><a class="nav-link" href="/orderlist">Order
							List</a></li>

					<li class="nav-item"><a class="nav-link" href="/userlist">User
							List</a></li>
					<%
					}
					if (currCart != null) {
					%>
					<li class="nav-item"><a class="nav-link" href="/currentcart">Shopping
							Cart</a></li>

					<%
					}
					%>

					<%
					if (u == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="/login">Login</a></li>

					<li class="nav-item"><a class="nav-link" href="/register">Register</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>ID</th>
							<th>Username</th>
							<th>password</th>
							<th>role</th>
							<th>Orders</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${userlist}" var="users">
							<tr>
								<td class="text-center">${users.id }</td>
								<td class="text-center">${users.username }</td>
								<td class="text-center">${users.password }</td>
								<td class="text-center">${users.role }</td>
								<td class="text-center">${users.orders }</td>
								<td class="text-center"><a href="/edituser?id=${users.id}">Edit</span></a>
									<a href="/deleteuser?id=${users.id}">Delete</span></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>


</body>
</html>
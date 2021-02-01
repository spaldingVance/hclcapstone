<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page
	import="com.hcl.capstone.model.User,com.hcl.capstone.model.Product"%>
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
					<li class="nav-item"><a class="nav-link"
						href="/displayproducts">Products</a></li>

					<%
					if (u != null && u.getRole().equalsIgnoreCase("ADMIN")) {
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
		<div id="carouselExampleDark" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<ol class="carousel-indicators">
				<li data-bs-target="#carouselExampleDark" data-bs-slide-to="0"
					class="active"></li>
				<li data-bs-target="#carouselExampleDark" data-bs-slide-to="1"></li>
				<li data-bs-target="#carouselExampleDark" data-bs-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="10000">
					<img
						src="https://cdn.pixabay.com/photo/2017/08/06/20/59/people-2596263_1280.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>First slide label</h5>
						<p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
					</div>
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img
						src="https://cdn.pixabay.com/photo/2016/08/11/16/35/store-1586117_1280.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Second slide label</h5>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
					</div>
				</div>
				<div class="carousel-item">
					<img
						src="https://cdn.pixabay.com/photo/2018/02/23/17/03/sound-3176043_1280.jpg"
						class="d-block w-100" alt="...">
					<div class="carousel-caption d-none d-md-block">
						<h5>Third slide label</h5>
						<p>Praesent commodo cursus magna, vel scelerisque nisl
							consectetur.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleDark"
				role="button" data-bs-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleDark"
				role="button" data-bs-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
			</a>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

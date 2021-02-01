<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			<div class="col-sm d-flex">
				<div class="card card-body flex-fill">
					<h5 class="card-title">Product Photo</h5>
					<p class="card-text">
						<img src=${product.photoUrl }>
					</p>
				</div>
			</div>
			<div class="col-sm d-flex">
				<div class="card card-body flex-fill">
					<h5 class="card-title">Product Details</h5>
					<p class="card-text">
						<b>Product ID</b> : ${product.id } <br> <b>Product Name</b> :
						${product.productName} <br> <b>Product Condition</b> :
						${product.productCondition } <br> <b>Product Category</b> :
						${product.productCategory } <br> <b>Product Price</b> :
						${product.productPrice} <br>
					</p>
				</div>

			</div>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>


</body>
</html>

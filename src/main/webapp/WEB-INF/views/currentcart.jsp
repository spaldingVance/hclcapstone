<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page
	import="com.hcl.capstone.model.User,com.hcl.capstone.model.Product,java.util.List,java.math.*"%>
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
	if (currCart != null) {
	%>
	<%

	%>


	<%
	Double totalPrice = 0.0;
	%>
	<%
	int quantity = currCart.size();
	%>
	<%
	int index = 0;
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
			<div class="col-md-8 offset-md-2 mt-3 mb-3 text-center">
				<div class="row">

					<table class="table table-striped table-hover" id="myTable">
						<thead class="table-dark">
							<tr>
								<th>Product Photo</th>
								<th>Product Name</th>
								<th>Product Condition</th>
								<th>Product Category</th>
								<th>Product Price</th>
							</tr>
						</thead>
						<tbody>
							<%
							for (Product p : currCart) {
							%>

							<tr>

								<td><img src=<%out.println(p.getPhotoUrl());%>
									class="img-responsive" style="width:100%"></td>
								<td class="text-center" style="width: 100%">
									<%
									out.println(p.getProductName());
									%>
								</td>
								<td class="text-center" style="width: 10%">
									<%
									out.println(p.getProductCondition());
									%>
								</td>
								<td class="text-center" style="width: 10%">
									<%
									out.println(p.getProductCategory());
									%>
								</td>
								<td class="text-center" style="width: 10%">$<%
								out.println(p.getProductPrice());
								%>
								</td>
							</tr>
							<%
							totalPrice += p.getProductPrice();
							%>

							<%
							}
							%>
						</tbody>
						<tfoot>

						</tfoot>

					</table>
				</div>

				<div class="row">
					<div class="col-md-3 offset-md-3 mt-3 mb-3 text-center">
						Quantity :
						<%out.println(quantity);%>
					</div>
					<div class="col-md-3 mt-3 mb-3 text-center">
						Total Price : $<%
					totalPrice = Math.round(totalPrice * 100.0) / 100.0;
					out.println(totalPrice);
					%>
					</div>
				</div>
				<%
				if (quantity > 0) {
				%>
				<a type="button" class="btn btn-success" style="width: 40%"
					href="/checkoutpage">Checkout</a>
				<%}%>
			</div>
		</div>
	</div>




	<%
	}
	%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

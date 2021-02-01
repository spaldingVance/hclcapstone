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
			<div class="col-md-8 offset-md-2 mt-3 mb-3 text-center">
				<div id="inputBox">
					<input type="text" id="myInput" onkeyup="myFunction()"
						placeholder="Search for a product" title="Type in a product">

				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<table class="table table-striped table-hover" id="myTable">
					<thead class="table-dark">
						<tr>
							<th>Product ID</th>
							<th>Product Photo</th>
							<th>Product Name</th>
							<th>Product Condition</th>
							<th>Product Category</th>
							<th>Product Price</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList}" var="product">
							<tr>
								<td class="text-center" style="width: 10%">${product.id}</td>
								<td class="text-center" style="width: 100%"><img
									style="width: 40%" src="${product.photoUrl}"
									class="img-responsive"></td>
								<td class="text-center" style="width: 100%">${product.productName}</td>
								<td class="text-center" style="width: 100%">${product.productCondition }</td>
								<td class="text-center" style="width: 100%">${product.productCategory }</td>
								<td class="text-center" style="width: 100%">${product.productPrice}</td>
								<td class="text-center" style="width: 100%">
									<div class="row">
										<a class="text-center" style="width: 100%"
											href="/productdetail?id=${product.id}">Product Details</a>
									</div> <%if (!role.equals("")) {%>
									<div class="row">
										<a class="text-center" style="width: 100%"
											href="/addtocart?id=${product.id}">Add to Cart</a>
									</div> <%
 }

 if (role.equalsIgnoreCase("admin")) {
 %>

									<div class="row">
										<a class="text-center" style="width: 100%"
											href="/editproduct?id=${product.id}">Edit</a>
									</div>
									<div class="row">
										<a href="/deleteproduct?id=${product.id}" style="width: 100%">Delete</a>
									</div> <%
 }
 %>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
		<%
		if (role.equalsIgnoreCase("admin")) {
		%>
		<div class="row">
			<div class="col-md-8 offset-md-2 mt-3 mb-3 text-center">
				<a type="button" class="btn btn-primary" href="/addproduct">New Product</a>
			</div>

		</div>
		<%}%>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>

	<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
</body>
</html>

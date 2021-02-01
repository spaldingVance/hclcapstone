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
						placeholder="Search for an order" title="Type in a order">

				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<table class="table table-striped table-hover">
					<thead class="table-dark">
						<tr>
							<th>Order ID</th>
							<th>Order Quantity</th>
							<th>Order Price</th>
							<th>Order Billing Address</th>
							<th>Order Shipping Address</th>
							<th>Order User</th>
							<th>Order User Id</th>
							<th>Order User role</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderlist}" var="order">
							<tr>
								<td>${order.id}</td>
								<td>${order.orderQuantity}</td>
								<td>${order.orderPrice}</td>
								<td>${order.bAddress }</td>
								<td>${order.sAddress }</td>
								<td>${order.user.getUsername() }</td>
								<td>${order.user.getId() }</td>
								<td>${order.user.getRole() }</td>
								<td><a href="/deleteorder?id=${order.id}"><span
										class="glyphicon glyphicon-remove"></span></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page
	import="com.hcl.capstone.model.User,com.hcl.capstone.model.Product,java.util.*"%>
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


	<%
	User u = (User) request.getSession().getAttribute("user");
	%>
	<%
	List<Product> currCart = new ArrayList<>();
	%>
	<%
	Double totalPrice = 0.0;
	%>
	<%
	Date dt = new Date();
	%>
	<%
	Calendar c = Calendar.getInstance();
	c.setTime(dt);
	c.add(Calendar.DATE, 2);
	dt = c.getTime();
	%>



	<%
	int quantity = 0;
	%>
	<%
	int index = 0;
	%>
	<%
	if (u != null) {
	%>
	<%
	currCart = (List<Product>) request.getSession().getAttribute("cart");
	%>
	<%
	}
	%>
	<%
	if (currCart != null) {
	%>
	<%
	quantity = currCart.size();
	%>


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
									class="img-responsive" style="width: 100%"></td>
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
						<h4>Quantity :
						<%out.println(quantity);%></h4>
					</div>
					<div class="col-md-3 mt-3 mb-3 text-center">
						Total Price : $<%
					totalPrice = Math.round(totalPrice * 100.0) / 100.0;
					out.println(totalPrice);
					%>
					</div>
				</div>
				<div class="row">
					<form method="post" onsubmit="myfunction()">
						<c:if test="${not empty error}">
							<p id="err">Error: ${error}</p>
						</c:if>
						Your Billing Address : <input name="bAddress" type="text" required />
						<br /> Your Shipping Address : <input name="sAddress" type="text"
							required /> <br /> Your Total Price : $<% out.println(totalPrice);%>
						<input type="hidden" name="orderPrice" step="0.01"
							value="<%out.println(totalPrice);%>" /> <br /> Order Quantity :
						<%
 out.println(quantity);
 %>
						<input type="hidden" name="orderQuantity"
							value=" <%out.println(quantity);%>" /> <br /> Expected Shipping
						Date :
						<%
 out.println(dt);
 %><input type="hidden" name="shippingDate"
							value=" <%out.println(dt);%>" /> <br /> <input type="hidden"
							name="userId" value="<%out.println(u.getId());%>" />
					</div>
					<div class="panel-footer">
						<button class="btn btn-warning" type="button" name="back"
							onclick="history.back()">Click to Go Back to your cart</button>
						<button class="btn btn-success" type="submit">Click Here
							to check out your order!</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<%
	}
	%>
	<script>
function myfunction() {
	alert("Thank you for your order!")
}
</script>
</body>
</html>
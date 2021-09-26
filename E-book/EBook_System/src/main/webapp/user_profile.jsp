<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allCss_file.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black
}

a:hover {
	text-decoration: none;
}

.crd-ho:hover {
	background-color: #FFFF99;
}

</style>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	<%
	if (user == null) {
		session.setAttribute("errorMsg", "Please Login..");
		response.sendRedirect("login.jsp");
	} else {
	%>
	<h3 class="text-center pt-3">
		Hello,<%=user.getName()%></h3>
	<%
	}
	%>




	<div class="container p-4">

		<div class="row">
			<div class="col-md-4">
				<a href="sell_book.jsp"><div class="card crd-ho text-center">
						<div class="card-body">
							<div class="text-primary ">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							<h4>Sell Old Book</h4>
							<p>Selling</p>
						</div>
					</div></a>
			</div>
			
			<div class="col-md-4">
				<a href="old_books.jsp"><div class="card crd-ho text-center">
						<div class="card-body">
							<div class="text-info">
								<i class="fas fa-book fa-3x"></i>
							</div>
							<h4>Old Book</h4>
							<p>Remove</p>
						</div>
					</div></a>
			</div>

			<div class="col-md-4">
				<a href="edit_profile.jsp"><div class="card crd-ho text-center">
						<div class="card-body">
							<div class="text-success">
								<i class="fas fa-shield-alt fa-3x"></i>
							</div>
							<h4>Login & Security (Edit Profile)</h4>

						</div>
					</div></a>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-4">
				<a href="user_address.jsp"><div class="card crd-ho text-center ">
						<div class="card-body">
							<div class="text-warning ">
								<i class="fas fa-map-marker-alt fa-3x"></i>

							</div>
							<h4>Your Address</h4>
							<p>Edit Address</p>
						</div>
					</div></a>
			</div>

			<div class="col-md-4">
				<a href="user_order.jsp"><div class="card crd-ho text-center">
						<div class="card-body">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							<h4>My Order</h4>
							<p>Track your Order</p>
						</div>
					</div></a>
			</div>

			<div class="col-md-4">
				<a href="contact.jsp"><div class="card crd-ho text-center">
						<div class="card-body">
							<div class="text-secondary">
								<i class="fas fa-hands-helping fa-3x"></i>
							</div>
							<h4>Help Center</h4>
							<p>24*7 Service</p>
						</div>
					</div></a>
			</div>

		</div>
	</div>
	
</body>
</html>
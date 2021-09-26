<%@page import="com.entity.bookDtls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allCss_file.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="navbar.jsp"%>
	<%
	String sucessMsg = (String) session.getAttribute("sucessMsg");
	String errorMsg = (String) session.getAttribute("errorMsg");
	bookDtls b = (bookDtls) session.getAttribute("book");
	%>
	
	<a href="all_books.jsp" style="text-decoration: none;">
		<h3 class="text-primary ml-3"><i class="fas fa-chevron-circle-left"></i>Back</h3>
	</a>


	<div class="container-fluid">
		<div class="row mt-2">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h5 class="text-primary" style="margin-bottom: 40px">Update Book Poster</h5>
							<%
							if (sucessMsg != null) {
							%>
							<p class="text-success"><%=sucessMsg%></p>
							<%
							session.removeAttribute("sucessMsg");
							}

							if (errorMsg != null) {
							%>
							<p class="text-danger"><%=errorMsg%></p>
							<%
							session.removeAttribute("errorMsg");
							}
							%>
						</div>

						<form action="../imageUpdateServlet" method="post" enctype="multipart/form-data">
							<input type="hidden" value="<%= b.getId()%>" name="bookId">
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							
						<div class="text-center" style="margin-top: 20px">
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>
<%@page import="com.entity.bookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.conn.ConnectionProvider"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Old Books</title>
<%@include file="all_component/allCss_file.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg }</p>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	
	<c:if test="${not empty errMsg }">
		<p class="text-center text-success">${errMsg }</p>
		<c:remove var="errMsg" scope="session"/>
	</c:if>

	<div class="container p-5">

		<table class="table table-striped">
			<thead class="bg-dark text-white text-center">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody class="text-center">
			
			<%
				userDtls u = (userDtls)session.getAttribute("LoginUser");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(ConnectionProvider.getConnection());
				List<bookDtls> list = dao.getBookByOld(email, "Old");
				for(bookDtls b : list)
				{
				%>
					
					<tr>
					<td><%= b.getBookName() %></td>
					<td><%= b.getAuthorName() %></td>
					<td><%= b.getPrice() %></td>
					<td><%= b.getCategories() %></td>
					<td>
						<a href="delete_old_book?em=<%=email%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt fa-2x"></i></a>
					</td>
					</tr>
					
					
				<%	
				}
			%>
			
			</tbody>
		</table>

	</div>

</body>
</html>
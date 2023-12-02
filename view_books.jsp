<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.DAO.BookDAOimpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.BookDtls" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allComponent/allCSS.jsp"%>

</head>
<body style="background-color: #f0f1f2">
	<%@include file="allComponent/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOimpl dao=new BookDAOimpl(DBConnect.getConn());
	BookDtls b=dao.getBookById(bid);
	
	%>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName() %>" style="height: 200px; width: 150px;"><br>
				<h4 class="mt-3">Book Name:<span class="text-success"> <%=b.getBookName() %></span></h4>
				<h4>Author Name: <span class="text-success"> <%=b.getAuthor() %></span></h4>
				<h4>Category: <span class="text-success"> <%=b.getBookCategory() %></span></h4>
			</div>

			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName() %></h2>
				
				<%
				if("Old".equals(b.getBookCategory())){%>
				<h5 class="text-primary">Contact to seller</h5>
				<h5 class="text-primary"><i class="fas fa-envelope"></i> Email: <%=b.getEmail() %></h5>
					
				<%}
				%>
				
				<div class="row">
					<div class="col-md-4 text-danger text-center p-2 ">
						<i class="fas fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 ">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2 ">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
				</div>
				
				<%
				if("Old".equals(b.getBookCategory())){%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-primary"><i class="fas fa-cart-plus mr-1"></i>Continue Shopping</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign mr-1"></i>299</a>

				</div>
					
				<%} else {%>
					<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus mr-1"></i>Add Cart</a> <a href=""
						class="btn btn-danger"><i class="fas fa-rupee-sign mr-1"></i>299</a>

				</div>
				<% }
				%>

				
			</div>



		</div>
	</div>
</body>
</html>
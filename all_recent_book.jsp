<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.DAO.BookDAOimpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.BookDtls"%>
<%@ page import="com.entity.User" %>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Recent Books</title>
    <%@include file="allComponent/allCSS.jsp"%>
    <style type="text/css">
        .back-img {
            background: url("img/books.jpg");
            height: 50vh;
            width: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .crd-ho:hover {
            background-color: #fcf7f7;
        }
    </style>
</head>
<body>

    <%
        User u = (User) session.getAttribute("userobj");
    %>
    <%@include file="allComponent/navbar.jsp"%>
    <div class="container-fluid">
        <div class="row p-3">
            <%
                BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
                List<BookDtls> list2 = dao2.getRecentBook();

                for (BookDtls b : list2) {
            %>
            <div class="col-md-3">
                <div class="card crd-ho mt-2">
                    <div class="card-body text-center">
                        <img alt="" src="book/<%=b.getPhotoName() %>"
                            style="width: 120px; height: 170px;" class="img-thumblin">
                        <p><%=b.getBookName() %></p>
                        <p><%=b.getAuthor() %></p>

                        <%
                            if (b.getBookCategory().equals("Old")) {
                        %>
                        <p>Categories: <%=b.getBookCategory() %></p>
                        <div class="row"> <!-- Corrected: Change : to = -->
                            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View</a>
                            <a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign mr-1"></i><%=b.getPrice() %></a>
                        </div>

                        <%
                            } else {
                        %>
                        <p>Categories: <%=b.getBookCategory() %></p>
                        <div class="row"> <!-- Corrected: Change : to = -->
                            <%
                                if (u == null) {
                            %>
                            <a href="login.jsp" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>
                            <%} else {%>
                            <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm"><i class="fas fa-cart-plus"></i>Add Cart</a>
                            <%}
                                %>
                            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-1">View</a>
                            <a href="" class="btn btn-danger btn-sm ml-1"><i class="fas fa-rupee-sign mr-1"></i><%=b.getPrice() %></a>
                        </div>

                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admincss.css">
        <title>List User</title>
        <%

            if (session.getAttribute("register") == null || session.getAttribute("register") == " ") //check condition unauthorize user not direct access welcome.jsp page
            {
                response.sendRedirect("signin.jsp");
            }
        %>
    </head>
    <body>
        
            <ul>
                <li><a href="UserControl?action=home">Home</a></li>
                <li><a href="UserControl?action=listUser">User</a></li>
                <li><a href="ItemControl?action=listItem">Item</a></li>
                <li><a href="ReservationControl?action=listReserv">Reservation</a></li>
                <li style="float:right"><a class="active" href="logout.jsp">Sign Out</a></li>
            </ul>
        

        <br/>
    <center><h1>List of User</h1>
 
    <table class="styled-table">
        <thead>
            <tr>
                <th>User Id</th>
                <th>Full name</th>
                <th>MyKad</th>
                <th>Phone No</th>
                <th>Email</th>
                <th>Username</th>
                <th>Password</th>
                <th>Action</th>
            </tr> 
        </thead>
        <tbody>
            <c:forEach items="${register}" var="user">
                <tr>
                    <td><c:out value="${user.userid}"/></td>
                    <td><c:out value="${user.fullname}"/></td>
                    <td><c:out value="${user.mykad}"/></td>
                    <td><c:out value="${user.notel}"/></td>
                    <td><c:out value="${user.email}"/></td>
                    <td><c:out value="${user.username}"/></td>
                    <td><c:out value="${user.password}"/></td>
                    <td><a href="UserControl?action=delete&userid=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </center>

</body>
</html>

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
    <center><h1>List of Reservation</h1>
         <table class="styled-table">
               <thead>
                <tr>
                    <th>Reservation ID</th>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Phone No</th>
                    <th>Email</th>
                    <th>Facilities</th>
                    <th>Equipment</th>
                    <th>Date</th>
                    <th>Status</th>
                     <th>Reason</th>
                    <th colspan="2">Option of Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${resrv}" var="resrvs">

                    <tr>
                        <td><c:out value="${resrvs.resID}"/></td>
                        <td><c:out value="${resrvs.userid}"/></td>
                        <td><c:out value="${resrvs.fullname}"/></td>
                        <td><c:out value="${resrvs.notel}"/></td>
                        <td><c:out value="${resrvs.email}"/></td>
                        <td><c:out value="${resrvs.facilities}"/></td>
                        <td><c:out value="${resrvs.equipment}"/></td>
                        <td><c:out value="${resrvs.date}"/></td>
                        <td><c:out value="${resrvs.status}"/></td>
                        <td><c:out value="${resrvs.reason}"/></td>
                        <td><a href="ReservationControl?action=edit&resID=<c:out 
                                   value="${resrvs.resID}"/>">Update</a></td>
                        <td><a href="ReservationControl?action=delete&resID=<c:out 
                                   value="${resrvs.resID}"/>">Delete</a></td>
                    </tr>                   
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
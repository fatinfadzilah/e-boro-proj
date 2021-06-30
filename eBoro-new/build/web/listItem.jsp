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
    <center><h1>List of Item</h1>
        
    <button onclick="window.location.href = 'ItemControl?action=insert'" class="button" style="vertical-align:middle">Add Item</button>
    
        <table class="styled-table">
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Date Supplier</th>
                    <th>Quantity</th>
                    <th>Balance</th>
                    <th colspan="2">Option of Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${items}" var="item">

                    <tr>
                        <td><c:out value="${item.itemID}"/></td>
                        <td><c:out value="${item.itemName}"/></td>
                        <td><c:out value="${item.description}"/></td>
                        <td><c:out value="${item.dateSup}"/></td>
                        <td><c:out value="${item.quantity}"/></td>
                        <td><c:out value="${item.balance}"/></td>
                        <td><a href="ItemControl?action=edit&itemID=<c:out 
                                   value="${item.itemID}"/>">Update</a></td>
                        <td><a href="ItemControl?action=delete&itemID=<c:out 
                                   value="${item.itemID}"/>">Delete</a></td>
                    </tr>                   
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
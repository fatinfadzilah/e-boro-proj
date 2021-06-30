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
    <center><h1>Update Item</h1></center>
        <form name="frmEditUser" action="ItemControl" method="post">

            <div style="width:50%;">
                <label>Item ID</label>
                <input type="text" name="itemID"  size="40" readonly="readonly" value="<c:out value="${item.itemID}" />" /><br/><br/>

                <label>Item Name</label>
               <input type="text" name="itemName" value="<c:out value="${item.itemName}" />" /><br/><br/>

                <label>Description</label>
                <textarea id="id" name="description" rows="3" cols="33"><c:out value="${item.description}"/>
                </textarea><br/><br/>

                <label>Date supplier </label>
                <input type="date" name="dateSup"  value="<c:out value='${item.dateSup}'/>"/><br/><br/>

                <label>Quantity</label>
                <input type="number" name="quantity"  value="<c:out value='${item.quantity}'/>"/><br/><br/>
                
                <label>Balance</label>
                <input type="number" name="balance" value="<c:out value='${item.balance}'/>"/><br/><br/>
            </div>
            <input type="hidden" name="action"  value="edit" />
            <input type="submit" name="submit" value="Submit" />
            
        </form>
    </body>
</html>

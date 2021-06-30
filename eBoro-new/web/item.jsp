<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admincss.css">
        <title>Add Item</title>
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
    <center>
        <h1>Item Form</h1>
        
          </center>
            <form name="frmAddUser" action="ItemControl" method="post">
               
                 <div style="width:50%;">
                <label >Item Name</label>
                <input type="text" name="itemName"  size="40" /><br/>

                <label >Description</label>
                <textarea id="description" name="description" rows="4" cols="50"></textarea><br/>

                <label >Date Supplier</label>
                <input  type="date" name="dateSup" size="40" /><br/><br/>

                <label >Quantity</label>
                <input type="number" name="quantity" size="40" /><br/><br/>

                <label>Balance</label>
                <input type="number" name="balance" size="40" /><br/>
                </div>
                <input type="hidden" name="action" value="insert"/>
                <input type="submit" value="Submit" name="submit"/>
                <input type="reset" value="Cancel" name="cancel"/>                

            </form>
    </body>
</html>

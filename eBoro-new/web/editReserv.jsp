<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admincss.css">
        <title>List Reservation</title>
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
    <center><h1>Update Reservation</h1></center>


    <form name="frmEditUser" action="ReservationControl" method="post">
        <div style="width:50%;">
            <label>Reservation ID</label>
            <input type="text" name="resID" value="<c:out value='${resrv.resID}'/>"  readonly/><br/><br/>

            <label>User ID </label>
            <input type="text" name="userid" value="<c:out value='${resrv.userid}'/>"  readonly/><br/><br/>


            <label>Full Name </label>
            <input type="text" name="fullname" value="<c:out value='${resrv.fullname}'/>"  readonly/><br/><br/>


            <label>Phone No </label>
            <input type="text" name="notel" value="<c:out value='${resrv.notel}'/>"  readonly/><br/><br/>


            <label>Email</label>
            <input type="text" name="email" value="<c:out value='${resrv.email}'/>" readonly/><br/><br/>

            <label>Facilities</label>
            <input type="text" name="facilities" value="<c:out value='${resrv.facilities}'/>" readonly/><br/><br/>

            <label>Equipment</label>
            <input type="text" name="equipment" value="<c:out value='${resrv.equipment}'/>" readonly/><br/><br/>

            <label>Date</label>
            <input type="text" name="date" value="<c:out value='${resrv.date}'/>" readonly/><br/><br/>

            <label>Status</label>
            <select  id="status" name="status">
                <option><c:out value='${resrv.status}'/></option>
                <option>Accept</option>
                <option>Reject</option>
            </select><br/><br/>

            <label>Reason</label>
            <select  id="reason" name="reason">
                 <option><c:out value='${resrv.reason}'/></option>
                <option>Please come to office to pick up the equipment 1 day before the booking date</option>
                <option>Please come to office to take receipt 1 day before the booking date</option>
                <option>Facilities & Equipment Full Booking</option>
                <option>Facilities Full & Equipment Available (Please resubmit new form for facilities)</option>
                <option>Facilities Available & Equipment Full (Please resubmit new form for equipment)</option>
            </select><br/><br/>
        </div>
        <input type="hidden" name="action"  value="edit"/>
        <input type="submit" name="submit" value="Submit" />
    </form>
</body>
</html>
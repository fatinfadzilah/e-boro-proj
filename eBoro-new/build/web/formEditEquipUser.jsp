<%-- 
    Document   : formEditEquipUser
    Created on : Jun 21, 2021, 7:56:00 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/personalinfo.css" rel="stylesheet">
        <title>Facilities & Equipment Reservation Form Edit</title>
        <%
            if (session.getAttribute("register") == null || session.getAttribute("register") == " ") //check condition unauthorize user not direct access welcome.jsp page
            {
                response.sendRedirect("signin.jsp");
            }
        %>
    </head>
    <body>
        <div class="sidenav">
            <img src="css/images/logo.png" alt="" width="200"  class="center">
            <br>
            <br>
            <a href="mainpage.jsp">Home</a>
            <button class="dropdown-btn">Reservation 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="UController?action=insertEqui&username=<%=session.getAttribute("register")%>"">Facilities & Equipment Form</a>
            </div>
            <a href="UController?action=edit&username=<%=session.getAttribute("register")%>">Personal Information</a>
        </div>
        <div class="main">
            <div class="form-white-background">
                <div class="form-title-row" >
                    <h1>Facilities & Equipment Reservation Form Edit</h1>
                </div>
                <form name="frmEditUser" action="UController" method="post">
                    <table border="0">
                        <tbody>
                                <tr>
                               
                                <td><input type="hidden" name="resID" value="<c:out value='${reserv.resID}'/>" class="form-control" readonly/>
                            </tr>
                            <tr>
                                <td><input type="hidden" name="userid" value="<c:out value='${reserv.userid}'/>" class="form-control" readonly/></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" name="fullname" value="<c:out value='${reserv.fullname}'/>" class="form-control" readonly/></td>
                            </tr>
                            <tr>
                                <td>Phone No</td>
                                <td><input type="text" name="notel" value="<c:out value='${reserv.notel}'/>" class="form-control" readonly/></td>
                            </tr>
                            
                            <tr>
                                <td>Email</td>
                                <td><input type="text" name="email" value="<c:out value='${reserv.email}'/>" class="form-control" readonly/></td>
                            </tr>
                            
                            <tr> 
                                <td >Facilities</td>
                                <td ><select  name="facilities" id="facilities"  style="width:390px" >
                                        <option value="<c:out value='${reserv.facilities}'/>" selected><c:out value='${reserv.facilities}'/></option>
                                         <option value="" >Please select equipment </option>
                                        <option value="Squash Court">Squash Court</option>
                                        <option value="Volleyball Court">Volleyball Court</option>
                                        <option value="Football Field">Football Field</option>
                                        <option value="Tennis Court">Tennis Court</option>
                                        <option value="Netball Court">Netball Court</option>
                                        <option value="Petanque Court">Petanque Court </option>
                                        <option value="Private Gymnasium">Private Gymnasium</option>
                                        <option value="UiTM and NSC Halls">UiTM and NSC Halls</option>
                                        <option value="Dungun District Council Hall">Dungun District Council Hall</option>
                                    </select>	
                                </td>
                            </tr>
                            <tr>
                                <td align="right">Equipment</td>
                                <td ><select name="equipment" id="equipment"  style="width:390px" >
                                         <option value="<c:out value='${reserv.equipment}'/>" selected><c:out value='${reserv.equipment}'/></option>
                                         <option value="" >Please select equipment </option>
                                        <option value="Shuttlecock">Shuttlecock</option>
                                        <option value="Set of petanque equipment">Set of petanque equipment</option>
                                        <option value="Tennis Ball">Tennis Ball</option>
                                        <option value="Tennis Ball">NetBall</option>
                                        <option value="Bicycle">Bicycle</option>
                                        <option value="Canopy">Canopy</option>
                                        <option value="Set of DJ">Set of DJ</option>
                                        <option value="Table Tennis">Table Tennis </option>
                                        <option value="Football">Football</option>
                                    </select>	
                                </td>
                            </tr>
                            <tr>
                                <td> Date</td>
                                <td><input type="date" name="date" value="<c:out value='${reserv.date}'/>" class="form-control" /></td>
                            </tr>

                            <tr>
                                <td><input type="hidden" name="status" value="<c:out value='${reserv.status}'/>" class="form-control" readonly/>
                                    </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="hidden" name="reason" value="<c:out value='${reserv.reason}'/>" class="form-control" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="hidden" name="action"  value="reservEqui" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" name="submit" value="Submit" /></td>
                            </tr>
                        </tbody>
                    </table>            
                </form>
            </div>
        </div>
        <script src="js/dropdown.js"></script>
    </body>
</html>

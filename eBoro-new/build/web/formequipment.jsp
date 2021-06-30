<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/personalinfo.css" rel="stylesheet">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <title>Facilities & Equipment Reservation Form</title>
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
            <div class="form-white-background-facility">
                <br/>
                <br/>
                <h1>Facilities & Equipment Reservation Form</h1>
                <form action="UController"  method="POST">
                    <br/>
                    <table class="table-form" border="0">
                        <tr> 
                            <tr
                            <td> <input type="hidden" name="userid"  value="<c:out value="${user.userid}" />" size="40" readonly/> 	
                        </tr>

                        <tr> 
                            <td align="right">Name</td>
                            <td ><input type="text" name="fullname" size="50" value="<c:out value="${user.fullname}" />" readonly="readonly"/> 	
                        </tr>
                        <tr>        
                            <td align="right">Phone No</td>
                            <td ><input type="text" name="notel" size="50" value="<c:out value="${user.notel}" />" readonly="readonly"/>	
                        </tr>
                        <tr> 
                            <td  align="right">Email</td>
                            <td ><input type="text" name="email" size="50" value="<c:out value="${user.email}" />" readonly="readonly"/>		 
                        </tr>
                        <tr> 
                            <td align="right">Facilities</td>
                            <td><select name="facilities" id="facilities"  style="width:390px" >
                                    <option value="" selected>Please select facilities</option>
                                    <option value="Badminton Court">Badminton Court</option>
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
                                    <option value="" selected>Please select equipment </option>
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
                            <td  align="right">Date<br/></td>
                            <td><input type="date" name="date"/></td>
                        </tr>

                      <tr>
                        <input type="hidden" id="reason" name="reason" value=" "/>
                        <input type="hidden" name="status" value="Pending"/>
                        <input type="hidden" name="action" value="insertReserv"/>
                    </tr>
                    <tr>
                    <td align="right">&nbsp;</td>
                    <td align="left">
                        <input type="submit" value="Submit" name="submit" />
                    </td>
                </tr>
            </table> 
        </form> 

        <table width="100%" border="0" bordercolor="#CCCCCC" cellpadding="0" cellspacing="1" style="border:1px #CCCCCC solid">  
            <thead>
                <tr class="title"> 
                    <th  align="center">Name</th>
                    <th  align="center">Phone No</th>
                    <th  align="center">Email </th>
                    <th  align="center">Facilities</th>
                    <th  align="center">Equipment</th>
                    <th  align="center">Date </th>
                    <th  align="center">Status</th>
                    <th  align="center">Reason</th>   
                    <th align="center" colspan="2">Activity</th>
                </tr>
            </thead>
            <tbody >
                <c:forEach items="${reserv}" var="reservs">
                    <tr >
                        <td align="center"><c:out value="${reservs.fullname}"/></td>
                        <td align="center"><c:out value="${reservs.notel}"/></td>
                        <td align="center"><c:out value="${reservs.email}"/></td>
                        <td align="center"><c:out value="${reservs.facilities}"/></td>
                        <td align="center"><c:out value="${reservs.equipment}"/></td>
                        <td align="center"> <c:out value="${reservs.date}"/></td>
                           <td align="center"><c:out value="${reservs.status}"/></td>
                        <td align="center"><c:out value="${reservs.reason}"/></td>
                     
                        <td><a href="UController?action=reservEqui&resID=<c:out value="${reservs.resID}"/>">Update</a></td>
                        <td><a href="UController?action=delete&resID=<c:out value="${reservs.resID}"/>&username=<%=session.getAttribute("register")%>">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>                    
    </div>
</div>
<script src="js/dropdown.js"></script>
</body>
</html>

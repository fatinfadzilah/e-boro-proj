<%-- 
    Document   : editUser
    Created on : May 31, 2021, 7:51:41 PM
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
        <title>Personal Information</title>
        <%
            //dindinggg

            if (session.getAttribute("register") == null || session.getAttribute("register") == " ") //check condition unauthorize user not direct access welcome.jsp page
            {
                response.sendRedirect("loginCust.jsp");
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
                    <h1>Personal Information</h1>
                </div>
                <form name="frmEditUser" action="UController" method="post">
                          <%
                                if (request.getAttribute("Msg") != null) {
                                    out.println(request.getAttribute("Msg")); //register success message
                                } 
                            %>
                    

                        <input type="hidden" name="userid"  id="userid" value="<c:out value="${user.userid}" />" size="40" /><br/><br/>

                        <label> Name :</label>
                        <input type="text" name="fullname" readonly="readonly" id="fullname" value="<c:out value="${user.fullname}" />" size="40" /><br/><br/>



                        <label> Mykad :</label>
                        <input type="text" name="mykad" readonly="readonly" value="<c:out value="${user.mykad}" />" size="40"/><br/><br/>



                        <label> Phone No :</label>
                        <input type="text" name="notel"  value="<c:out value="${user.notel}" />" size="40"/><br/><br/>



                        <label> Email :</label>
                        <input type="text" name="email"  value="<c:out value="${user.email}" />" size="40" /><br/><br/>



                        <label> Username :</label>
                        <input type="text" name="username"  value="<c:out value="${user.username}" />" size="40" readonly/><br/><br/>



                        <label> Password :</label>
                        <input type="text" name="password"  value="<c:out value="${user.password}" />" size="40"/><br/><br/>

                    <input type="hidden" name="action" value="edit"/></<td>

                    <center>
                        <input type="submit" value="Update" name="submit"/>

                    </center>
                </form> 
            </div>
        </div>
        <script src="js/dropdown.js"></script>
    </body>
</html>

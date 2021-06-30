<%-- 
    Document   : listUser
    Created on : May 31, 2021, 7:20:36 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display personal information</title>
    </head>
    <body>
        <p>List of User..!!</p>
        <table border=1>
            <thead>
                <tr>
                    <th>User Id</th>
                    <th>Full name</th>
                    <th>My Kad</th>
                    <th>No Telephone</t>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th colspan="2">Action</th>
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
                <td><a href="UController?action=edit&userid=<c:out value="${user.userid}"/>">Update</a></td>
                <td><a href="UController?action=delete&userid=<c:out value="${user.userid}"/>">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
        </table>
        <p><a href="UController?action=insert">Add User</a></p>
    </body>
</html>

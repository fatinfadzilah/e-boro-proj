<%-- 
    Document   : logout
    Created on : Jun 18, 2021, 2:49:12 AM
    Author     : User
--%>
<% 
session.invalidate(); //destroy session
response.sendRedirect("home.jsp");
%>



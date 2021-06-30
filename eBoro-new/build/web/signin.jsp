<%-- 
    Document   : signin
    Created on : Jun 18, 2021, 4:47:40 PM
    Author     : User
--%>
<%@ page import="java.sql.*" %>  

<%
    if (session.getAttribute("register") != null) //check login session user not access or back to index.jsp page
    {
        response.sendRedirect("mainpage.jsp");
    }
%>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //load driver

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-boro", "root", "admin"); //create connection

        if (request.getParameter("btnlogin") != null) //check login button click event not null
        {
            String role = request.getParameter("user");

            if (role.equals("staff")) {
                 String username = request.getParameter("username"); //txt_email
                String password = request.getParameter("password"); //txt_password

                PreparedStatement pstmt = null; //create statement

                pstmt = con.prepareStatement("select * from staff where username=? AND password=?"); //sql select query 
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                ResultSet rs = pstmt.executeQuery(); //execute query and store in resultset object rs.

                if (rs.next()) {
                    username = rs.getString("username");
                    password = rs.getString("password");

                    if (username.equals(username) && password.equals(password)) {
                        session.setAttribute("register", username); //session name is login and store fetchable database username address
                        response.sendRedirect("menuAdmin.jsp"); //after login success redirect to mainpage.jsp page
                    }
                } else {
                    request.setAttribute("errorMsg", "invalid username or password"); //invalid error message for username or password wrong
                }

            } else if (role.equals("user")) {

                String username = request.getParameter("username"); //txt_email
                String password = request.getParameter("password"); //txt_password

                PreparedStatement pstmt = null; //create statement

                pstmt = con.prepareStatement("select * from register where username=? AND password=?"); //sql select query 
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                ResultSet rs = pstmt.executeQuery(); //execute query and store in resultset object rs.

                if (rs.next()) {
                    username = rs.getString("username");
                    password = rs.getString("password");

                    if (username.equals(username) && password.equals(password)) {
                        session.setAttribute("register", username); //session name is login and store fetchable database username address
                        response.sendRedirect("mainpage.jsp"); //after login success redirect to mainpage.jsp page
                    }
                } else {
                    request.setAttribute("errorMsg", "invalid username or password"); //invalid error message for username or password wrong
                }
            }

            //akhir dia
            con.close(); //close connection	
        }

    } catch (Exception e) {
        out.println(e);
    }
%>

<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sign In</title>

        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/login-register.css">
        <script src="js/signin.js"></script>



    </head>

    <body>
        <div class="main-content">
            <form class="form-register" method="post" name="myform" onsubmit="return validate();">
                <div class="form-register-with-email">
                    <center>
                        <div class="form-white-background">
                            <div class="form-title-row">
                                <h1>Sign In</h1>
                            </div>
                            <p style="color:blue">				   		
                                <%
                                    if (request.getAttribute("errorMsg") != null) {
                                        out.println(request.getAttribute("errorMsg")); //error message for email or password 
                                    }
                                %>
                            </p>

                            </br>
                            <div class="form-row">
                                <center>
                                <label for="role">
                                    <input type="radio" id="user" name="user" value="staff" style="color: #5f5f5f;">Staff &nbsp;&nbsp;                             
                                    <input type="radio" id="user" name="user" value="user" style="color: #5f5f5f;" checked>
                                    User
                                </label>
                                    </center>
                            </div>
                            <div class="form-row">
                                <label>
                                    <span>Username</span>
                                    <input class="input-box" type="text" name="username" id="username" placeholder="Enter Username">
                                </label>
                            </div>

                            <div class="form-row">
                                <label>
                                    <span>Password</span>
                                    <input class="input-box" type="password" name="password" id="password" placeholder="Enter password">
                                </label>
                            </div>
                            <input class="input-box" type="submit" name="btnlogin" value="Login">
                            <input class="input-box" type="reset" name="btncancel" value="Cancel">
                        </div>
                        <a href="register.jsp" class="form-log-in-with-existing">You don't have an account? <b> Register here </b></a>
                    </center>
                </div>
            </form>
        </div>
    </body>
</html>


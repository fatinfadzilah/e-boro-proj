<%@ page import="java.sql.*" %>  

<%
    if (session.getAttribute("register") != null) //check login session user not access or back to register.jsp page
    {
        response.sendRedirect("mainpage.jsp");
    }
%>


<%
    try {
        Class.forName("com.mysql.jdbc.Driver"); //load driver

        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e-boro", "root", "admin"); //create connection

        if (request.getParameter("submit") != null) //check register button click event not null
        {
            String fullname, mykad, notel, email, username, password;
            int userid;

            int ada = 0;

            fullname = request.getParameter("fullname");
            mykad = request.getParameter("mykad");
            notel = request.getParameter("notel");
            email = request.getParameter("email");
            username = request.getParameter("username");
            password = request.getParameter("password");

            String sql = "select * from register where username = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs;
            rs = ps.executeQuery();
            while (rs.next()) {
                ada = 1;
            }
            if (ada == 1) { //user already exists
                request.setAttribute("Msg", "username alrady exists");
                con.close();
            } else {
                
                PreparedStatement pstmt = null; //create statement

                pstmt = con.prepareStatement("insert into register(fullname,mykad,notel,email,username,password) values(?,?,?,?,?,?)"); //sql insert query
                pstmt.setString(1, fullname);
                pstmt.setString(2, mykad);
                pstmt.setString(3, notel);
                pstmt.setString(4, email);
                pstmt.setString(5, username);
                pstmt.setString(6, password);
                pstmt.executeUpdate(); //execute query

                request.setAttribute("Msg", "Register Successfully! Please Sign In"); //register success messeage

                con.close(); //close connection

            }

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

        <title>Sign Up</title>

        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/login-register.css">
        <script src="js/register.js"></script>

    </head>
    <body>
        <div class="main-content">

            <form class="form-register" method="post"  onsubmit="return validate();">

                <div class="form-register-with-email">

                    <div class="form-white-background">

                        <div class="form-title-row">
                            <h1>Sign Up</h1>
                        </div>
                        <p style="color:blue">				   		
                            <%
                                if (request.getAttribute("Msg") != null) {
                                    out.println(request.getAttribute("Msg")); //register success message
                                } 
                            %>
                        </p>
                        <div class="form-row">
                            <input class="input-box" type="hidden" id="userid" name="userid" readonly=readonly placeholder="Userid" required>
                        </div>
                        <div class="form-row">
                            <label for="name">
                                <span>Full Name</span>
                                <input class="input-box"type="text" id="name" name="fullname" placeholder="Name" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label for="mykad" >
                                <span>MyKad</span>
                                <input class="input-box" type="text" id="mykad" name="mykad"  placeholder="My Kad" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label for="notel" >
                                <span>No Telephone</span>
                                <input class="input-box"  type="text" id="notel" name="notel"  placeholder="No Telephone" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label for="email" >
                                <span>Email Address</span>
                                <input class="input-box"  type="email" id="email" name="email"  placeholder="Email" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label for="email">
                                <span>Username</span>
                                <input class="input-box" type="text" id="username" name="username" placeholder="Username" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label for="Password" >
                                <span>Password</span>
                                <input class="input-box" type="password" id="password" name="password"  placeholder="Password" required>
                            </label>
                        </div>
                        <div class="form-row">
                            <label>
                                <input class="input-box" type="hidden" name="action" value="insert">
                            </label>
                        </div>

                        <input class="input-box" type="submit" name="submit" value="Register">
                        <input  class="input-box" type="reset" name="cancel" value="Cancel">

                    </div>

                    <a href="signin.jsp" class="form-log-in-with-existing">Already have an account? <b> Sign In here </b></a>

                </div>

            </form>

        </div>

    </body>

</html>

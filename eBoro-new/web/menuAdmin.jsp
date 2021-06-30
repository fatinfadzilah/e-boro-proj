<!DOCTYPE html>
<html lang="en">
    <title>WELCOME <%=session.getAttribute("register")%> TO E-BORO ADMIN</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <%

            if (session.getAttribute("register") == null || session.getAttribute("register") == " ") //check condition unauthorize user not direct access welcome.jsp page
            {
                response.sendRedirect("signin.jsp");
            }
        %>
        
    <style>
        body,h1,h2,h3,h4,h5 {font-family: "Poppins", sans-serif}
        body {font-size:16px;
              background-image: url("css/images/bg.png");}
        .w3-half img{margin-bottom:-6px;margin-top:16px;opacity:0.8;cursor:pointer}
        .w3-half img:hover{opacity:1}
        .column {
    float: left;
    width: 30.3%;
    margin-bottom: 16px;
    padding: 4px 8px;
    
}
.card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    margin: 8px;
}
    </style>
    <body>

        <!-- Sidebar/menu -->
        <nav class="w3-sidebar w3-blue w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
           &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="css/images/logo.png" alt="e-boro" width="200" class="center">
            <div class="w3-bar-block">
                 <br>
                <a href="UserControl?action=listUser"  class="w3-bar-item w3-button w3-hover-white">User</a> 
                <a href="ItemControl?action=listItem" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Item</a> 
                <a href="ReservationControl?action=listReserv" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Reservation</a> 
                <a href="logout.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">Sign Out</a> 
            </div>
        </nav>

        <!-- Top menu on small screens -->
        <header class="w3-container w3-top w3-hide-large w3-blue w3-xlarge w3-padding">
            <a href="javascript:void(0)" class="w3-button w3-red w3-margin-right" onclick="w3_open()">?</a>
            
        </header>

        <!-- Overlay effect when opening sidebar on small screens -->
        <div class="w3-overlay w3-hide-large" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

        <!-- !PAGE CONTENT! -->
        <div class="w3-main" style="margin-left:340px;margin-right:40px">

            <!-- Header -->
            <div class="w3-container" style="margin-top:80px" id="showcase">
                <center>
                <h1 style="color:black;"><b>Hi <%=session.getAttribute("register")%>! WELCOME TO E-BORO ADMIN</b></h1>
                <h4 style="color:black;">Sports Facilities and Equipment Management</h4> <br>
                    <div class="row">
                        <div class="column">
                            <div class="card">
                                <img src="css/images/futsal.jpg" alt="" style="width:100%">
                                <div class="container">
                                    <h2>Futsal Court </h2>
                                </div>
                            </div>
                        </div>

                        <div class="column">
                            <div class="card">
                                <img src="css/images/basikal.jpg" alt="" style="width:100%">
                                <div class="container">
                                    <h2>Booking Bicycle</h2>
                                </div>
                            </div>
                        </div>

                        <div class="column">
                            <div class="card">
                                <img src="css/images/badminton.jpg" alt="" style="width:100%">
                                <div class="container">
                                    <h2>Badminton Court</h2>
                                </div>
                            </div>
                        </div>
                    </div>
                </center>
            </div>

            <script>
                // Script to open and close sidebar
                function w3_open() {
                    document.getElementById("mySidebar").style.display = "block";
                    document.getElementById("myOverlay").style.display = "block";
                }

                function w3_close() {
                    document.getElementById("mySidebar").style.display = "none";
                    document.getElementById("myOverlay").style.display = "none";
                }


            </script>

    </body>
</html>

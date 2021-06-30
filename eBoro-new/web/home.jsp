<%-- 
    Document   : home
    Created on : Jun 18, 2021, 4:49:04 PM
    Author     : User
--%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/mainpage.css">
        <title>e-boro</title>
    </head>
    <body>
        <main class="content">
            <button class="btn"  onclick="document.location = 'signin.jsp'" >Sign In</button>
            <button class="btn" onclick="document.location = 'register.jsp'">Sign Up</button>
            <section class="boro">
                <div class="boro-content">
                    <div class="about-section">
                        <h1>WELCOME TO E-BORO</h1><br></h2>Sports Facilities and Equipment Management</h2><br><br>   
                        <p style="text-align: justify;"> Among the available sports facilities in Dungun District Council area are football field, 
                            netball and volleyball courts and petanque pitch which was used as a pitch for National Level MAKSAK Sports 2007.
                            Besides there is also a private gymnasium for local people's use. DDC Hall, UiTM and NSC Halls available in 
                            DDC area also provide badminton, squash and volleyball courts</p>
                    </div>
                    <h2 style="text-align:center">Facilities and Equipment</h2>
                    <center>
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
                    <script src="js/home.js"></script>
                </div>
            </section>
        </div>   
    </div>
</body>
</html>
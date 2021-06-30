<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/mainpage.css">
        <title>e-boro</title>
        
	<%
	if(session.getAttribute("register")==null || session.getAttribute("register")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("home.jsp"); 
	}
	%>
  
    </head>
    <body>
        <div class="sidenav">
            <p style="color:white;">Hi <%=session.getAttribute("register")%>! Welcome to E-Boro </p>
            <img src="css/images/logo.png" alt="e-boro" width="200" class="center">
            <br>
            <br>
            <a href="mainpage.jsp">Home</a>
            <button class="dropdown-btn">Reservation 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="UController?action=insertEqui&username=<%=session.getAttribute("register")%>">Facilities & Equipment Form</a>
            </div>
            <a href="UController?action=edit&username=<%=session.getAttribute("register")%>">Personal Information</a>
        </div>
        <div class="main">
            <button class="btn"  onclick="document.location = 'logout.jsp'" >Sign Out</button>
            <section class="boro">
                <div class="boro-content">
                     <h1 class="glow" style="color:#ffffff;"><b>WELCOME TO E-BORO</b></h1>
                     <h2>Sports Facilities and Equipment Management</h2><br><br>   
                    <p> Among the available sports facilities in Dungun District Council area are football field, netball and volleyball 
                        courts and petanque pitch which was used as a pitch for National Level MAKSAK Sports 2007.</p>
                    <p>
                        Besides there is also a private gymnasium for local people's use. DDC Hall, UiTM and NSC Halls available in 
                        DDC area also provide badminton, squash and volleyball courts</p>
                   <!-- <a href="" class="action-btn">My profile</a>-->
                </div>
            </section>
        </div>   
    <script src="js/dropdown.js"></script>
    
    </body>
</html>



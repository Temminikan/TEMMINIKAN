<%-- 
    Document   : Welcome
    Created on : Jul 15, 2017, 9:01:15 AM
    Author     : user
--%>
<%@page import="com.dbfunction.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>WELCOME PAGE</title>
         <link  rel="stylesheet" type="text/css" href="style.css" media="screen">      
        <script type="text/javascript">
            //**scale Up script***//
            function scaleUp(obj, size) {
                obj.style.fontSize = size;
            }
        </script>
    </head>
    <link rel="shortcut icon" href="images/Icon.png"/>
    <body>
        <div  class="book" onmouseover="scaleUp(this, '19px')" onmouseout="scaleUp(this, '18px')">
            <a href="BookingPage.html"><b>Reservations Here</b></a></div>
        <header>
            <div id="pages" >
                <nav >  
                    <ul> 
                        <li onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="register.jsp"><b>REGISTER</b></a></li>
                       <li  onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><label  id="myBtn"><b>LOGIN</b></label></li>
                        <li onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="AboutUs.html"><b>ABOUT</b></a></li>
                        <li onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="index.html"><b>HOME</b></a></li>

                        <div class="logo">LOGO</div>
                    </ul>
                </nav>    
            </div>
        </header>
        <h1>LOGIN WAS SUCCESSFUL</h1>
       
        
         <!-- The Modal -->
    <div id="myModal" class="modal">

        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <h1>Login Here</h1>
            </div>
            <div class="modal-body">
                <center>
                    <form action="./users/register" id="form" name="form" method="POST" />  

                    <table border="0"  width="100%" height="400px"   style="background-color: whitesmoke">                                         
                        <tbody>

                            <tr >
                                <td>E-MAIL</td>
                                <td> <input id="user_email" type="text" on autocomplete="on"  width="50"  
                                            onfocus="checkRequestUsingGET()" name="user_email" required="required"/>
                                </td><br/>
                        </tr> 
                        <tr >
                            <td>PASSWORD</td>
                            <td> <input  id="password" type="password"  autocomplete="on"  width="50" 
                                         onfocus="checkRequestUsingGET()" name="password"   required="required"/><div id="validate" ></div>
                            </td><br/>
                        </tr> 
                        <tr>
                            <td>RETYPE PASSWORD</td>
                            <td> <input  id="confirm_password" type="password"  width="50"  
                                         onfocus="checkRequestUsingGET()" name="confirm_password"   required="required"/>
                                <span id="message"></span>
                            </td><br/>

                        </tr> 
                        <tr >
                            <td> <input id="reset" type="reset"  value="RESET" />
                            </td>
                            <td> <input id="submit" type="submit" name="submit" value="LOGIN"  onclick="doRequestUsingPOST();" /></td>
                            <br/>
                        </tr> 
                        <tr>
                            <td  id="nyr">Not Yet Registered!!</td><br/><br/>
                        <td onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="register.jsp" id="r">Register Here</a></td>
                        </tr>
                        </tbody>
                    </table>

                    </form>
                </center>

            </div>
          
        </div>

    </div>
    <script>
// Get the modal
        var modal = document.getElementById('myModal');
// Get the button that opens the modal
        var btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
// When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "block";
        }

// When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

// When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>      
    </body>

  <footer> 
        <div id="footing">
           <h1 class="la">LAKESIDE HOTELS</h1>
            <div class="con">
              <img src="images/phone.png" width="3%" height="30px">Contact us :  (+234) 8139333680  
                <div class="no"> (+234) 8139333680 </div><br>
                <div><img src="images/Home.png" width="3%" height="30px">229, ozumba nbadiwe road,victoria island<br/><div class="area"> Lagos Island Nigeria</div>
                
                </div>
            </div>
         <div id="icons">
           <h1>FOLLOW US</h1>
           <a href="mailto:akinbolapheezy@gmailcom"><img src="images/email.jpeg" width="4%" height="21px"   alt="msg_img">Email</a><br/>
           <a href="https://twitter.com/?lang=en"><img src="images/twitter.png" width="4%" height="21px" alt="twitter_img">Twitter</a><br/>
           <a href="https://instagram.com/"><img src="images/instargram.png" width="4%" height="21px" alt="instargram_img">Instagram</a><br/>
           <a href="https://www.facebook.com/?ref=tn_tnmnl"><img src="images/facebook_img.png" width="3%" height="20px" alt="facebook_img">Facebook</a>
         </div>
          <div id="copy"><center>&copy; LAKESIDE HOTEL 2017 &reg;</center></div>
        </div>
    </footer>
</html>

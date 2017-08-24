<%-- 
    Document   : register
    Create d on : Jul 12, 2017, 8:01:16 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1.0">
        <title>Registration Page</title>
        <link  rel="stylesheet" type="text/css" href="style.css" media="screen">
        <script type="text/javascript" src="jquery-3.2.1.slim.min.js"></script>
        <script type="text/javascript">
            //** Start Of Validating for registration Password **//

            $(document).ready(function () {
                var $submitBtn = $("#register-form input[type='submit']");
                var $passwordBox = $("#passworde");
                var $confirmBox = $("#confirmpassword");
                var $errorMsg = $('<span id="error_msg">Passwords  not matching.</span>');

                // This is incase the user hits refresh - some browsers will maintain the disabled state of the button.
                $submitBtn.removeAttr("disabled");

                function checkMatchingPasswords() {
                    if ($confirmBox.val() != "" && $passwordBox.val != "") {
                        if ($confirmBox.val() != $passwordBox.val()) {
                            $submitBtn.attr("disabled", "disabled");
                            $errorMsg.insertAfter($confirmBox);
                        }
                    }
                }

                function resetPasswordError() {
                    $submitBtn.removeAttr("disabled");
                    var $errorCont = $("#error_msg");
                    if ($errorCont.length > 0) {
                        $errorCont.remove();
                    }
                }


                $("#confirmpassword, #passworde")
                        .on("keydown", function (e) {
                            /* only check when the tab or enter keys are pressed
                             * to prevent the method from being called needlessly  */
                            if (e.keyCode == 13 || e.keyCode == 9) {
                                checkMatchingPasswords();
                            }
                        })
                        .on("blur", function () {
                            // also check when the element looses focus (clicks somewhere else)
                            checkMatchingPasswords();
                        })
                        .on("focus", function () {
                            // reset the error message when they go to make a change
                            resetPasswordError();
                        });

            });
            //** End  Of Validating for Password **/

            //**start of scaling Up script***//
            function scaleUp(obj, size) {
                obj.style.fontSize = size;
            }
            //**End of scaling Up script***//

            var xmlHttp;
            function createXMLHttpRequest() {
                if (window.ActiveXObject) {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                } else if (window.XMLHttpRequest) {
                    xmlHttp = new XMLHttpRequest();
                }
            }
            function createQueryString() {
                var user_name = document.getElementById("user_name").value;
                var phone = document.getElementById("phone").value;
                var dob = document.getElementById("dob").value;
                var user_email = document.getElementById("user_email").value;
                var state = document.getElementById("state").value;
                var address = document.getElementById("address").value;
                // var country = document.getElementById("country").value;
                var password = document.getElementById("password").value;

                var queryString = "user_name=" + user_name + "&phone=" + phone + "&dob=" + dob + "&user_email=" + user_email +
                        "&state=" + state + "&address=" + address + "&password=" + password;

                return queryString;
            }
            function doRequestUsingGet() {
                createXMLHttpRequest();
                var queryString = "Registration?";
                queryString = queryString + createQueryString() + "&timeStamp= " + new Date().getTime();
                xmlHttp.onreadystatechange = handleStateChange;
                xmlHttp.open("GET", queryString, true);
                xmlHttp.send(null);
            }
            function dorequestUsingPost() {
                createXMLHttpRequest();
                var url = "Registration?timeStamp=" + new Date().getTime();
                var queryString = createQueryString();
                xmlHttp.open("POST", url, true);
                xmlHttp.onreadystatechange = handleStateChange;
                xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;");
                xmlHttp.send(queryString);
            }
            function handleStateChange() {
                if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200) {
                        parseResults();
                    }
                }
                //xmlhttp.open("GET", "Registration", true);
                //xmlhttp.send();
            }
            function parseResults() {
                var responseDiv = document.getElementById("validate");
                if (responseDiv.hasChildNodes()) {
                    responseDiv.removeChild(responseDiv.childNodes[0]);
                }
                var responseText = document.createTextNode(xmlHttp.responseText);
                responseDiv.appendChild(responseText);
            }

        </script>
    </head>
    <link rel="shortcut icon" href="images/Icon.png"/>
    <body>
        <div  class="book" onmouseover="scaleUp(this, '19px')" onmouseout="scaleUp(this, '18px')">
            <a href="BookingPage.html"><b>Reservations Here</b></a></div>
        <header>
            <div id="pages">
                <nav>  
                    <ul> 
                        <li  onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="register.jsp"><b>REGISTER</b></a></li>
                        <li  onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><label  id="myBtn"><b>LOGIN</b></label></li>
                        <li onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="AboutUs.html"><b>ABOUT</b></a></li>
                        <li onmouseover="scaleUp(this, '21px')" onmouseout="scaleUp(this, '18px')"><a href="index.html"><b>HOME</b></a></li>

                        <div class="logo"><img src="images/lakeside.png"></div>
                    </ul>
                </nav>    
            </div>
        </header>
        <div id="logReg">
                      
                <form id="register-form" action="./users/register" method="POST">  
                    <table border="0" width="100%"  height="500px">
                        <h1 class="reg_h">Register Here</h1>
                        <tr>
                            <td>NAME:</td>
                            <td> <input type="text" id="user_name" name="user_name" autocomplete="on"  required="required" width="50" PLACEHOLDER="USERNAME"/></td>
                        </tr> 

                        <tr>
                            <td>GENDER:</td>
                            <td> <select size="1" class="sel" id="gender" name="gender" autocomplete="on"  required="required">
                                    <option value="Gender" />Choose Your Gender</option>
                                    <option value="Male" />MALE</option>
                                    <option value="Female">FEMALE</option>
                                </select> <div id="validate" ></div></td>
                        </tr> 
                        <tr>
                            <td>PHONE_NO:</td>
                            <td> <input type="text" id="phone" name="phone"  autocomplete="on"  required="required" width="50" PLACEHOLDER="PHONE-NO"/></td>

                        </tr> 

                        <tr>
                            <td>E_MAIL:</td>
                            <td> <input type="email"  id="useremail" name="user_email" autocomplete="on"  required="required" width="50" PLACEHOLDER="E-MAIL ADDRESS"/>
                            </td>                              
                        </tr> 

                        <tr>
                            <td>DATE_OF_BIRTH:</td>
                            <td> <input type="date" id="dob" name="dob"  required="required" width="50"/></td>
                        </tr> 

                        <tr>
                            <td>STATE:</td>
                            <td> <input type="text" name="state" id="state" autocomplete="on"  placeholder="STATE" required="required" width="50"/></td> 

                        </tr> 
                        <tr>
                            <td>ADDRESS:</td>
                            <td> <input type="text" id="address" name="address" autocomplete="on"  required="required" width="50" PLACEHOLDER="HOME ADDRESS"/></td>
                        </tr>
                        <tr>
                            <td>COUNTRY:</td>
                            <td> <input type="text" id="country" name="country" autocomplete="on"  required="required" width="50" PLACEHOLDER="COUNTRY"/></td>
                        </tr>
                        <tr>
                            <td>PASSWORD</td>
                            <td> <input type="password" name="passworde" required="required" autocomplete="on"  width="50"  PLACEHOLDER="PASSWORD"
                                        id="passworde"/>
                        </tr> 
                        <tr>
                            <td>CONFIRM PASSWORD</td>
                            <td> <input type="password" name="confirmPassword" id="confirmpassword"  required="required" width="50" value="" PLACEHOLDER="RETYPE PASSWORD" value=""/>
                        </tr>
                        <tr>
                            <td><input type="reset" form="register-form" value="RESET"  name="reset" required="required"></td>
                            <td><input type="submit" form="register-form" name="submit" value="SUBMIT" onclick="dorequestUsingPost()"  required="required"></td>
                        </tr>
                    </table>
                </form>
        </div>
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
                                    <td><b>E-MAIL</b></td>
                                    <td> <input id="user_email" type="text" on autocomplete="on"  width="50"  
                                                onfocus="checkRequestUsingGET()" name="user_email" required="required"/>
                                    </td><br/>
                            </tr> 
                            <tr >
                                <td><b>PASSWORD</b></td>
                                <td> <input  id="password" type="password"  autocomplete="on"  width="50" 
                                             onfocus="checkRequestUsingGET()" name="password"   required="required"/><div id="validate" ></div>
                                </td><br/>
                            </tr> 
                            <tr>
                                <td><b>RETYPE PASSWORD</b></td>
                                <td> <input  id="confirm_password" type="password"  width="50"  
                                             onfocus="checkRequestUsingGET()" name="confirm_password"   required="required"/>
                                    <span id="message"></span>
                                </td><br/>

                            </tr> 
                            <tr >
                                <td> <input id="reset" type="reset"  value="RESET" /></td>
                                <td> <input id="submit" class="sub" type="submit" name="submit" value="LOGIN"  onclick="doRequestUsingPOST();" /></td>
                                
                               
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

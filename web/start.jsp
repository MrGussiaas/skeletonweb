<%--
  Created by IntelliJ IDEA.
  User: Augie
  Date: 11/23/13
  Time: 1:27 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<script src="assets/scripts/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $ ("button#btn01").click (function () {
            dataValue = 'displayforwardingwalletinfo';
            ajaxCall (dataValue);
        });
        $ ("button#btn02").click (function () {
            dataValue = 'displayfeewalletinfo';
            ajaxCall (dataValue);
        });
        $ ("button#btn03").click (function () {
            dataValue = 'displayreceiverwalletinfo';
            ajaxCall (dataValue);
        });
        $ ("button#btn04").click (function () {
            dataValue = 'forwardbtc';
            ajaxCall (dataValue);
        });
        $ ("button#btn05").click (function () {
            $(this).attr("disabled",true);
            dataValue = 'mocklogin';
            ajaxCall (dataValue);
        });
        $ ("button#btn06").click (function () {
            dataValue = 'for_deposit_address';
            ajaxCall (dataValue);
        });

    })
    function ajaxCall (dataValue) {

        $.ajax ({
            type    : "POST",
            url     : "/LoadWalletServlet",
            data    : {action:dataValue, address:'mznKGNMyLjxZdiNbno7mUFks9eop49TRdu'},
            dataType: "json",
            //if received a response from the server
            success : function (data, textStatus, jqXHR) {
                if (data.status == 'success') {
                    $ ("#ajaxResponse").html ("<br/>");
                    $ ("#ajaxResponse").append ("<br/><br/><br/>");
                    $ ("#ajaxResponse").append ("JSON passed back to front end......<br/> <p>" + JSON.stringify (data) + "</p><br/>");
                }
            },

            //If there was no resonse from the server
            error   : function (jqXHR, textStatus, errorThrown) {
                console.log ("Something really bad happened " + textStatus);
                $ ("#ajaxResponse").html (jqXHR.responseText);
            }

        });
    }
</script>
<head>
    <title>BitCoinTrade</title>
</head>
<body>
    <button id="btn05">MOCK LOGIN</button><br>
    <button id="btn06">DEPOSIT ADDRESS</button><br>
	<button id="btn01">Display Forwarding Wallet Info</button><br>
	<button id="btn02">Display Fee Wallet Info</button><br>
	<button id="btn03">Display Receiver Wallet Info</button><br><br>
	
	<button id="btn04">Forward BTC to Receiver wallet - to this address mznKGNMyLjxZdiNbno7mUFks9eop49TRdu</button><br><br>
	
	<div id="ajaxResponse"></div>

	<table width="100%" >
		<tr>
			<td colspan="2">Start of Mr Gussiaas's stuff</td>
		</tr>
		<c:if test="${not empty error}">
			<tr>
				<td colspan = "s">
					${error} 
				</td>
			</tr>
		</c:if>
		<tr>
			<td>
				<form action="LogInServlet" method="post">
					<table align="left" border="2">
						<tr>
							<td colspan="2">Existing user's login here</td>
						</tr>
						<tr>
							<td>User:</td>
							<td> <input name="userName"/></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input name="password"/></td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit">
							</td>
						</tr>
						<tr>
							<td colspan = "2">
								<a href="" >Forgot Password</a>
							</td>
						</tr>
					</table>
				</form>
			</td>
			<td>
				<form action="RegisterUserServlet" method="post">
					<table border="2" align="right">
						<tr>
							<td colspan="2">
								Sign up
							</td>
						</tr>
						<tr>
							<td>Email address</td>
							<td><input name="newUserEmail"></td>
						</tr>
						<tr>
							<td>
								Password
							</td>
							<td>
								<input name="newUserPassword">
							</td>
							<tr>
								<td>
									<input type="submit">
								</td>
							</tr>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>

</body>
</html>
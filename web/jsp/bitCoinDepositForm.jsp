<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
	<form action = "AddBtcServlet" method="POST">
		<table>
			<c:if test="${not empty error}">
				<tr>
					<td colspan = "3" align="center">
						${error} 
					</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="2">
					Send the bitcoins you would like to deposit to address ${address} then click submit below.<br>
					Once we confirm the coins have been received they will be credited to your account in the form of a transaction.
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit"/>
				</td>
			</tr>
		</table>
	</form>
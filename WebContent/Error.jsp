<html>
<%@ page isErrorPage="true" %>
<head>
<title>Error</title>
</head>

<body>
     
<form action="00-00-login.jsp" methode="post">
<input type="submit" value="Go To Home Page">
</form>
<br/>
<h2>Some Error Occured !!</h2>
</br>
</br>
<%= exception %>   

</body>
</html>
<%@ page errorPage="Error.jsp" %>
<%@ include file = "inc/head.html" %>
<body class="full">
    <div class="fake-table">
        <div class="fake-table-cell">
            <div id="login">
                <div class="top left clearfix">
                    <div class="logo left"><img src="images/id-logo.png" alt="logo"></div>
                    <p>Enter ID To<br><span>Reset Password</span></p>
                </div>
                <form action="ForgetServlet" method="post" class="clearfix">
                    <div class="fields">
                        <fieldset>
                            <input type="text" name="email" placeholder="ID">
                            <span><i class="fa fa-user"></i></span>
                        </fieldset>
                        <fieldset>
                        </fieldset>
                        <input type="submit" value="OK">
                    </div>
                    <div class="bottom clearfix">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@ include file = "inc/footer.html" %>

</body>
</html>
<%@ page errorPage="Error.jsp" %>
<%@ include file = "inc/head.html" %>
<body class="full">
    <div class="fake-table">
        <div class="fake-table-cell">
            <div id="login">
                <div class="top left clearfix">
                    <div class="logo left"><img src="images/id-logo.png" alt="logo"></div>
                    <p>DashBoard MEMBER<br><span>LOGIN</span></p>
                </div>
                <form action="LoginServlet" method="post" class="clearfix">
                    <div class="fields">
                        <fieldset>
                            <input type="text" name="email" placeholder="LOGIN">
                            <span><i class="fa fa-user"></i></span>
                        </fieldset>
                        <fieldset>
                            <input type="password" name="password" placeholder="PASSWORD">
                            <span><i class="fa fa-key"></i></span>
                        </fieldset>
                        <input type="submit" value="OK">
                    </div>
                    <div class="bottom clearfix">
                       
                        <a href="forget.jsp" class="forgot right">FORGOT PASSWORD?</a>
                        </br></br></br>
                        </br>
                            <%
    String msg = request.getParameter("msg");
    if(msg != null)
    {
    	out.println("<h3 style='background-color:black'><font color='red'>"+msg+"</font></h3>");
    }
    %>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <%@ include file = "inc/footer.html" %>

</body>
</html>
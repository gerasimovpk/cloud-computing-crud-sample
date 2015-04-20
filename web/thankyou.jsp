<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="ru.vlsu.cloud.gerasimovpk.daas.Request" %>
<%@ page import="ru.vlsu.cloud.gerasimovpk.daas.PMF" %>

<html>
    <head>
        <link type="text/css" rel="stylesheet" href="/stylesheets/main.css" />
    </head>

    <body>

        <%
            UserService userService = UserServiceFactory.getUserService();
            User user = userService.getCurrentUser();
        %>
        <p>Thank you, <%= user.getNickname()%>! You can send another request using this <a href="/daas.jsp">link</a></p>
    </body>
</html>

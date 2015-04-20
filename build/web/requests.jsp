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

<%
    PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Request.class.getName() + " order by date desc range 0,5";
    List<Request> greetings = (List<Request>) pm.newQuery(query).execute();
    if (greetings.isEmpty()) {
%>
<p>There are no requests in the service</p>
<%
    } else {
        for (Request g : greetings) {
            if (g.getAuthor() == null) {
%>
<p>An anonymous person</p>
<%
            } else {
%>
<p><b><%= g.getAuthor().getNickname() %></b> send request:</p>
<%
            }
%>
<blockquote><%= g.getComment() %></blockquote>
<%
        }
    }
    pm.close();
%>

  </body>
</html>

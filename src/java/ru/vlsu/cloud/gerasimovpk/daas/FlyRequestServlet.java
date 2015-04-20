package ru.vlsu.cloud.gerasimovpk.daas;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;
import javax.jdo.PersistenceManager;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import ru.vlsu.cloud.gerasimovpk.daas.Request;
import ru.vlsu.cloud.gerasimovpk.daas.PMF;

public class FlyRequestServlet extends HttpServlet {
    private static final Logger log = Logger.getLogger(FlyRequestServlet.class.getName());

    public void doPost(HttpServletRequest req, HttpServletResponse resp)
                throws IOException {
        UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();

        String content = req.getParameter("content");
        Date date = new Date(Long.parseLong(req.getParameter("datetime")));
        Request flyRequest = new Request(user, content, date);

        PersistenceManager pm = PMF.get().getPersistenceManager();
        try {
            pm.makePersistent(flyRequest);
        } finally {
            pm.close();
        }
        resp.sendRedirect("/thankyou.jsp");
    }
}

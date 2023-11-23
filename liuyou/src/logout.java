import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/logout")
public class logout extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.removeAttribute("username1");
        session.removeAttribute("cx");

        try {
            response.sendRedirect("contact.html");
        } catch (IOException e) {
            e.printStackTrace();

        }
    }
}
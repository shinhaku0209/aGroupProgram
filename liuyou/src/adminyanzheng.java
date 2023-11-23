import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/adminyanzheng")
public class adminyanzheng extends HttpServlet {
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("username");
        String pwd = request.getParameter("pwd");
        String cx = new String(request.getParameter("cx").getBytes("8859_1"));
        String sql = "";

        if (cx.equals("normaluser")) {
            sql = "select * from yonghuxinxi where yonghuming='" + uid + "' and mima='" + pwd + "'";
        } else {
            sql = "select * from allusers where username='" + uid + "' and pwd='" + pwd + "'";
        }

        ResultSet RS_result = connDbBean.executeQuery(sql);

        try {
            if (!RS_result.next()) {
                System.out.print("<script>alert('The user you entered does not exist or the password is incorrect, please log in again!\n" +
                        "\n');window.history.go(-1);</script>");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("username", uid);

                if (cx.equals("normaluser")) {
                    session.setAttribute("cx", "user");
                } else {
                    session.setAttribute("cx", RS_result.getString("cx"));
                }

                response.sendRedirect("main.jsp");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            RS_result.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
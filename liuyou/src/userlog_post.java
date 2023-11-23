import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/userlog_post")
public class userlog_post extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        String uid = new String(request.getParameter("username").getBytes("8859_1"));
        String pwd = new String(request.getParameter("pwd1").getBytes("8859_1"));
        String cx = new String(request.getParameter("cx").getBytes("8859_1"));
        System.out.println(uid + " , " + pwd);
        String sql = "";
        if (cx.equals("normaluser")) {
            sql = "select * from yonghuzhuce where yonghuming='" + uid + "' and mima='" + pwd + "'";
        } else {
            sql = "select * from allusers where username='" + uid + "' and pwd='" + pwd + "'";
        }
        //sql = "select * from yonghuzhuce where yonghuming='" + uid + "' and mima='" + pwd + "' ";
        ResultSet RS_result = connDbBean.executeQuery(sql);
        try {
            if (!RS_result.next()) {
                out.print("<script>alert('Please log back in if the user you entered does not exist or the password is incorrect\n" +
                        "\n!');window.history.go(-1);</script>");
            } else {

                session.setAttribute("username", uid);
                session.setAttribute("cx", cx);
                response.sendRedirect("databack.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        try {
            RS_result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

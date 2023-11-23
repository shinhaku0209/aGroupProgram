import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/mod_post")
public class mod_post extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String ymm = request.getParameter("ymm");
        String xmm1 = request.getParameter("xmm1");
        PrintWriter out = response.getWriter();
        ResultSet RS_result = connDbBean.executeQuery("select * from [allusers] where username='" + request.getSession().getAttribute("username") + "'");

        try {
            if (!RS_result.next()) {
                out.print("<script>alert('系统故障,请勿越权操作!');window.history.go(-1);</script>");
            } else {

                String pwd = RS_result.getString("pwd");

                if (pwd.equals(ymm)) {
                    String sql = "update allusers set pwd='" + xmm1 + "' where username='" + request.getSession().getAttribute("username") + "'";
                    connDbBean.executeUpdate(sql);
                    out.print("<script>alert('修改成功!!');window.history.go(-1);</script>");
                } else {
                    out.print("<script>alert('对不起,您的原密码不正确,请重试!');window.history.go(-1);</script>");
                }
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

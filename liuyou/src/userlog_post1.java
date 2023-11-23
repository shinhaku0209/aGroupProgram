//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet({"/userlog_post(1)"})
public class userlog_post1 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db connDbBean;


    public void init() throws ServletException {
        this.connDbBean = new db();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();

        // 从请求体中获取用户名和密码
        String uid = request.getParameter("username");
        String pwd = request.getParameter("pwd1");
        String cx = request.getParameter("cx");
        System.out.println(uid + " , " + pwd);

        try {
            // 查询数据库验证用户名和密码
            String sql = "select * from yonghuzhuce where yonghuming='" + uid + "' and mima='" + pwd + "' ";
            ResultSet RS_result = db.executeQuery(sql);

            if (!RS_result.next()) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                out.print("{\"error\": \"Invalid credentials\"}");
            } else {
                // 登录成功，返回JSON数据表示操作成功
                String token = generateToken(); // 生成令牌
                out.print("{\"message\": \"Login successful\", \"token\": \"" + token + "\", \"redirect\": \"jingdianxinxilist.jsp\"}");
            }
        } catch (SQLException e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("{\"error\": \"Internal Server Error\"}");
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private String generateToken() {
        // 实际应用中，可以使用更安全的方式生成令牌，例如JWT
        return "sampleToken";
    }
}

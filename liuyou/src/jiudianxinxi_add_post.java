import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/jiudianxinxi_add_post")
public class jiudianxinxi_add_post extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

        String bianhao = request.getParameter("bianhao");
        String mingcheng = request.getParameter("mingcheng");
        String xingji = request.getParameter("xingji");
        String dizhi = request.getParameter("dizhi");
        String dianhua = request.getParameter("dianhua");
        String zhaopian = request.getParameter("zhaopian");
        String beizhu = request.getParameter("beizhu");

        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/lyou?useUnicode=true&characterEncoding=UTF-8";
            String username = "root";
            String password = "123456";

            conn = DriverManager.getConnection(url, username, password);
            stmt = conn.createStatement();

            String sql = "insert into jiudianxinxi(bianhao,mingcheng,xingji,dizhi,dianhua,zhaopian,beizhu) values('" + bianhao + "','" + mingcheng + "','" + xingji + "','" + dizhi + "','" + dianhua + "','" + zhaopian + "','" + beizhu + "') ";

            stmt.executeUpdate(sql);
            out.print("<script>alert('Ìí¼Ó³É¹¦!!');location.href='jiudianxinxi_add.jsp';</script>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
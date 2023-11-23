import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/jiudianxinxi_updt_post")
public class jiudianxinxi_updt_post extends HttpServlet {
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();

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


            conn = connDbBean.getConn();
            stmt = conn.createStatement();

            String sql = "insert into jiudianxinxi(bianhao,mingcheng,xingji,dizhi,dianhua,zhaopian,beizhu) values('" + bianhao + "','" + mingcheng + "','" + xingji + "','" + dizhi + "','" + dianhua + "','" + zhaopian + "','" + beizhu + "') ";

            stmt.executeUpdate(sql);
            out.print("<script>alert('添加成功!!');location.href='jiudianxinxi_add.jsp';</script>");

        } catch (SQLException e) {
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
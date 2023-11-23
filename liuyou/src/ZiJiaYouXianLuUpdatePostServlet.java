import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ZiJiaYouXianLuUpdatePostServlet")
public class ZiJiaYouXianLuUpdatePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        db connDbBean = new db(); // Assuming 'db' is the class for database operations

        String xianlubianhao = request.getParameter("xianlubianhao");
        String xianlumingcheng = request.getParameter("xianlumingcheng");
        String chufadi = request.getParameter("chufadi");
        String mudedi = request.getParameter("mudedi");
        String jiaotonggongju = request.getParameter("jiaotonggongju");
        String feiyong = request.getParameter("feiyong");
        String chuxingshijian = request.getParameter("chuxingshijian");
        String beizhu = request.getParameter("beizhu");
        String faburen = request.getParameter("faburen");
        String id = request.getParameter("id");

        String sql = "update zijiayouxianlu set xianlubianhao=?, xianlumingcheng=?, chufadi=?, mudedi=?, jiaotonggongju=?, feiyong=?, chuxingshijian=?, beizhu=?, faburen=? where id=?";

        try (PreparedStatement pstmt = connDbBean.conn.prepareStatement(sql)) {
            pstmt.setString(1, xianlubianhao);
            pstmt.setString(2, xianlumingcheng);
            pstmt.setString(3, chufadi);
            pstmt.setString(4, mudedi);
            pstmt.setString(5, jiaotonggongju);
            pstmt.setString(6, feiyong);
            pstmt.setString(7, chuxingshijian);
            pstmt.setString(8, beizhu);
            pstmt.setString(9, faburen);
            pstmt.setString(10, id);

            pstmt.executeUpdate();

            response.getWriter().write("<script>alert('修改成功!!');location.href='zijiayouxianlu_updt.jsp?id=" + id + "';</script>");
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQLException as needed
        } finally {
            connDbBean.close();
        }
        // Forward the request to the JSP page
        getServletContext().getRequestDispatcher("/zijiayouxianlu_updt_post.jsp").forward(request, response);
    }
}

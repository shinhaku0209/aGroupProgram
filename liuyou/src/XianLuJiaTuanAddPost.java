import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/XianLuJiaTuanAddPost")
public class XianLuJiaTuanAddPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String xianlubianhao = request.getParameter("xianlubianhao");
        String xianlumingcheng = request.getParameter("xianlumingcheng");
        String chufadi = request.getParameter("chufadi");
        String mudedi = request.getParameter("mudedi");
        String jiaotonggongju = request.getParameter("jiaotonggongju");
        String feiyong = request.getParameter("feiyong");
        String chuxingshijian = request.getParameter("chuxingshijian");
        String faburen = request.getParameter("faburen");
        String canjiaren = request.getParameter("canjiaren");
        String beizhu = request.getParameter("beizhu");

        try {
            db connDbBean = new db();
            String sql = "insert into xianlujiatuan(xianlubianhao, xianlumingcheng, chufadi, mudedi, jiaotonggongju, feiyong, chuxingshijian, faburen, canjiaren, beizhu) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            try (PreparedStatement pstmt = connDbBean.conn.prepareStatement(sql)) {
                pstmt.setString(1, xianlubianhao);
                pstmt.setString(2, xianlumingcheng);
                pstmt.setString(3, chufadi);
                pstmt.setString(4, mudedi);
                pstmt.setString(5, jiaotonggongju);
                pstmt.setString(6, feiyong);
                pstmt.setString(7, chuxingshijian);
                pstmt.setString(8, faburen);
                pstmt.setString(9, canjiaren);
                pstmt.setString(10, beizhu);

                pstmt.executeUpdate();
            }

            connDbBean.close();
            response.getWriter().write("<script>alert('操作成功!!');location.href='zijiayouxianlulist.jsp';</script>");

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("<script>alert('操作失败，请稍后重试。');window.history.go(-1);</script>");
        }
    }
}

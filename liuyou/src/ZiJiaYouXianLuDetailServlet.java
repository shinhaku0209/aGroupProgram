import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ZiJiaYouXianLuServlet")
public class ZiJiaYouXianLuDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        db connDbBean = new db(); // Assuming 'db' is the class for database operations

        String id = request.getParameter("id");
        connDbBean.executeUpdate("update xinwentongzhi set dianjilv=dianjilv+1 where id=" + id);

        String sql = "select * from zijiayouxianlu where id=" + id;
        String xianlubianhao = "";
        String xianlumingcheng = "";
        String chufadi = "";
        String mudedi = "";
        String jiaotonggongju = "";
        String feiyong = "";
        String chuxingshijian = "";
        String beizhu = "";
        String faburen = "";
        ResultSet RS_result = connDbBean.executeQuery(sql);

        try {
            while (RS_result.next()) {
                xianlubianhao = RS_result.getString("xianlubianhao");
                xianlumingcheng = RS_result.getString("xianlumingcheng");
                chufadi = RS_result.getString("chufadi");
                mudedi = RS_result.getString("mudedi");
                jiaotonggongju = RS_result.getString("jiaotonggongju");
                feiyong = RS_result.getString("feiyong");
                chuxingshijian = RS_result.getString("chuxingshijian");
                beizhu = RS_result.getString("beizhu");
                faburen = RS_result.getString("faburen");
            }

            sql = "select * from pinglun where xinwenID='" + id + "' order by id desc";
            RS_result = connDbBean.executeQuery(sql);
            String xinwenID = "";
            String pinglunneirong = "";
            String pinglunren = "";
            String addtime = "";
            int i = 0;

            while (RS_result.next()) {
                i = i + 1;
                xinwenID = RS_result.getString("xinwenID");
                pinglunneirong = RS_result.getString("pinglunneirong");
                pinglunren = RS_result.getString("pinglunren");
                addtime = RS_result.getString("addtime");
            }

            // Forward the request to the JSP page
            request.setAttribute("xianlubianhao", xianlubianhao);
            request.setAttribute("xianlumingcheng", xianlumingcheng);
            // Set other attributes as needed
            request.setAttribute("comments", RS_result);

            getServletContext().getRequestDispatcher("/zijiayouxianlu.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources in a 'finally' block to ensure they are closed even if an exception occurs
            try {
                if (RS_result != null) {
                    RS_result.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            connDbBean.close();
        }
    }
}

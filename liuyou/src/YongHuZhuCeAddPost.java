// Import necessary packages

import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/YongHuZhuCeAddPost")
public class YongHuZhuCeAddPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();
        db connDbBean = new db();
        try {
            // Get parameter values from the request
            String yonghuming = request.getParameter("yonghuming");
            String mima = request.getParameter("mima");
            String xingming = request.getParameter("xingming");
            String xingbie = request.getParameter("xingbie");
            String chushengnianyue = request.getParameter("chushengnianyue");
            String QQ = request.getParameter("QQ");
            String youxiang = request.getParameter("youxiang");
            String dianhua = request.getParameter("dianhua");
            String shenfenzheng = request.getParameter("shenfenzheng");
            String touxiang = request.getParameter("touxiang");
            String dizhi = request.getParameter("dizhi");
            String beizhu = request.getParameter("beizhu");
            // Perform database check
            ResultSet RS_result = connDbBean.executeQuery("select * from yonghuzhuce where yonghuming='" + yonghuming + "'");

            if (RS_result.next()) {
                out.print("<script>alert('This username already exists, please change it to a username with a different name!\n" +
                        "\n');window.history.go(-1);</script>");
            } else {
                // If the username is not in the database, proceed with registration
                String addtimes = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());
                String sql = "insert into yonghuzhuce(yonghuming, mima, xingming, xingbie, chushengnianyue, QQ, youxiang, "
                        + "dianhua, shenfenzheng, touxiang, dizhi, beizhu, addtime, issh) values('" + yonghuming + "','"
                        + mima + "','" + xingming + "','" + xingbie + "','" + chushengnianyue + "','" + QQ + "','"
                        + youxiang + "','" + dianhua + "','" + shenfenzheng + "','" + touxiang + "','" + dizhi + "','"
                        + beizhu + "','" + addtimes + "','y') ";

                connDbBean.executeUpdate(sql);
                out.print("<script>alert('Successful!');location.href='contact.html';</script>");
            }

            RS_result.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("An error occurred: " + e.getMessage());
        }
    }
}

import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/YongHuZhuceUpdatePost2Servlet")
public class YongHuZhuceUpdatePost2Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        db connDbBean = new db();

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

        String sql = "update yonghuzhuce set yonghuming='" + yonghuming + "',mima='" + mima + "',xingming='" + xingming + "',xingbie='" + xingbie + "',chushengnianyue='" + chushengnianyue + "',QQ='" + QQ + "',youxiang='" + youxiang + "',dianhua='" + dianhua + "',shenfenzheng='" + shenfenzheng + "',touxiang='" + touxiang + "',dizhi='" + dizhi + "',beizhu='" + beizhu + "' where yonghuming= '" + request.getSession().getAttribute("username") + "'";
        try {
            connDbBean.executeUpdate(sql);
            response.getWriter().write("<script>alert('修改成功!!');location.href='yonghuzhuce_updt2.jsp';</script>");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions as needed
        } finally {
            connDbBean.close();
        }
    }
}

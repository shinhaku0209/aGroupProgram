import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/YongHuZhuCeUpdatePostServlet")
public class YongHuZhuCeUpdatePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        db connDbBean = new db(); // Assuming 'db' is the class for database operations

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
        String id = request.getParameter("id");

        String sql = "update yonghuzhuce set yonghuming='" + yonghuming + "',mima='" + mima + "',xingming='" + xingming + "',xingbie='" + xingbie + "',chushengnianyue='" + chushengnianyue + "',QQ='" + QQ + "',youxiang='" + youxiang + "',dianhua='" + dianhua + "',shenfenzheng='" + shenfenzheng + "',touxiang='" + touxiang + "',dizhi='" + dizhi + "',beizhu='" + beizhu + "' where id= " + id;

        connDbBean.executeUpdate(sql);
        response.getWriter().write("<script>alert('修改成功!!');location.href='yonghuzhuce_list.jsp';</script>");
        connDbBean.close();
    }
}


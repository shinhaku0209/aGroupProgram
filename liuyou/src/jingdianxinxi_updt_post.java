import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

@WebServlet("/jingdianxinxi_updt_post")
public class jingdianxinxi_updt_post extends HttpServlet {
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

        String mingcheng = request.getParameter("mingcheng");
        String xingji = request.getParameter("xingji");
        String dizhi = request.getParameter("dizhi");
        String dianhua = request.getParameter("dianhua");
        String jianjie = request.getParameter("jianjie");
        String zhaopian = request.getParameter("zhaopian");
        String piaojia = request.getParameter("piaojia");
        String id = request.getParameter("id");
        System.out.println("nihaoa");
        Connection conn = null;
        Statement stmt = null;
        String sql = "update jingdianxinxi set mingcheng='" + mingcheng + "',xingji='" + xingji + "',dizhi='" + dizhi + "',dianhua='" + dianhua + "',jianjie='" + jianjie + "',zhaopian='" + zhaopian + "',piaojia='" + piaojia + "' where id=" + id;
        connDbBean.executeUpdate(sql);
        out.print("<script>alert('修改成功!!');location.href='jingdianxinxi_list.jsp';</script>");
    }
}
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/jingdianxinxi_add_post")
public class jingdianxinxi_add_post extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db.db connDbBean; // ��ӳ�Ա����

    public void init() throws ServletException {
        connDbBean = new db.db(); // ��init������ʵ����connDbBean
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
        String sql = "insert into jingdianxinxi(mingcheng,xingji,dizhi,dianhua,jianjie,zhaopian,piaojia) values('" +
                mingcheng + "','" + xingji + "','" + dizhi + "','" + dianhua + "','" + jianjie + "','" +
                zhaopian + "','" + piaojia + "')";

        connDbBean.executeUpdate(sql);
        System.out.println("successful!");
        out.print("<script>alert('��ӳɹ�!!');location.href='jingdianxinxi_add.jsp';</script>");
    }


}
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/jiudianyuding_updt_post")
public class jiudianyuding_updt_post extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");

        PrintWriter out = response.getWriter();

        String jiudianmingcheng = request.getParameter("jiudianmingcheng");
        String kefangbianhao = request.getParameter("kefangbianhao");
        String jiage = request.getParameter("jiage");
        String yudingshijian = request.getParameter("yudingshijian");
        String yudingtianshu = request.getParameter("yudingtianshu");
        String nindexingming = request.getParameter("nindexingming");
        String nindedianhua = request.getParameter("nindedianhua");
        String nindeshenfenzheng = request.getParameter("nindeshenfenzheng");
        String beizhu = request.getParameter("beizhu");
        String yonghuming = request.getParameter("yonghuming");
        String id = request.getParameter("id");
        String sql = "update jiudianyuding set jiudianmingcheng='" + jiudianmingcheng + "',kefangbianhao='" + kefangbianhao + "',jiage='" + jiage + "',yudingshijian='" + yudingshijian + "',yudingtianshu='" + yudingtianshu + "',nindexingming='" + nindexingming + "',nindedianhua='" + nindedianhua + "',nindeshenfenzheng='" + nindeshenfenzheng + "',beizhu='" + beizhu + "',yonghuming='" + yonghuming + "' where id= " + id;
        connDbBean.executeUpdate(sql);
        out.print("<script>alert('修改成功!!');location.href='jiudianyuding_updt.jsp?id=" + id + "';</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/kefang_updt_post")
public class kefang_updt_post extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=gb2312");
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        PrintWriter out = response.getWriter();

        String jiudian = request.getParameter("jiudian");
        String kefangbianhao = request.getParameter("kefangbianhao");
        String leixing = request.getParameter("leixing");
        String daxiao = request.getParameter("daxiao");
        String jiage = request.getParameter("jiage");
        String beizhu = request.getParameter("beizhu");
        String id = request.getParameter("id");

        String sql = "update kefang set jiudian='" + jiudian + "',kefangbianhao='" + kefangbianhao + "',leixing='" + leixing + "',daxiao='" + daxiao + "',jiage='" + jiage + "',beizhu='" + beizhu + "' where id= " + id;
        connDbBean.executeUpdate(sql);
        out.print("<script>alert('修改成功!!');location.href='kefang_updt.jsp?id=" + id + "';</script>");
    }
}

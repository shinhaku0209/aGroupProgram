import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/kefang_add_post")
public class kefang_add_post extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String jiudian = request.getParameter("jiudian");
        String kefangbianhao = request.getParameter("kefangbianhao");
        String leixing = request.getParameter("leixing");
        String daxiao = request.getParameter("daxiao");
        String jiage = request.getParameter("jiage");
        String beizhu = request.getParameter("beizhu");
        String sql = "insert into kefang(jiudian,kefangbianhao,leixing,daxiao,jiage,beizhu) values('" + jiudian + "','" + kefangbianhao + "','" + leixing + "','" + daxiao + "','" + jiage + "','" + beizhu + "') ";

        connDbBean.executeUpdate(sql);
        out.print("<script>alert('添加成功!!');location.href='kefang_add.jsp?jd=" + jiudian + "';</script>");
    }
}

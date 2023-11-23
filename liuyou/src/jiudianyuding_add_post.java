import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/jiudianyuding_add_post")
public class jiudianyuding_add_post extends HttpServlet {
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        String sql = "insert into jiudianyuding(jiudianmingcheng,kefangbianhao,jiage,yudingshijian,yudingtianshu,nindexingming,nindedianhua,nindeshenfenzheng,beizhu,yonghuming) values('" + jiudianmingcheng + "','" + kefangbianhao + "','" + jiage + "','" + yudingshijian + "','" + yudingtianshu + "','" + nindexingming + "','" + nindedianhua + "','" + nindeshenfenzheng + "','" + beizhu + "','" + yonghuming + "') ";

        connDbBean.executeUpdate(sql);
        out.print("<script>alert('Reservation successfully');location.href='jiudianxinxilist.jsp';</script>");

        ResultSet RS_result = connDbBean.executeQuery("select * from yonghuzhuce where yonghuming='" + yonghuming + "'");
        System.out.println("here is yonghuming :" + yonghuming);
        String mail = null;
        try {
            mail = RS_result.getString("youxiang");
            System.out.println(mail);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            String[] my_args = new String[]{"python", "E:/BaiduNetdiskDownload/Jsp+Servlet旅游网站/源代码/main.py", String.valueOf(mail)};
            Process proc = Runtime.getRuntime().exec(my_args);//执行脚本

            BufferedReader reader = new BufferedReader(new InputStreamReader(proc.getInputStream()));
            String line = null;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            reader.close();
            proc.waitFor();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
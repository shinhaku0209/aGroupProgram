import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/userreg")
public class userreg extends HttpServlet {
    private db.db connDbBean; // 添加成员变量

    public void init() throws ServletException {
        connDbBean = new db.db(); // 在init方法中实例化connDbBean
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        ResultSet RS_result = connDbBean.executeQuery("select * from yonghuzhuce where yonghuming='" + yonghuming + "'");
        System.out.println(yonghuming);

        try {
            if (RS_result.next()) {
                System.out.print("<script>alert('该用户名已经存在,请换其他名称的用户名!');window.history.go(-1);</script>");
            } else {

                String addtimes = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date());


                String sql = "insert into yonghuzhuce(yonghuming,mima,xingming,xingbie,chushengnianyue,QQ,youxiang,dianhua,shenfenzheng,touxiang,dizhi,beizhu,addtime,issh) values('" + yonghuming + "','" + mima + "','" + xingming + "','" + xingbie + "','" + chushengnianyue + "','" + QQ + "','" + youxiang + "','" + dianhua + "','" + shenfenzheng + "','" + touxiang + "','" + dizhi + "','" + beizhu + "','" + addtimes + "','y') ";

                connDbBean.executeUpdate(sql);
                System.out.print("<script>alert('注册成功！');location.href='contact.html';</script>");

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            RS_result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

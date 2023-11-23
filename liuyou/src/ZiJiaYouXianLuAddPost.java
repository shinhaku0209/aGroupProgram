import db.db;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ZiJiaYouXianLuAddPost")
public class ZiJiaYouXianLuAddPost extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setCharacterEncoding("gb2312");
        db connDbBean = new db();

        String xianlubianhao = request.getParameter("xianlubianhao");
        String xianlumingcheng = request.getParameter("xianlumingcheng");
        String chufadi = request.getParameter("chufadi");
        String mudedi = request.getParameter("mudedi");
        String jiaotonggongju = request.getParameter("jiaotonggongju");
        String feiyong = request.getParameter("feiyong");
        String chuxingshijian = request.getParameter("chuxingshijian");
        String beizhu = request.getParameter("beizhu");
        String faburen = request.getParameter("faburen");


        try {

            String sql = "insert into zijiayouxianlu(xianlubianhao,xianlumingcheng,chufadi,mudedi,jiaotonggongju,feiyong,chuxingshijian,beizhu,faburen) values('" + xianlubianhao + "','" + xianlumingcheng + "','" + chufadi + "','" + mudedi + "','" + jiaotonggongju + "','" + feiyong + "','" + chuxingshijian + "','" + beizhu + "','" + faburen + "') ";
            connDbBean.executeUpdate(sql);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
        }

        response.getWriter().println("<script>alert('Add successfully!!');location.href='zijiayouxianlu_add.jsp';</script>");
    }
}

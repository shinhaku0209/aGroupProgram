import com.jspsmart.upload.File;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/upload_post")
public class upload_post extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=GBK");
        PrintWriter out = response.getWriter();

        String SystemURL = "http://" + request.getHeader("host") + "/myshop/";
        String UploadFolder = "upload_img";
        int MaxFileSize = 1024 * 300;
        String UploadFolder2 = "images";
        int MaxFileSize2 = 1024 * 300;
        String tb_shop_catalog = "shop_catalog";
        String tb_shop_product_info = "shop_product_info";
        String tb_gbook_info = "shop_gbook_info";
        String tb_member_info = "shop_member_info";
        String tb_member_favorite = "shop_member_favorite";
        String tb_news_imgs = "shop_news_imgs";
        String tb_news_info = "shop_news_info";
        String tb_news_type = "shop_news_type";
        String tb_orders_main = "shop_orders_main";
        String tb_orders_r_info = "shop_orders_r_info";
        String tb_shop_admin = "shop_admin";
        String TimeStamp = String.valueOf((new Date()).getTime());
        String Msg = null;

        SmartUpload mySmartUpload = new SmartUpload();
        mySmartUpload.initialize(getServletConfig(), request, response);

        try {
            mySmartUpload.upload();
            File myFile = mySmartUpload.getFiles().getFile(0);

            if (myFile.getFileExt().equals("jpg") || myFile.getFileExt().equals("gif"))
                if (myFile.getSize() < MaxFileSize)
                    if (!myFile.isMissing()) {
                        String path = request.getServletContext().getRealPath("/");
                        myFile.saveAs(path + "/../../" + UploadFolder + "/" + TimeStamp + "." + myFile.getFileExt());
                        Msg = "上传成功！";
                        HttpSession session = request.getSession();
                        session.setAttribute("NewImgName", TimeStamp + "." + myFile.getFileExt());
                    } else {
                        Msg = "上传不成功！[<a href=javascript:history.back()>返回</a>]";
                    }
                else {
                    Msg = "体积过大！[<a href=javascript:history.back()>返回</a>]";
                }
            else {
                Msg = "不允许上传这类文件！[<a href=javascript:history.back()>返回</a>]";
            }
        } catch (Exception e) {
            e.printStackTrace();
            Msg = "上传失败！[<a href=javascript:history.back()>返回</a>]";
        }

        out.print("<font size=2>" + Msg + "</font>");
    }
}

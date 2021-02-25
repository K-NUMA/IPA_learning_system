package utils;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class QuestionImgUpload
 */
@WebServlet("/qupload")
@MultipartConfig(location="C:\\tmp",maxFileSize=1048576)
public class QuestionImgUpload extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionImgUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            Part part = request.getPart("file");
            String name = this.getFileName(part);

         if(name != null && !name.equals("")){
             //ファイル名から保存先のフォルダ―名を抽出(例:FE_年号(平成、令和など)〇〇年_春期 or 秋期)
             String folder_name;
             if(name.charAt(name.length()-7)=='問'){//抽出するフォルダ―名の最後の文字が'問'の場合、
                                                    //もう一文字ずらして抽出する(フォルダ―名の最後に'_'が付くため)
                 folder_name = name.substring(0, name.length()-8);
             }else{
                 folder_name = name.substring(0, name.length()-7);
             }

            //リスナーで取得したプロパティ―(保存先のフルパス)を使用する
            part.write((String)this.getServletContext().getAttribute("Filepath") + "/" + folder_name + "/" + name);
            request.getSession().setAttribute("flush","ファイルをアップロードしました");
            response.sendRedirect(request.getContextPath() + "/amquestions/manager/index");
        }else{
            request.setAttribute("error","ファイルを選択して下さい");
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/index.jsp");
            rd.forward(request, response);
        }
    }

    private String getFileName(Part part){
        String name = null;
        for(String dispotion : part.getHeader("Content-Disposition").split(";")){
            if(dispotion.trim().startsWith("filename")){
                name = dispotion.substring(dispotion.indexOf("=") + 1).trim().replace("\"", "");
                break;
            }
        }
        return name;
    }
}

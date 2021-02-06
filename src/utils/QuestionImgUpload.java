package utils;

import java.io.FileNotFoundException;
import java.io.IOException;

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
        try{
            Part part = request.getPart("file");
            String name = this.getFileName(part);

            //リスナーで取得したプロパティ―(保存先のフルパス)を使用する
            part.write((String)this.getServletContext().getAttribute("Filepath") + "/" + name);
            response.sendRedirect(request.getContextPath() + "/amquestions/new");
        }catch(FileNotFoundException e){
            request.setAttribute("upload_error","ファイルを選択して下さい");
            response.sendRedirect(request.getContextPath() + "/amquestions/new");
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

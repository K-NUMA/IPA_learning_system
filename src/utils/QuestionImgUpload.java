package utils;

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
@MultipartConfig(location="C:\\FE_Img",maxFileSize=1048576)
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
        part.write(name);
        response.sendRedirect(request.getContextPath() + "/amquestions/new");
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

package controllers.amquestions.manager;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestion;
import utils.DBUtil;

/**
 * Servlet implementation class AmQuestionsShowServlet
 */
@WebServlet("/amquestions/manager/show")
public class AmQuestionsShowServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmQuestionsShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        AmQuestion q = em.find(AmQuestion.class, Integer.parseInt(request.getParameter("id")));

        em.close();
        if(q != null){
            //ファイル名から保存先のフォルダ―名を抽出(例:FE_年号(平成、令和など)〇〇年_春期 or 秋期)
            String folder_name = "FE_" + q.getQs_year() + "_" + q.getQs_season() + " 問題の画像";
            request.setAttribute("amquestion", q);
            request.setAttribute("qcontent", (String)this.getServletContext().getAttribute("Filepath") + "/" + folder_name + "/" + q.getContentImg());
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/show.jsp");
        rd.forward(request, response);
    }

}

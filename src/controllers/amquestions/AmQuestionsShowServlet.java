package controllers.amquestions;

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
@WebServlet("/amquestions/show")
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
            request.setAttribute("amquestion", q);
            request.setAttribute("qcontent", "/FE_img/" + q.getContentImg());
        }
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/show.jsp");
        rd.forward(request, response);
    }

}

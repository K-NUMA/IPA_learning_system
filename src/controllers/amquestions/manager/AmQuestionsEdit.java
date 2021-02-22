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
 * Servlet implementation class AmQuestionsEdit
 */
@WebServlet("/amquestions/manager/edit")
public class AmQuestionsEdit extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmQuestionsEdit() {
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

        request.setAttribute("amquestion", q);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("question_id", q.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/edit.jsp");
        rd.forward(request, response);
    }

}

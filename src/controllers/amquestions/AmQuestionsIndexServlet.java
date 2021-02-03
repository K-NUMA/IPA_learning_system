package controllers.amquestions;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DBUtil;

/**
 * Servlet implementation class AmQuestionsIndexServlet
 */
@WebServlet("/amquestions/index")
public class AmQuestionsIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmQuestionsIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        long questions_count = (long)em.createNamedQuery("getQuestionsCount",Long.class).getSingleResult();

        request.setAttribute("questions_count", questions_count);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/index.jsp");
        rd.forward(request, response);
    }

}

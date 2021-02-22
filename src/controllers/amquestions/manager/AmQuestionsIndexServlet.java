package controllers.amquestions.manager;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class AmQuestionsIndexServlet
 */
@WebServlet("/amquestions/manager/index")
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

        String test_year = null;
        String test_season = null;

        test_year = request.getParameter("select_year");
        test_season = request.getParameter("select_season");

        //JSPで選択した、試験の出題年と時期を引数にして
        //該当する問題データを取得
        List<AmQuestion> amquestion = em.createNamedQuery("getYearQuestion",AmQuestion.class)
                .setParameter("qs_year", test_year)
                .setParameter("qs_season", test_season)
                .getResultList();

        long questions_count = (long)em.createNamedQuery("getQuestionsCount",Long.class).getSingleResult();

        request.setAttribute("test_year", test_year);
        request.setAttribute("test_season", test_season);
        request.setAttribute("amquestions", amquestion);
        request.setAttribute("questions_count", questions_count);

        //create,update,destoryが実行された後に処理の完了を示すフラッシュメッセージの準備
        if(request.getSession().getAttribute("flush") != null){
            request.setAttribute("flush",request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/index.jsp");
        rd.forward(request, response);
    }

}

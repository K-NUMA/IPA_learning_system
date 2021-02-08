package controllers.amquestions.test;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestion;
import utils.DBUtil;

/**
 * Servlet implementation class TestQuestions
 */
@WebServlet("/amquestions/test/testquestion")
public class TestQuestions extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestQuestions() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        String test_year = null;
        String test_season = null;
        Integer qnum = Integer.parseInt(request.getParameter("qnumber"));

        test_year = request.getParameter("select_year");
        test_season = request.getParameter("select_season");
        request.setAttribute("test_year", test_year);
        request.setAttribute("test_season", test_season);

        //toppage.jspからのリクエストでのみif文内の処理を行う
        if(qnum == 0 && !test_year.equals("") && !test_season.equals("")){
            List<AmQuestion> qlist = em.createNamedQuery("getYearQuestion",AmQuestion.class)
                    .setParameter("qs_year", test_year)
                    .setParameter("qs_season", test_season)
                    .getResultList();

            qnum = 1;

          //選んだ解答を格納する配列
            String[] ans = new String[qlist.size()];

            //試験解答中は、セッションスコープへ問題一覧と選択した解答の一覧を格納しておく
            request.getSession().setAttribute("qlist", qlist);
            request.getSession().setAttribute("ans", ans);
        }

        try{
            /*AmQuestion qselect = em.createNamedQuery("getSelectQuestion",AmQuestion.class)
                .setParameter("qs_year", test_year)
                .setParameter("qs_season", test_season)
                .setParameter("qs_number", qnum)
                .getSingleResult();*/
            //問題の番号をリクエストスコープへ格納(リストの添え字なので-1しておく)
            request.setAttribute("qnum", qnum-1);
            //request.setAttribute("qcontent", "/FE_img/" + qselect.getContentImg());
        }catch(NoResultException e){}



        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/test/testquestion.jsp");
        rd.forward(request, response);
    }

}

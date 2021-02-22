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
        final int TESTMAXNUMBER = 80;

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

            //指定した出題数を変数へ格納
            Integer test_numbers = Integer.parseInt(request.getParameter("select_number"));

            //登録されている問題数が指定した出題数より多い場合かつ。出題数が80問でない場合、
            //指定した問題数になるまでランダムに問題を除外(残った問題で出題)
            if(test_numbers != TESTMAXNUMBER && qlist.size() > test_numbers){
                int i=0;
                while(qlist.size() > test_numbers){
                    i = (int)Math.random() * qlist.size();
                    qlist.remove(i);
                }
            }

            qnum = 1;

          //選んだ解答を格納する配列
            String[] ans = new String[qlist.size()];

            //試験解答中は、セッションスコープへ問題一覧と選択した解答の一覧を格納しておく
            request.getSession().setAttribute("qlist", qlist);
            request.getSession().setAttribute("ans", ans);
            request.getSession().setAttribute("qnumbers", qlist.size());

            //ファイル名から保存先のフォルダ―名を定義(例:FE_年号(平成、令和など)〇〇年_春期 or 秋期)
            //試験中のみ定義したフォルダ名をセッションスコープへ格納
            String folder_name = "FE_" + test_year + "_" + test_season;
            request.getSession().setAttribute("folder_name", folder_name);
        }

        try{
            //問題の番号をリクエストスコープへ格納(リストの添え字なので-1しておく)
            request.setAttribute("qnum", qnum-1);
        }catch(NoResultException e){}



        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/test/testquestion.jsp");
        rd.forward(request, response);
    }

}

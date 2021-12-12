package controllers.mypage;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestionCategory;
import models.AmScoreRegist;
import utils.DBUtil;

/**
 * Servlet implementation class FE_TestDetailsServlet
 */
@WebServlet("/mypage/feshow")
public class FE_TestDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FE_TestDetailsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();
        Integer id = Integer.parseInt(request.getParameter("id"));
        AmScoreRegist s = em.find(AmScoreRegist.class, id);
        //問題の種類数(1.テクノロジ系、2.マネジメント系、3.ストラテジ系)
        final int QCATEGORY = 3;

        AmQuestionCategory c = em.createNamedQuery("ScoreIdSelectData",AmQuestionCategory.class)
                .setParameter("score_id",s)
                .getSingleResult();

      //問題分野名を格納する配列
        String[] category_name = {"テクノロジ系","マネジメント系","ストラテジ系"};


        //問題分野の点数を格納する配列
        double[] category_rate = new double[QCATEGORY];

        //問題分野毎に正答率を格納
        category_rate[0] = c.getTechnology();
        category_rate[1] = c.getManagement();
        category_rate[2] = c.getStrategy();

        //該当する問題分野の問題が出題されたかどうか表す配列
        boolean[] question_flag = new boolean[QCATEGORY];

        //出題されなかった問題分野は、i番目のquestion_flagにfalseを代入
        for(int i=0 ; i < QCATEGORY;i++){
            question_flag[i] = true;
            if(category_rate[i] == -1){
                question_flag[i] = false;

                //正答率が-1なので0を代入しておく
                category_rate[i] = 0.0;
            }
        }

        //指定したユーザの試験結果と問題分野名、問題分野毎の正答率、
        //問題分野の問題が出題されているかのフラグ配列をリクエストスコープへ格納
        request.setAttribute("test_score", s);
        request.setAttribute("category_name", category_name);
        request.setAttribute("qcategorys", category_rate);
        request.setAttribute("question_flag", question_flag);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/userPage/FE_TestDetails.jsp");
        rd.forward(request,response);

    }

}

package controllers.amquestions.scoreregist;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestionCategory;
import models.AmScoreRegist;
import models.UserList;
import utils.DBUtil;

/**
 * Servlet implementation class AmScoreRegistCreateServlet
 */
@WebServlet("/amquestions/scoreregist/registscore")
public class AmScoreRegistCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmScoreRegistCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String _token = (String)request.getParameter("_token");
        //if(_token != null && _token.equals(request.getSession().getId())){
            EntityManager em = DBUtil.createEntityManager();

            AmScoreRegist ascore = new AmScoreRegist();
            AmQuestionCategory acategory = new AmQuestionCategory();
            Date ans_date = new Date(System.currentTimeMillis());

            //セッションスコープの値を変数へ
            BigDecimal[] anscategory = (BigDecimal[])request.getSession().getAttribute("anscategory");

            //リクエストスコープの値を変数へ
            int scorepoint = Integer.parseInt(request.getParameter("scorepoint"));

            //採点結果をテーブルへ登録
            ascore.setUser((UserList)request.getSession().getAttribute("login_user"));
            ascore.setScore(scorepoint);
            ascore.setTest_year(request.getParameter("qs_year"));
            ascore.setTest_season(request.getParameter("qs_season"));
            ascore.setAnstime(ans_date);
            ascore.setAnscount(Integer.parseInt(request.getParameter("qcounts")));

            em.getTransaction().begin();
            em.persist(ascore);
            em.getTransaction().commit();

            //上記のプログラムで登録した採点結果を用いて問題の分野毎の正答率をテーブルへ登録
            //上記のプログラムでテーブルへ登録した採点結果をNamedQuery文で検索
            //一番高いテーブルレコードのidを、ログイン中のユーザーidで検索
            //(ログイン中のユーザが一番最後に登録したレコードが見つかるため)
            int addedScoreId = (int)em.createNamedQuery("getUserMostRecentScore",Integer.class)
                .setParameter("user",(UserList)request.getSession().getAttribute("login_user"))
                .getSingleResult();

            //上記のNamedQuery文で見つかったユーザーIDを用いて、
          //上記のプログラムで登録したレコードを取得
            AmScoreRegist addedScore = em.find(AmScoreRegist.class, addedScoreId);

            //問題の分野毎の正答率をテーブルへ登録
            acategory.setScore_id(addedScore);
            acategory.setTechnology(anscategory[0].doubleValue());
            acategory.setManagement(anscategory[1].doubleValue());
            acategory.setStrategy(anscategory[2].doubleValue());

            em.getTransaction().begin();
            em.persist(acategory);
            em.getTransaction().commit();
            em.close();
            request.getSession().removeAttribute("anscategory");
            request.getSession().setAttribute("flush", "結果の登録が完了しました。");

            response.sendRedirect(request.getContextPath() + "/");

       // }
    }

}

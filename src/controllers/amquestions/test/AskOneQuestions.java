package controllers.amquestions.test;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestion;
import utils.AnsWord;
import utils.DBUtil;

/**
 * Servlet implementation class AskOneQuestions
 */
@WebServlet("/amquestions/test/askquestions")
public class AskOneQuestions extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskOneQuestions() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        AmQuestion q = null;

        //jspのtoppageのリクエストかservletのAnsQuestionのリクエストかで処理を分岐する
        if(request.getParameter("requestpage").equals("top")){
            long questionNum = (long)em.createNamedQuery("getQuestionsCount",Long.class).getSingleResult();

            //1から問題数まで、ランダムな値を選択(1を加算しないと0が選ばれる)
            double selectquestion = Math.random() * questionNum + 1;

            q = em.find(AmQuestion.class, (int)selectquestion);
        }else if(request.getParameter("requestpage").equals("answer")){
            q = em.find(AmQuestion.class, Integer.parseInt(request.getParameter("id")));
            request.setAttribute("answerd", request.getParameter("answer"));

            //解答は数値で送られてくるので、対応する記号へ変えるstaticメソッドを呼び出し
            request.setAttribute("selectans", AnsWord.ansWordTrans(Integer.parseInt(request.getParameter("select"))));
            request.setAttribute("trueans", AnsWord.ansWordTrans(Integer.parseInt(request.getParameter("true"))));
        }

        if(q != null){
            //ファイル名から保存先のフォルダ―名を定義(例:FE_年号(平成、令和など)〇〇年_春期 or 秋期)
            String folder_name = "FE_" + q.getQs_year() + "_" + q.getQs_season() + " 問題の画像";
            request.setAttribute("qselected", q);
            request.setAttribute("qcontent", (String)this.getServletContext().getAttribute("Filepath") + "/" +
            folder_name+ "/" + q.getContentImg());
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/test/askquestion.jsp");
        rd.forward(request, response);
    }

}

package controllers.amquestions;

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
import models.validators.AmQuestionsValidator;
import utils.DBUtil;

/**
 * Servlet implementation class AmQuestionsCreateServlet
 */
@WebServlet("/amquestions/create")
public class AmQuestionsCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmQuestionsCreateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String _token = (String)request.getParameter("_token");

        if(_token != null && _token.equals(request.getSession().getId())){
            EntityManager em = DBUtil.createEntityManager();

            AmQuestion q = new AmQuestion();

            //フォームから受け取ったデータをそれぞれ、対象のカラムへ保存する。
            try{
                q.setQs_year(request.getParameter("year"));
                q.setQs_season(request.getParameter("season"));
                q.setQs_number(Integer.parseInt(request.getParameter("qnumber")));
                q.setAnswer(Integer.parseInt(request.getParameter("answer")));
                q.setCategory(Integer.parseInt(request.getParameter("category")));
            }catch(NumberFormatException e){

            }

            //サーバへアップロードした"問題の画像ファイル名(PNGファイル)"の文字列データを作成
            String filename = "FE_" + request.getParameter("year") + "_" + request.getParameter("season")
            + "_問" + request.getParameter("qnumber") + ".png";

            q.setContentImg(filename);

            //出題時期、問題番号、問題の画像ファイル名のエラーチェックを行う。
            List<String> errors = AmQuestionsValidator.validate(q,filename,(String)this.getServletContext().getAttribute("Filepath"));

            //バリデーションチェックでエラーが見つかった場合、フラッシュメッセージを表示する。
            if(errors.size() > 0){
                em.close();

                request.setAttribute("_token", request.getSession().getId());
                request.setAttribute("amquestion", q);
                request.setAttribute("errors",errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/new.jsp");
                rd.forward(request,response);
            }else{
                //エラーが無かった場合、AmQuestionテーブルへ保存した内容をコミット
                em.getTransaction().begin();
                em.persist(q);
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush","登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/amquestions/index");

            }
        }

    }

}

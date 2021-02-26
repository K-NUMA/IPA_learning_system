package controllers.amquestions.manager;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestion;
import utils.DBUtil;

/**
 * Servlet implementation class AmquestionsUpdateServlet
 */
@WebServlet("/amquestions/manager/update")
public class AmquestionsUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmquestionsUpdateServlet() {
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

                AmQuestion q = em.find(AmQuestion.class, (Integer)request.getSession().getAttribute("question_id"));

                //主な変更部分は、問題の分野と答えのみなので、バリデーションチェックの必要は無し
                    q.setAnswer(Integer.parseInt(request.getParameter("answer")));
                    q.setCategory(Integer.parseInt(request.getParameter("category")));

                    //AmQuestionテーブルへ変更する内容をコミット
                    em.getTransaction().begin();
                    em.getTransaction().commit();
                    em.close();

                    request.getSession().setAttribute("flush","変更が完了しました。");

                    request.getSession().removeAttribute("question_id");

                    response.sendRedirect(request.getContextPath() + "/amquestions/manager/index");

            }
    }

}

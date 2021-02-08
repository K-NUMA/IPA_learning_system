package controllers.amquestions.test;

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
 * Servlet implementation class AnsQuestion
 */
@WebServlet("/amquestions/test/ansquestions")
public class AnsQuestion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnsQuestion() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        AmQuestion q = em.find(AmQuestion.class, Integer.parseInt(request.getParameter("id")));
        int selectans = Integer.parseInt(request.getParameter("ans"));
        int answerjudge=-1;

        //選んだ答えと問題の答えが正解か判定
        if(q.getAnswer() == selectans){
            answerjudge=1; //正解
        }else{
            answerjudge=0; //不正解
        }

        response.sendRedirect(request.getContextPath() + "/amquestions/test/askquestions?"+ "requestpage=answer"
        + "&" + "id=" + request.getParameter("id") + "&" + "answer=" + answerjudge + "&" + "true=" + q.getAnswer()
        + "&" + "select=" + selectans);
    }

}

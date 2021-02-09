package controllers.amquestions.test;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmQuestion;
import utils.AnsWord;

/**
 * Servlet implementation class TestScoring
 */
@WebServlet("/amquestions/test/testscoring")
public class TestScoring extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestScoring() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] ans = (String[])request.getSession().getAttribute("ans");
        int ansnum;

        @SuppressWarnings("unchecked")
        ArrayList<AmQuestion> questions = (ArrayList<AmQuestion>)request.getSession().getAttribute("qlist");
        String[] ansResult = new String[questions.size()];
        double scorePoint = 0.0;

        //解答が正解か一問ずつチェック
        for(int i=0 ; i < questions.size(); i++){
            ansnum = AnsWord.wordAnsTrans(ans[i]);
            if(questions.get(i).getAnswer() == ansnum){
                ansResult[i] = "〇";
                scorePoint += (double)1 / questions.size() * 100;
            }else{
                ansResult[i] = "×";
            }
        }

        if((int)scorePoint >= 60){
            request.setAttribute("passjudge", "合格です！！");
        }else{
            request.setAttribute("passjudge", "不合格です");
        }

        request.setAttribute("ansresult",ansResult);
        request.setAttribute("scorepoint",(int)scorePoint);

        //戻るボタンで解答を改ざんできないようにセッションスコープをリクエストスコープへ
        request.setAttribute("qlist", request.getSession().getAttribute("qlist"));
        request.setAttribute("ans", request.getSession().getAttribute("ans"));
        request.getSession().removeAttribute("qlist");
        request.getSession().removeAttribute("ans");

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/test/testscore.jsp");
        rd.forward(request, response);

    }

}

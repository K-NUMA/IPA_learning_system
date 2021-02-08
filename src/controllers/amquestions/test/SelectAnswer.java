package controllers.amquestions.test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.AnsWord;

/**
 * Servlet implementation class SelectAnswer
 */
@WebServlet("/amquestions/test/selectans")
public class SelectAnswer extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int questionNum = Integer.parseInt(request.getParameter("qnumber"));
        String questionAns = AnsWord.ansWordTrans(Integer.parseInt(request.getParameter("ans")));

        String[] ans = (String[])request.getSession().getAttribute("ans");

        //questionNumは解答用の配列の添え字なので-1しておく
        ans[questionNum - 1] = questionAns;
        request.getSession().setAttribute("ans",ans);
        request.setAttribute("qnum", questionNum - 1);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/amquestions/test/testquestion.jsp");
        rd.forward(request, response);
    }

}

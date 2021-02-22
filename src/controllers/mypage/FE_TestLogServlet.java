package controllers.mypage;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.AmScoreRegist;
import models.UserList;
import utils.DBUtil;

/**
 * Servlet implementation class FE_TestLogServlet
 */
@WebServlet("/mypage/felog")
public class FE_TestLogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public FE_TestLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        UserList login_user = (UserList)request.getSession().getAttribute("login_user");

        int page;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        }catch(Exception e){
            page = 1;
        }


        List<AmScoreRegist> testlog = em.createNamedQuery("getUserAllScore",AmScoreRegist.class)
                .setParameter("user", login_user)
                .setFirstResult(15 * (page - 1))
                .setMaxResults(15)
                .getResultList();

        long test_count = (long)em.createNamedQuery("getUserScoreCount",Long.class)
                .setParameter("user", login_user)
                .getSingleResult();

        em.close();

        request.setAttribute("userinfo", login_user);
        request.setAttribute("testlog",testlog);
        request.setAttribute("test_count", test_count);
        request.setAttribute("page",page);

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/userPage/FE_TestLog.jsp");
        rd.forward(request,response);
    }

}

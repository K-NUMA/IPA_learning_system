package controllers.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UserList;

/**
 * Servlet implementation class MypageTopServlet
 */
@WebServlet("/mypage/top")
public class MypageTopServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageTopServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserList login_user = (UserList)request.getSession().getAttribute("login_user");

        request.setAttribute("userinfo", login_user);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/userPage/index.jsp");
        rd.forward(request,response);
    }

}

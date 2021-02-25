package controllers.user;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UserList;
import utils.DBUtil;

/**
 * Servlet implementation class UserIndexServlet
 */
@WebServlet("/user/index")
public class UserIndexServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserIndexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = DBUtil.createEntityManager();

        int page = 1;
        try{
            page = Integer.parseInt(request.getParameter("page"));
        }catch(NumberFormatException e){
            page = 1;
        }

        List<UserList> users = em.createNamedQuery("getAllUser",UserList.class)
                .setFirstResult(15 * (page - 1))
                .setMaxResults(15)
                .getResultList();

        long users_count = (long)em.createNamedQuery("getUserCount",Long.class)
                .getSingleResult();

        em.close();

        request.setAttribute("users",users);
        request.setAttribute("users_count",users_count);
        request.setAttribute("page",page);
        if(request.getSession().getAttribute("flush") != null){
            request.setAttribute("flush",request.getSession().getAttribute("flush"));
            request.getSession().removeAttribute("flush");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/index.jsp");
        rd.forward(request,response);
    }

}

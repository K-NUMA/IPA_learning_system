package controllers.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UserList;
import models.validators.UserValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class UserCreateServlet
 */
@WebServlet("/user/create")
public class UserCreateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCreateServlet() {
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

            UserList u = new UserList();

            u.setUser_id(request.getParameter("user_id"));
            u.setUser_name(request.getParameter("user_name"));
            u.setPassword(
                    EncryptUtil.getPasswordEncrypt(
                            request.getParameter("password"),
                            (String)this.getServletContext().getAttribute("pepper")
                            )
                    );

            //アクセスした一般ユーザーがアカウントを作成出来るようにするため、
            //管理者フラグは0(一般ユーザー)にする。(管理者ユーザーにしたい場合は、MySQLで更新する)
            u.setAdmin_flag(0);

            Timestamp currentTime = new Timestamp(System.currentTimeMillis());
            u.setCreated_at(currentTime);
            u.setUpdated_at(currentTime);
            u.setDelete_flag(0);

            List<String> errors = UserValidator.validate(u,true,true);
            if(errors.size() > 0){
                em.close();

                request.setAttribute("_token",request.getSession().getId());
                request.setAttribute("user", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/new.jsp");
                rd.forward(request,response);
            }else{
                em.getTransaction().begin();
                em.persist(u);
                em.getTransaction().commit();
                request.getSession().setAttribute("flush","登録が完了しました。");

                response.sendRedirect(request.getContextPath() + "/user/index");
            }
        }
    }

}

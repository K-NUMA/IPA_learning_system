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
 * Servlet implementation class UserUpdateServlet
 */
@WebServlet("/user/update")
public class UserUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserUpdateServlet() {
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

            UserList u = em.find(UserList.class,(Integer)(request.getSession().getAttribute("user_id")));

            // 現在の値と異なるユーザーIDが入力されていたら
            // 重複チェックを行う指定をする
            Boolean uidDuplicateCheckFlag = true;
            if(u.getUser_id().equals(request.getParameter("user_id"))){
                uidDuplicateCheckFlag = false;
            }else{
                u.setUser_id(request.getParameter("user_id"));
            }

            // パスワード欄に入力があったら
            // パスワードの入力値チェックを行う指定をする
            Boolean passwordCheckFlag = true;
            String password = request.getParameter("password");
            if(password == null || password.equals("")){
                passwordCheckFlag = false;
            }else{
                u.setPassword(
                        EncryptUtil.getPasswordEncrypt(
                                password,
                                (String)this.getServletContext().getAttribute("pepper")
                                )
                        );
            }

            u.setUser_name(request.getParameter("user_name"));
            u.setAdmin_flag(Integer.parseInt(request.getParameter("admin_flag")));
            u.setUpdated_at(new Timestamp(System.currentTimeMillis()));
            u.setDelete_flag(0);

            List<String> errors = UserValidator.validate(u,uidDuplicateCheckFlag,passwordCheckFlag);
            if(errors.size() > 0){
                em.close();

                request.setAttribute("_token",request.getSession().getId());
                request.setAttribute("employee", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/edit.jsp");
                rd.forward(request,response);
            }else{
                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "情報の変更が完了しました。");

                request.getSession().removeAttribute("user_id");

                response.sendRedirect(request.getContextPath() + "/user/index");
            }
        }
    }

}

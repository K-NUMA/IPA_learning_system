package controllers.password;

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
import models.validators.PasswordValidator;
import utils.DBUtil;
import utils.EncryptUtil;

/**
 * Servlet implementation class PasswordUpdateServlet
 */
@WebServlet("/psupdate")
public class PasswordUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordUpdateServlet() {
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

            String user_id = (String)request.getParameter("user_id");

            //フォームから入力したユーザーIDがUserListテーブル上に
            //存在するか検索。あれば1が、なければ0が返ってくる。
            long ucount = em.createNamedQuery("checkRegisterdUserIdCount",Long.class)
                    .setParameter("user_id", user_id)
                    .getSingleResult();

            UserList u =null;

            //ユーザーIDが存在した場合、UserListテーブルから
            //該当のユーザーIDのレコードを取得。
            if(ucount > 0){
                u  = em.createNamedQuery("checkRegisterdUserId",UserList.class)
                    .setParameter("user_id", user_id)
                    .getSingleResult();
            }

            //フォームから入力した値を変数に格納
            String password = request.getParameter("new_password");
            String re_ent_password = request.getParameter("re_enter_password");

            //ユーザーID、新規パスワードの入力内容のチェック
            //エラーが見つかった場合、errors.size()は1以上の値がになる。
            List<String> errors = PasswordValidator.validate(u,password,re_ent_password);
            if(errors.size() > 0){
                em.close();

                request.setAttribute("_token",request.getSession().getId());
                request.setAttribute("employee", u);
                request.setAttribute("errors", errors);

                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/user/pwchange.jsp");
                rd.forward(request,response);
            }else{
                //入力チェックに問題ないのでパスワードを変更
                u.setPassword(
                        EncryptUtil.getPasswordEncrypt(
                                password,
                                (String)this.getServletContext().getAttribute("pepper")
                                )
                        );

                em.getTransaction().begin();
                em.getTransaction().commit();
                em.close();
                request.getSession().setAttribute("flush", "パスワードの変更が完了しました。");

                request.getSession().removeAttribute("user_id");

                response.sendRedirect(request.getContextPath() + "/");
            }
        }
    }

}

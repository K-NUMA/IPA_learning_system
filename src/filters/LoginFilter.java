package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.UserList;
/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/*")
public class LoginFilter implements Filter {

    /**
     * Default constructor.
     */
    public LoginFilter() {

    }

    /**
     * @see Filter#destroy()
     */
    public void destroy() {

    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        String context_path = ((HttpServletRequest)request).getContextPath();
        String servlet_path = ((HttpServletRequest)request).getServletPath();

        if(!servlet_path.matches("/css.*")){ // CSSフォルダ内は認証処理から除外する
            HttpSession session = ((HttpServletRequest)request).getSession();

            // セッションスコープに保存されたログインユーザ情報を取得
            UserList u = (UserList)session.getAttribute("login_user");

            if(!servlet_path.equals("/login")){ // ログイン画面以外について

                // 試験問題を解答するとき、ログインが必須になるので
                // ログイン画面にリダイレクト
                if(u == null && (servlet_path.matches("/amquestions/test/testquestion") ||
                        servlet_path.matches("/amquestions/test/selectans"))){
                    ((HttpServletResponse)response).sendRedirect(context_path + "/login");
                    return;
                }

                // ログインしていない状態でユーザー管理の機能へアクセス出来ないようにする
                if(u == null && servlet_path.matches("/user.*")){
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }

                // ログインしていない状態で問題管理の機能へアクセス出来ないようにする
                if(u == null && servlet_path.matches("/amquestions.manager.*")){
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }

                // ユーザー管理の機能は管理者のみが閲覧できるようにする
                if(servlet_path.matches("/user.*") && u.getAdmin_flag() == 0){
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }

                // 問題管理の機能は管理者のみが閲覧できるようにする
                if(servlet_path.matches("/amquestions.manager.*") && u.getAdmin_flag() == 0){
                    ((HttpServletResponse)response).sendRedirect(context_path + "/");
                    return;
                }

        }else{  //ログイン画面について
            // ログインしているのにログイン画面を表示させようとした場合は
            // システムのトップページにリダイレクト
            if(u != null){
                ((HttpServletResponse)response).sendRedirect(context_path + "/");
                return;
            }
        }
    }

        chain.doFilter(request, response);
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {

    }

}

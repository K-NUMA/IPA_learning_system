<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">ログイン画面</h1>
    </c:param>
    <c:param name="content">
        <c:if test="${hasError}">
            <div id="flush_error">
                ユーザーIDかパスワードが間違っています。
            </div>
        </c:if>
        <c:if test="$[flush != null]">
            <div id="flush_success m-auto">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>

        <div  class="d-flex flex-column toplittle w-25 mx-auto" >
        <form method="POST" action="<c:url value='/login' />">
            <div class="d-flex flex-column align-items-center bg-success text-white p-2 rounded">
                   <div class=" form-group mt-2 mx-auto">
                        <label for="user_id">ユーザーID</label><br />
                        <input type="text" name="user_id" value="${user_id}" class="form-control" />
                        <br /><br />

                        <label for="password">パスワード</label><br />
                        <input type="password" name="password" class="form-control" />

                        <br /><br />
                        <div >
                        <input type="hidden" name="_token" value="${_token}" />

                        <button  type="submit" class="btn btn-primary">ログインする</button>
                        </div>
                    </div>
            </div>
         </form>
         <br /><br />

         <a href="<c:url value='/' /> " class="text-white btn bg-primary w-100">パスワードをお忘れの方はこちら</a>
         </div>
    </c:param>
</c:import>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${errors != null}"> --%>
<!--     <div id="flush_error"> -->
<!--         入力内容にエラーがあります。<br /> -->
<%--         <c:forEach var="error" items="${errors}"> --%>
<%--             ・<c:out value="${error}" /><br /> --%>
<%--         </c:forEach> --%>
<!--     </div> -->
<%-- </c:if> --%>

<div class="d-flex flex-column align-items-center bg-success text-white p-2 rounded w-25 mx-auto">
<div class="form-group mt-2">
<label for="user_id">ユーザIDを入力してください</label><br />
<input type="text" name="user_id" class="form-control"/>
<br />

<label for="user_name">新しいパスワードを入力</label><br />
<input type="password" name="new_password" class="form-control"/>
<br />

<label for="password">新しいパスワードを再入力</label><br />
<input type="password" name="re_enter_password" class="form-control" />
<br />

<input type="hidden" name="_token" value="${_token}" />
<button type="submit" class="btn btn-primary">パスワードを変更する</button>

</div>
</div>
<br />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${errors != null}">
    <div id="flush_error">
        入力内容にエラーがあります。<br />
        <c:forEach var="error" items="${errors}">
            ・<c:out value="${error}" /><br />
        </c:forEach>
    </div>
</c:if>

<div class="d-flex bg-success text-white mt-2 pt-1 pl-2 pr-2 w-25">
<div class="form-group w-100">
<label for="user_id">ユーザID</label><br />
<input type="text" name="user_id" value="${user.user_id}" class="form-control"/>
<br />

<label for="user_name">ユーザ名</label><br />
<input type="text" name="user_name" value="${user.user_name}" class="form-control"/>
<br />

<label for="password">パスワード</label><br />
<input type="password" name="password" class="form-control" />

</div>
</div>

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">実行</button>
<br /><br />
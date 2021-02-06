<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <h2>問題の登録画面</h2>
        <c:if test="${flush_error != null }">
            <c:out value="${flush_error}" />
        </c:if>

        <form method="POST" action="<c:url value='/amquestions/create' />" id="qupload">
            <c:import url="_forms.jsp" />
        </form>

        <label for="qcontent">問題の内容</label>
        <br />
        <form method="POST" enctype="multipart/form-data" action="<c:url value='/qupload' />" >
            <input type="file" name="file" /><br />
            <input type="text" name="year"  id="year" disabled="disabled" /><br />
            <input type="text" name="season" id="season" onclick="incopy()" disabled="disabled" /><br />
            <input type="text" name="number" id="number" disabled="disabled" /><br />
            <input type="submit" value="アップロード" />
        </form>

        <!-- inputタグへ入力した内容を指定したidのinputタグへ転記するjsのメソッド -->
        <script type="text/javascript">
        function incopy(img,q){
            document.getElementById(img).value = document.getElementById(q).value;
        }
        </script>

        <p><a href="<c:url value='/amquestions/index'/>">一覧に戻る</a></p>
    </c:param>
</c:import>
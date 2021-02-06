<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1>試験問題の登録画面</h1>
    </c:param>
    <c:param name="content">

        <form method="POST" action="<c:url value='/amquestions/create' />" id="qupload">
            <c:import url="_forms.jsp" />
        </form>

        <p>問題の内容は事前に画像をアップロードしておいて下さい</p>

        <br />


        <!-- inputタグへ入力した内容を指定したidのinputタグへ転記するjsのメソッド -->
        <script type="text/javascript">
        function incopy(img,q){
            document.getElementById(img).value = document.getElementById(q).value;
        }
        </script>

        <p><a href="<c:url value='/amquestions/index'/>">一覧に戻る</a></p>
    </c:param>
</c:import>
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

<br />
<div>
<label for="qyear">出題時期</label><br />
<!-- datalistの値にカーソルを合わせるとイベントハンドラであるonmouseoverからjsのfunctionを呼び出し、
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
<input type="text" name="year" autocomplete="on" list="years" id="yearsIn" onmouseover="incopy('year',this.id)">
<c:import url="yearlist.jsp" />

<p>
<!-- ラジオボタンをクリックすると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
<input type="radio" name="season" value="春期" checked="checked" id="spring" onclick="incopy('season',this.id)">春期
<input type="radio" name="season" value="秋期" id="autum" onclick="incopy('season',this.id)">秋期
</p>

<p>
<!-- 問題の番号を入力すると、onclickでjsのfunctionを呼びだし、呼び出し元のidから
ファイルをアップロードするフォームの該当するidへ値をコピーする。 -->
問<input type="number" name="qnumber" max=80 min=1 id="qnum" onclick="incopy('number',this.id)">
</p>

<p>

<label for="qcategory">問題カテゴリ</label><br />
<input type="text" name="category" autocomplete="on" list="categoryies" >
<c:import url="categorylist.jsp" />

<p><label for="answer">解答</label><br />
<input type="radio" name="answer" value="1" checked="checked">ア
<input type="radio" name="answer" value="2" >イ
<input type="radio" name="answer" value="3" >ウ
<input type="radio" name="answer" value="4" >エ
</p>

<input type="hidden" name="_token" value="${_token}" />
<button type="submit">登録</button>
</div>

<br />
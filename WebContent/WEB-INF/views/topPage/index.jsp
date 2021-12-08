<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="pagename">
        <h1 class=" navbar-brand">トップページ</h1>
    </c:param>
    <c:param name="content">

        <br /><br />
        <div class="w-75 mx-auto">
        <div class="d-flex text-white bg-success pl-1 pr-1">このサイトについて</div>
        <div class="d-flex text-black bg-white border-5 border-success my-box pl-2 pr-2">
        <div class="d-block p-1">
            基本情報技術者試験の午前問題の過去問の勉強ができるWEBアプリケーションです。基本情報の午前問題を<br />勉強したい方は是非利用してみてください。ユーザー登録すれば、試験形式で勉強することもできます。<br />
            ただし、問題の解説が載っていないので悪しからず。
            (製作者の実力不足です・・・。申し訳ありません。）<br /><br />
            利用方法については、<a>こちらをご覧ください。</a><br />
            ユーザー登録をしていない方は、<a href="<c:url value='/user/new' /> ">こちらをご利用ください。</a>
        </div>
        </div>
        <br />

        <div class="d-flex text-white bg-success pl-1 pr-1">一問一答形式</div>
        <div class="d-flex text-black bg-white border-5 border-success my-box pl-2 pr-2">
        <form method="GET" action="<c:url value="/amquestions/test/askquestions" />" class="w-100">
            <input type="hidden" name="requestpage" value="top">
            <div class="pt-1 pb-1">
            過去の問題からランダムに1つ問題が出題されます。<br />
            ただし、解答結果は保存されません。
            </div>
            <div class="text-right">
            <button type="submit" class="btn btn-primary m-2">問題を解く</button>
            </div>
        </form>
        </div>
        <br />

        <div class="d-flex text-white bg-success pl-1 pr-1">試験形式</div>
        <div class="d-flex text-black bg-white border-5 border-success my-box pt-1 pb-2 pl-2 pr-2">

        <form method="GET" action="<c:url value="/amquestions/test/testquestion" />">
            過去の午前試験の問題が試験形式で出題されます。 出題時期を決めれば、その時期の午前試験が出題されます。<br />
            また、20問、40問、60問、80問、と問題数を指定する事も出来ます。<br />
            この形式は、ユーザー登録しないと利用できません。<br />

            <div class="border p-2 mt-3 w-50 mx-auto">
            <div class="form-group">
                    <label for="qyear">出題時期</label>
                    <input type="text" name="select_year" autocomplete="on" list="years" class="form-control">
            <c:import url="../amquestions/yearlist.jsp" />
            </div>

            <input type="radio" name="select_season" value="春期" checked="checked">春期
            <input type="radio" name="select_season" value="秋期" id="autum">秋期
            <input type="hidden" name="list_number" value="-1">
            <br />
            <label for="qyear">出題数を指定</label>
            <select id="numbers" name="select_number">
                <option value="20">20問
                <option value="40">40問
                <option value="60">60問
                <option value="80">80問
            </select>
            <div >
                <button type="submit" class="btn btn-primary ">試験問題を解く</button>
            </div>
            </div>

            <br />
        </form>
        </div>
        <br /><br />

            <c:if test="${sessionScope.login_user != null && login_user.admin_flag == 1}">
                <a class="btn btn-warning pl-1 pr-1" href="<c:url value="/amquestions/manager/index" />">問題の管理画面へ(管理者用)</a>&nbsp;
                <a class="btn btn-warning pl-1 pr-1" href="<c:url value="/user/index" />">登録ユーザーの管理画面へ(管理者用)</a>
            </c:if>
        </div>
    </c:param>
</c:import>
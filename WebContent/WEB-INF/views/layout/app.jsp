<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja" class="h-100">
    <head>
        <meta charset="UTF-8">
        <title>基本情報技術者試験 午前問題 過去問学習サイト</title>
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">
        <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
    </head>
    <body class="d-flex flex-column h-100 bodyback" >
        <header>
        <div class="d-inline-flex w-100 text-white bg-dark pt-2 pb-2 container-fluid">
            <div class="w-100 row">
            <div class="d-flex col-sm-4 " id="pagename">
            <h1 class="navbar-brand ">基本情報技術者試験 午前問題 過去問学習サイト</h1></div>
                <div class="d-flex col-sm-3 " id="pagename">
                    ${param.pagename}
                </div>

            <div class="d-flex text-white col-sm-5 justify-content-end">
                <div class="row">
                <c:choose>
                    <c:when test="${sessionScope.login_user != null}">
                            <div class="pt-2 col-md-auto">
                            ログイン中のユーザー名:
                            <c:out
                            value="${sessionScope.login_user.user_name}" />&nbsp;&nbsp;
                            </div>

                            <!-- ログイン中のメニューの表示 -->
                            <div class="dropdown col">
                            <button
                                class="font-weight-bold btn btn-success dropdown-toggle p-auto"
                                type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">メニュー</button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <!-- 試験形式のみ誤ってクリックして戻らないように、トップページへ戻るかどうか確認する -->
                                <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/' />" onClick="return confirmMessage('解答中ですが移動しますか？')">トップページ</a>
                                <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/mypage/top' />" onClick="return confirmMessage('解答中ですが移動しますか？')">マイページ</a>
                                <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/logout' />" onClick="return confirmMessage('解答中ですがログアウトしますか？')">ログアウト</a>
                            </div>
                            </div>

<%--                             <a href="<c:url value='/mypage/top' />">マイページ&nbsp;&nbsp;</a> --%>
<%--                             <a href="<c:url value='/logout' />" --%>
<!--                             class="btn btn-primary mt-n2">ログアウト</a>&nbsp; -->
                    </c:when>
                    <c:otherwise>
                        <!-- ログインしてない状態のメニューの表示 -->
                        <div class="dropdown col-5">
                            <button
                                class="font-weight-bold btn btn-success dropdown-toggle pl-5 pr-5"
                                type="button" id="dropdownMenuButton" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">メニュー</button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/' />">トップページ</a>
                                <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/login' />">ログイン</a>
                            </div>
                        </div>

                        <!-- <p><a href="<c:url value='/login' /> " class="btn btn-primary mt-n2 mb-n2">ログイン</a>&nbsp;</p> -->
                    </c:otherwise>
                </c:choose>
               </div>
            </div>

<!--             <div class="dropdown"> -->
<!--                 <button class="font-weight-bold btn btn-success dropdown-toggle pl-5 pr-5" type="button" -->
<!--                     id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" -->
<!--                     aria-expanded="false">メニュー</button> -->
<!--                 <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"> -->
<%--                     <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/' />">トップページ</a> --%>
<!--                     <a class="dropdown-item font-weight-bold text-success" href="#">利用方法</a> -->
<%--                     <a class="dropdown-item font-weight-bold text-success" href="<c:url value='/login' />">ログイン</a> --%>
<!--                 </div> -->
<!--             </div> -->
            </div>
        </div>

    </header>

        <main role="main" >
                <div class="wrapper">
                <div class="">
                <c:if test="${flush != null}">
                    <div id="flush_success" class="pl-1 pr-1 rounded fadein">
                        <c:out value="${flush}"></c:out>
                    </div>
                </c:if>
                <div class="container">
                    ${param.content}
                </div>
                </div>
                <footer >
                </footer>
                </div>
        </main>

        <script>
        function confirmMessage(message){
            console.log("message refference true!");
        }
        </script>

    </body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ja" class="h-100">
    <head>
        <meta charset="UTF-8">
        <title>IPA資格 自習支援アプリケーション</title>
        <link rel="stylesheet" href="<c:url value='/css/style.css' />">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/sticky-footer-navbar/">
        <link href="../assets/dist/css/bootstrap.css" rel="stylesheet">

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
    </head>
    <body class="d-flex flex-column h-100 bodyback" >
        <header>
            <div class="d-inline-flex text-white fixed-top bg-dark pt-2 pb-2 pl-2">
                    <h1 class="navbar-brand ">IPA資格 自習支援アプリケーション</h1>
                    <div class="d-inline-flex" id="pagename">
                        ${param.pagename}
                    </div>

                    <div class="d-inline-flex ml-auto text-white mt-2">
                        <c:choose>
                        <c:when test="${sessionScope.login_user != null}">
                            ログイン中のユーザー名:
                            <c:out value="${sessionScope.login_user.user_name}" />&nbsp;&nbsp;
                            <a href="<c:url value='/mypage/top' />">マイページ&nbsp;&nbsp;</a>
                            <a href="<c:url value='/logout' />" class="btn btn-primary mt-n2 mb-2">ログアウト</a>&nbsp;
                        </c:when>
                        <c:otherwise>
                            <p><a href="<c:url value='/login' /> " class="btn btn-primary mt-n2 mb-n2">ログイン</a>&nbsp;</p>
                        </c:otherwise>
                        </c:choose>
                    </div>
            </div>

        </header>

        <main role="main">
            <div class="container" id="content">
                ${param.content}
            </div>
        </main>
             <!--
            <footer class="footer mt-auto py-3">
                <div class="container">

                </div>
            </footer> -->
    </body>

</html>
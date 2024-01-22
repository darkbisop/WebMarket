<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        a:hover {
            color: black;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
<c:if test="${member != null or kakaoMember != null or googleMember != null}">
    <c:choose>
        <c:when test="${googleMember != null}">
            <a id="gnb_googleLogout_button">Logout</a>
        </c:when>
        <c:when test="${kakaoMember != null}">
            <a id="gnb_kakaoLogout_button">Logout</a>
        </c:when>
        <c:when test="${member != null}">
            <a id="gnb_logout_button">Logout</a>
        </c:when>
    </c:choose>
</c:if>

<script type="text/javascript">
    $("#gnb_logout_button").click(function() {
        $.ajax({
            type: "post",
            async:false,
            url: "<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/member/logout.do",
            success:function () {
                alert("로그아웃에 성공하였습니다");
               window.location.href = "<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/index";
            }
        });
    });

    $("#gnb_kakaoLogout_button").click(function () {
        location.href="https://kauth.kakao.com/oauth/logout?client_id=27455cf079b38009ee0184c422408895&logout_redirect_uri=http://darkbisop.cafe24.com/ProjectWebMarket/kakao/kakaoLogout";
        $.ajax({
            type: "post",
            async:false,
            url: "<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/kakao/kakaoLogout",
            success:function () {
                window.location.href = "<%--${pageContext.request.contextPath}/index--%>https://darkbisop.github.io/WebMarket";
            }
        });
    });

    $("#gnb_googleLogout_button").click(function () {
        location.href="https://accounts.google.com/logout";
        $.ajax({
            type: "post",
            async:false,
            url: "<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/google/googleLogout",
            success:function () {
                window.location.href = "<%--${pageContext.request.contextPath}/index--%>https://darkbisop.github.io/WebMarket/";
            }
        });
    });
</script>
</body>
</html>

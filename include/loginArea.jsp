<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        a:link { color: red; text-decoration: none;}
        a:visited { color: black; text-decoration: none;}
        a:hover { color: blue; text-decoration: none;}
    </style>
</head>
<body>
<a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/shop/cartList">
    <!-- 로그인 하지 않았을때 -->
    <c:if test="${member == null and kakaoMember == null and googleMember == null}">
        <div class="login_button"><a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/member/login">Login</a></div>
        <span><a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/member/signUp">SignUp</a></span>
    </c:if>

    <!-- 로그인 했을때 -->
    <c:choose>
        <c:when test="${member != null}">
            <div class="login_success_area">
                <span><spring:message code="message.view.userName" /> : ${member.memberName}</span><br/>
            </div>
        </c:when>
        <c:when test="${kakaoMember != null}">
            <div class="login_success_area">
                <span><spring:message code="message.view.userName" /> : ${kakaoMember}</span>
            </div>
        </c:when>
        <c:when test="${googleMember != null}">
            <div class="login_success_area">
                <span><spring:message code="message.view.userName" /> : ${googleMember}</span>
            </div>
        </c:when>
    </c:choose>

    <c:if test="${member != null or kakaoMember != null or googleMember != null}">
        <img src="<%--${pageContext.request.contextPath}/resources/lighting--%>https://darkbisop.github.io/WebMarket/images/cartImg.png" alt="" width="30px" height="30px"> :
        <span id="message"><fmt:formatNumber pattern="###,###,###" value="${total}"/> (${stock})</span>
        <a id="All_Delete_Btn">Empty</a>
    </c:if>
</a>

<script>
    function resetTotal() {
        let resetTotal = "";
        resetTotal += "<span>" + 0 + " " + "(" + 0 + ")" + "</span>";
        $("#message").html(resetTotal);
    }

    $("#All_Delete_Btn").click(function() {
        if (confirm("상품을 모두 삭제하시겠습니까?")) {
            $.ajax({
                url : "<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/shop/view/deleteAllCart",
                type : "post",
                success : function (result) {
                    if (result === 1) {
                        alert("모든 상품을 삭제하였습니다");
                        resetTotal();
                    } else if (result === 2) {
                        alert("상품이 존재 하지 않습니다.");
                    }
                },
                error : function () {
                    alert("삭제 하는데 실패하였습니다.")
                }
            });
        }
    });
</script>
</body>
</html>

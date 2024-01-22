<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/resources/dist/css/adminlte.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/js/RSA/jsbn.js"></script>
    <script type="text/javascript" src="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/js/RSA/rsa.js"></script>
    <script type="text/javascript" src="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/js/RSA/prng4.js"></script>
    <script type="text/javascript" src="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/js/RSA/rng.js"></script>
</head>
<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <b>Admin</b>LTE</a>
        </div>
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form action="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/member/login.do" method="post" id="loginForm">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-text">
                                <span class="fa fa-user"></span>
                            </div>
                        </div>
                        <input type="text" id="memberId" name="memberId" class="form-control" placeholder="ID" required autofocus>
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                        <input type="password" id="memberPw" name="memberPw" class="form-control" placeholder="Password" required>
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember">
                                <label for="remember">Remember Me</label>
                            </div>
                        </div>
                        <div class="col-4">
                            <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                    </div>
                </form>

                <div class="social-auth-links text-center mb-3">
                    <p>- OR -</p>
                    <p><a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/google/googleLogin">
                        <img src="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/dist/img/btn_google_signin_dark_normal_web.png"  alt=""/>
                    </a></p>
                    <a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/kakao/kakaoLogin">
                        <img src="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/dist/img/kakao_login_medium_narrow.png"  alt=""/>
                    </a>
                </div>

                <p class="mb-1">
                    <a href="#">I forgot my password</a>
                </p>
                <p class="mb-0">
                    <a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/member/signUp" class="text-center">Register a new membership</a>
                </p>
            </div>
        </div>
    </div>

    <!-- 실제 서버로 전송되는 form -->
    <form action="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/member/login.do" method="post" id="hiddenForm">
        <input type="hidden" name="memberId" />
        <input type="hidden" name="memberPw" />
    </form>

    <!-- 유저 입력 form의 submit event 재정의 -->
    <script>
        const $email = $("#hiddenForm input[name='memberId']");
        const $password = $("#hiddenForm input[name='memberPw']");

        // Server로부터 받은 공개키 입력
        const rsa = new RSAKey();
        rsa.setPublic("${modulus}", "${exponent}");

        $("#loginForm").submit(function(e) {
            // 실제 유저 입력 form은 event 취소
            // javascript가 작동되지 않는 환경에서는 유저 입력 form이 submit 됨
            // -> Server 측에서 검증되므로 로그인 불가
            e.preventDefault();

            // 아이디/비밀번호 암호화 후 hidden form으로 submit
            const memberId = $(this).find("#memberId").val();
            const memberPw = $(this).find("#memberPw").val();
            $email.val(rsa.encrypt(memberId)); // 아이디 암호화
            $password.val(rsa.encrypt(memberPw)); // 비밀번호 암호화
            $("#hiddenForm").submit();
        });
    </script>
</body>
</html>
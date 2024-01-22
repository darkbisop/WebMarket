<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/css/member/signUp.css">
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources--%>https://darkbisop.github.io/WebMarket/dist/css/adminlte.min.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">

        let code = "";

        /* 유효성 검사용 변수 */
        let idCheck = false;					// 아이디
        let overlapIdCheck = false;				// 아이디 중복검사
        let pwCheck = false;					// 비번
        let pwConfirmCheck = false;				// 비번 확인
        let pwConfirmCorrectCheck = false; 		// 비번 확인 일치
        let nameCheck = false;					// 이름
        let mailCheck = false;					// 메일
        let mailNumCheck = false;				// 메일 인증번호
        let addrCheck = false;					// 주소

        $(document).ready(function() {
            // 회원가입
            $(".signUp_button").click(function() {
                // 입력값 변수
                const id = $(".id_input").val();
                const pw = $(".pw_input").val();
                const pwCk = $(".pwCheck_input").val();
                const name = $(".user_input").val();
                const mail = $(".mail_input").val();
                const addr = $(".address_input_3").val();

                /* 아이디 유효성 검사 */
                if (id === "") {
                    $(".final_id_check").css("display", "block");
                    idCheck = false;
                } else {
                    $(".final_id_check").css("display", "none");
                    idCheck = true;
                }

                /* 비밀번호 유효성 검사 */
                if (pw === "") {
                    $(".final_pw_check").css("display", "block");
                    pwCheck = false;
                } else {
                    $(".final_pw_check").css("display", "none");
                    pwCheck = true;
                }

                /* 비밀번호 확인 유효성 검사 */
                if (pwCk === "") {
                    $(".final_pwck_check").css("display", "block");
                    pwConfirmCheck = false;
                } else {
                    $(".final_pwck_check").css("display", "none");
                    pwConfirmCheck = true;
                }

                /* 이름 유효성 검사 */
                if (name === "") {
                    $(".final_name_check").css("display", "block");
                    nameCheck = false;
                } else {
                    $(".final_name_check").css("display", "none");
                    nameCheck = true;
                }

                /* 이메일 유효성 검사 */
                if (mail === "") {
                    $(".final_mail_check").css("display", "block");
                    mailCheck = false;
                } else {
                    $(".final_mail_check").css("display", "none");
                    mailCheck = true;
                }

                /* 주소 유효성 검사 */
                if (addr === "") {
                    $(".final_addr_check").css("display", "block");
                    addrCheck = false;
                } else {
                    $(".final_addr_check").css("display", "none");
                    addrCheck = true;
                }

                /* 최종 유효성 검사 */
                if (idCheck && overlapIdCheck && pwCheck && pwConfirmCheck && nameCheck && mailCheck && mailNumCheck && addrCheck) {
                    $("#signUp_form").attr("action", "${pageContext.request.contextPath}/member/signUp")
                    $("#signUp_form").submit();
                    alert("회원이 되신것을 축하 합니다!");
                }

                return false;
            });

            // 아이디 중복 검사
            $(".id_input").on("properties change keyup paste input", function() {
                const memberId = $(".id_input").val();
                const data = {memberId: memberId};

                if (memberId !== "" && memberId.length > 3) {
                    $(".final_id_check").css("display", "none");

                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/member/memberIdCheck",
                        data: data,
                        success : function(result) {
                            if (result !== "fail") {
                                $(".id_input_re_1").css("display", "block");
                                $(".id_input_re_2").css("display", "none");
                                overlapIdCheck = true;
                            } else {
                                $(".id_input_re_2").css("display", "block");
                                $(".id_input_re_1").css("display", "none");
                                overlapIdCheck = false;
                            }
                        }
                    });
                } else if (memberId === "") {
                    $(".final_id_check").css("display", "block");
                    $(".id_input_re_1").css("display", "none");
                    $(".id_input_re_2").css("display", "none");
                }
            });

            $(function() {
                $(".id_input").keyup(function(){
                    const content = $(this).val();
                    //$(this).height(((content.split('\n').length + 1) * 0.5) + 'em');
                    $('#counter').html(content.length + '/20');

                    if (content.length > 20){
                        alert("최대 20자까지 입력 가능합니다.");
                        $(this).val(content.substring(0, 20));
                        $("#counter").html("(20 / 최대 20자)");
                    }
                });
                //$('.id_input').keyup();
            });

            /* 비밀번호 유효성 검사 */
            $(".pw_input").on("properties change keyup paste input", function() {
                const pw = $(".pw_input").val();

                if (pw === "") {
                    $(".final_pw_check").css("display", "block");
                } else {
                    $(".final_pw_check").css("display", "none");
                }
            });

            /* 비밀번호 확인 일치 유효성 검사 */
            $(".pwCheck_input").on("properties change keyup paste input", function() {
                const pw = $(".pw_input").val();
                const pwck = $(".pwCheck_input").val();

                if (pwck === "") {
                    $(".final_pwCheck_check").css("display", "block");
                    $(".pwCheck_input_re_2").css("display", "none");
                } else {
                    $(".final_pwCheck_check").css("display", "none");

                    if (pw === pwck) {
                        $(".pwCheck_input_re_1").css("display", "block");
                        $(".pwCheck_input_re_2").css("display", "none");
                        pwConfirmCorrectCheck = true;
                    } else {
                        $(".pwCheck_input_re_2").css("display", "block");
                        $(".pwCheck_input_re_1").css("display", "none");
                        pwConfirmCorrectCheck = false;
                    }
                }
            });

            /* 이름 유효성 검사 */
            $(".user_input").on("properties change keyup paste input", function() {
                const name = $(".user_input").val();

                if (name === "") {
                    $(".final_name_check").css("display", "block");
                } else {
                    $(".final_name_check").css("display", "none");
                }
            });

            /* 이메일 유효성 검사 */
            $(".mail_input").on("properties change keyup paste input", function() {
                const mail = $(".mail_input").val();


                if (mail === "") {
                    $(".final_mail_check").css("display", "block");
                } else {
                    $(".final_mail_check").css("display", "none");
                }
            });

            /* 이메일 인증번호 전송 */
            $(".mail_check_button").click(function() {
                const email = $(".mail_input").val();
                const checkBox = $(".mail_check_input");
                const boxWrap = $(".mail_check_input_box");
                const warnMsg = $(".mail_input_box_warn");

                if (mailFormCheck(email)) {
                    warnMsg.html("인증번호 전송이 완료 되었습니다. 이메일을 확인해주세요.");
                    warnMsg.css("font-size", "11px");
                    warnMsg.css("display", "block");
                    warnMsg.css("color", "grey");
                } else {
                    warnMsg.html("올바르지 못한 이메일 형식 입니다.");
                    warnMsg.css("display", "block");
                    warnMsg.css("color", "red");
                    warnMsg.css("font-size", "11px");
                    return false;
                }

                $.ajax({
                    type: "get",
                    url: "${pageContext.request.contextPath}/member/mailCheck?email=" + email,
                    success: function(data) {
                        checkBox.attr("disabled", false);
                        boxWrap.attr("id", "mail_check_input_box_true");
                        code = data;
                    }
                })
            });

            /* 인증번호 비교 */
            $(".mail_check_input").blur(function() {
                const inputCode = $(".mail_check_input").val();
                const checkResult = $("#mail_check_input_box_warn");

                if (inputCode === code) {
                    checkResult.html("인증번호가 일치 합니다");
                    checkResult.attr("class", "correct");
                    mailNumCheck = true;
                } else {
                    checkResult.html("인증번호를 다시 확인해주세요");
                    checkResult.attr("class", "incorrect");
                    mailNumCheck = false;
                }
            })

            /* 주소 유효성 검사 */
            $(".address_input_3").on("properties change keyup paste input", function() {
                const addr = $(".address_input_3").val();

                if (addr === "") {
                    $(".final_addr_check").css("display", "block");
                } else {
                    $(".final_addr_check").css("display", "none");
                }
            });

        });

        /* 입력 이메일 형식 유효성 검사 */
        function mailFormCheck(email) {
            let form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

            return form.test(email);
        }

        /* API 주소 연동 */
        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    let addr = ''; 			// 주소변수
                    let extraAddr = '';		// 참고항목 변수

                    // 사용자가 선택한 주소 타입에 따라 해당 주소값을 가져온다.
                    if (data.userSelectedType === 'R') {		// 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else {		// 사용자가 지번 주소를 선택했을 경우
                        addr = data.jibunAddrss;
                    }

                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }

                        // 주소변수 문자열과 참고항목 문자열 합치기
                        addr += extraAddr;

                    } else {
                        addr += ' ';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    $(".address_input_1").val(data.zonecode);
                    $(".address_input_2").val(addr);
                    // 커서를 상세주소 필드로 이동한다.
                    $(".address_input_3").attr("readonly", false);
                    $(".address_input_3").focus();
                }
            }).open();
        }
    </script>
</head>
<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">
        <a href="<%--${pageContext.request.contextPath}/index--%>https://darkbisop.github.io/WebMarket/"><b>Admin</b>LTE</a>
    </div>

    <div class="card">
        <div class="card-body register-card-body">
            <p class="login-box-msg">Register a new membership</p>

            <form id="signUp_form" method="post">
                <!-- 아이디 -->
                <span style="color:#aaa" id="counter">(0 / 최대 20자)</span>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fa fa-user"></span>
                        </div>
                    </div>
                    <input type="text" name="memberId" class="form-control id_input" placeholder="ID" required autofocus>
                    <span class="id_input_re_1">This is available to use</span>
                    <span class="id_input_re_2">This is already to exist</span>
                    <span class="final_id_check">Please input your ID</span>
                </div>

                <!-- 비밀번호 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <input type="password" name="memberPw" class="form-control pw_input" placeholder="Password" required autofocus>
                    <span class="final_pw_check">Please input your Password</span>
                </div>

                <!-- 비밀번호 확인 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    <input type="password" class="form-control pwCheck_input" placeholder="Retype password" required autofocus>
                    <span class="final_pwCheck_check">Please input your Password Confirm</span>
                    <span class="pwCheck_input_re_1">correct password confirm</span>
                    <span class="pwCheck_input_re_2">discord password confirm</span>
                </div>

                <!-- 이름 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fas fa-user"></span>
                        </div>
                    </div>
                    <input type="text" name="memberName" class="form-control user_input" placeholder="Full name" required autofocus>
                    <span class="final_name_check">Please input your name</span>
                </div>

                <!-- 이메일 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                    <input type="email" name="memberMail" class="form-control mail_input" placeholder="Email" required autofocus>
                    <div class="input-group-prepend mail_check_button">
                        <button class="btn btn-outline-secondary" type="button">Submit</button>
                    </div>
                    <span class="final_mail_check">Please input your E-mail</span>
                    <span class="mail_input_box_warn"></span>
                </div>

                <!-- 이메일 확인 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fa fa-envelope-open"></span>
                        </div>
                    </div>
                    <div class="mail_check_input_box" id="mail_check_input_box_false">
                    </div>
                    <input class="form-control mail_check_input" placeholder="Confirm Number" disabled="disabled" required autofocus>
                    <span id="mail_check_input_box_warn"></span>
                </div>

                <!-- 주소1 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fa fa-home"></span>
                        </div>
                    </div>
                    <input type="text" class="form-control address_input_1" name="memberAddr1" placeholder="Address1" readonly="readonly" required autofocus>
                    <div class="input-group-prepend address_button" onclick="searchAddress()">
                        <button class="btn btn-outline-secondary" type="button">Find Addr</button>
                    </div>
                </div>

                <!-- 주소2 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fa fa-home"></span>
                        </div>
                    </div>
                    <input type="text" class="form-control address_input_2" name="memberAddr2" placeholder="Address2" readonly="readonly" required autofocus>
                </div>

                <!-- 주소3 -->
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <div class="input-group-text">
                            <span class="fa fa-home"></span>
                        </div>
                    </div>
                    <input type="text" class="form-control address_input_3" name="memberAddr3" placeholder="Address3" readonly="readonly" required autofocus>
                    <span class="final_addr_check">Please input your address</span>
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                            <input type="checkbox" id="agreeTerms" name="terms" value="agree">
                            <label for="agreeTerms">
                                I agree to the <a href="#">terms</a>
                            </label>
                        </div>
                    </div>
                    <!-- /.col -->
                    <div class="col-4">
                        <button type="button" class="btn btn-primary btn-block signUp_button">Register</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p>- OR -</p>
                <a href="#" class="btn btn-block btn-primary">
                    <i class="fab fa-facebook mr-2"></i>
                    Sign up using Facebook
                </a>
                <a href="#" class="btn btn-block btn-danger">
                    <i class="fab fa-google-plus mr-2"></i>
                    Sign up using Google+
                </a>
            </div>

            <a href="${pageContext.request.contextPath}/member/login" class="text-center">I already have a membership</a>
        </div>
        <!-- /.form-box -->
    </div><!-- /.card -->
</div>
</body>
<script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/dist/js/adminlte.min.js"></script>
</html>
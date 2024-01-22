<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header.jsp"%>
    <%@ include file="../include/replyStyle.jsp"%>
    <link href="<%--${pageContext.request.contextPath}/resources/lighting--%>https://darkbisop.github.io/WebMarket/css/form.css" rel="stylesheet" type="text/css" media="all" />
    <link rel="stylesheet" href="<%--${pageContext.request.contextPath}/resources/lighting--%>https://darkbisop.github.io/WebMarket/css/flexslider.css" type="text/css" media="screen" />
    <script>
        function replyList() {
            const productNum = ${view.productNum};
            $.getJSON("<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/shop/view/replyList?n=" + productNum, function (data) {
                let str = "";
                $(data).each(function () {
                    console.log(data);
                    let replyDate = new Date(this.replyDate);
                    replyDate = replyDate.toLocaleDateString("ko-US");
                    str += "<li data-replyNum='" + this.replyNum + "'>"
                        + "<div class='userInfo'>"
                        + "<span class='userName'>" + this.memberId + "</span>"
                        + "<span class='date'>" + replyDate + "</span>"
                        + "</div>"
                        + "<div class='replyContent'>" + this.replyContent + "</div>"
                        + "<c:if test="${member != null or googleMember != null or kakaoMember != null}">"
                        + "<div class='replyFooter'>"
                        + "<button type='button' class='update' data-replyNum='" + this.replyNum + "'>수정</button>"
                        + "<button type='button' class='delete' data-replyNum='" + this.replyNum + "'>삭제</button>"
                        + "</div>"
                        + "</c:if>"
                        + "</li>"
                });
                $("section.replyList ol").html(str);
            });
        }
    </script>
</head>
<body>
<!--header-->
<div class="header-top">
    <div class="header-bottom">
        <div class="logo">
            <h1><a href="<%--${pageContext.request.contextPath}/index--%>https://darkbisop.github.io/WebMarket/">Lighting</a></h1>
        </div>
        <!---->
        <div class="top-nav">
            <%@include file="../include/aside.jsp"%>
        </div>
        <!---->
        <div class="lang-box">
            <a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/shop/view?n=${view.productNum}&lang=ko" style="color:red;">한국어</a> /
            <a href="<%--${pageContext.request.contextPath}--%>https://darkbisop.github.io/WebMarket/shop/view?n=${view.productNum}&lang=ja" style="color:red;">日本語</a>
        </div>
        <div class="cart box_1">
            <%@include file="../include/loginArea.jsp"%>
            <script>
                function calcTotal(total, stock) {
                    let calcTotal = "";
                    calcTotal += "<span>" + total + " " + "(" + stock + ")" + "</span>";
                    $("#message").html(calcTotal);
                }
            </script>
            <p></p>
            <%@include file="../include/logOut.jsp"%>
            <div class="clearfix"> </div>
        </div>
        <div class="clearfix"> </div>
        <!---->
    </div>
    <div class="clearfix"> </div>
</div>
<!--header//-->
<div class="product">
    <div class="container">
        <form role="form" method="post">
            <input type="hidden" name="productNum" value="${view.productNum}">
            <input type="hidden" class="productName" value="${view.productName}">
            <input type="hidden" class="productPrice" value="${view.productPrice}">
            <input type="hidden" class="productThumbnail" value="${view.productThumbnail}">
            <input type="hidden" class="sale" value="${view.sale}">
        </form>
        <div class="product-price1">
            <div class="top-sing">
                <div class="col-md-7 single-top">
                    <div class="productImage">
                        <ul class="slides">
                            <li data-thumb="${view.productImage}">
                                <div class="thumb-image"> <img src="/ProjectWebMarket/resources${view.productImage}" data-imagezoom="true" <%--class="img-responsive"--%> alt=""/> </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-5 single-top-in simpleCart_shelfItem">
                    <div class="single-para langProduct">
                        <h4 class="productName">${view.productName}</h4>
                        <h4 class=""><del>${view.productPrice}원</del> [${view.sale}% Off]</h4>
                        <h5>
                            <fmt:formatNumber value="${view.productPrice - view.productPrice * (view.sale * 0.01)}" pattern="###,###,###" />원
                        </h5>
                        <p class="productDescription">${view.productDescription}</p>
                        <script>
                            if (window.location.href.indexOf("lang=ko") > -1) {
                                let str = "";
                                str += "<h4>${view.productName}</h4>"
                                    + "<h4>" + "<del>" + ${view.productPrice} + "원" + "</del>" + " " + "[" + ${view.sale} + "% Off]" + "</h4>"
                                    + "<h5>" +
                                    "<fmt:formatNumber value="${view.productPrice - view.productPrice * (view.sale * 0.01)}" pattern="###,###,###" />원"
                                    + "</h5>"
                                    + "<p>${view.productDescription}</p>";
                                $(".langProduct").html(str);
                            } else  if (window.location.href.indexOf("lang=ja") > -1) {
                                let str = "";
                                str += "<h4>${view.productName_ja}</h4>"
                                    + "<h4>" + "<del>" + ${view.productPrice_ja} + "円" + "</del>" + " " + "[" + ${view.sale} + "% Off]" + "</h4>"
                                    + "<h5>" +
                                    "<fmt:formatNumber value="${view.productPrice_ja - view.productPrice_ja * (view.sale * 0.01)}" pattern="###,###,###" />円"
                                    + "</h5>"
                                    + "<p>${view.productDescription_ja}</p>";
                                $(".langProduct").html(str);
                            }
                        </script>

                        <div class="prdt-info-grid">
                            <ul>
                                <li class="categoryName">- <span><spring:message code="message.admin.category.1" /> : </span>${view.categoryName}</li>
                                <li class="productStock">- <span><spring:message code="message.view.ProductStock" /> : </span>${view.productStock}EA</li>
                                <li class="cartStock">- <span><spring:message code="message.view.ProductBuyNum" /> : </span>
                                    <input type="number" class="inputStock" min="1" maxlength="${view.productStock}" value="1" />
                                </li>
                            </ul>
                        </div>
                        <p class="addToCart">
                            <button type="button" class="addCart_btn add-cart item_add">ADD TO CART</button>
                            <script>
                                $(".addCart_btn").click(function () {
                                    const productNum = $("#productNum").val();
                                    const productName = $(".productName").val();
                                    const productPrice = $(".productPrice").val();
                                    const productThumbnail = $(".productThumbnail").val();
                                    const cartStock = $(".inputStock").val();
                                    const sale = $(".sale").val();
                                    const data = {
                                        productNum : productNum,
                                        productName : productName,
                                        productPrice : productPrice,
                                        productThumbnail : productThumbnail,
                                        cartStock : cartStock,
                                        sale : sale
                                    };
                                    console.log(data);
                                    $.ajax({
                                        url : "${pageContext.request.contextPath}/shop/view/addCart?pN=" + productName,
                                        type : "post",
                                        data : data,
                                        success : function (retVal) {
                                            if (retVal.result === 1) {
                                                alert("장바구니에 담았습니다.");
                                                $(".inputStock").val();
                                                calcTotal(retVal.total, retVal.stock);
                                                window.location.load();
                                            } else {
                                                alert("회원만 사용할 수 있습니다.")
                                            }
                                        },
                                        error : function () {
                                            alert("장바구니에 담는데 실패하였습니다.")
                                        }
                                    });
                                });
                            </script>
                        </p>
                        <br>
                        <hr>
                        <div id="reply">
                            <c:if test="${member == null and kakaoMember == null and googleMember == null}">
                                <p><spring:message code="message.view.Comment.1" /> <a href="${pageContext.request.contextPath}/member/login"><spring:message code="message.view.Comment.2" /></a><spring:message code="message.view.Comment.3" /></p>
                            </c:if>

                            <c:if test="${member != null or kakaoMember != null or googleMember != null}">
                                <section class="replyForm">
                                    <form role="form" method="post" autocomplete="off">
                                        <input type="hidden" id="productNum" name="productNum" value="${view.productNum}">
                                        <div class="input_area">
                                            <textarea name="replyContent" id="replyContent"></textarea>
                                        </div>

                                        <div class="input_area">
                                            <button type="button" id="reply_btn"><spring:message code="message.view.Comment.4" /></button>

                                            <script>
                                                $("#reply_btn").click (function () {
                                                    const productNum = $("#productNum").val();
                                                    const replyContent = $("#replyContent").val();
                                                    const replyConfirm = confirm("등록하시겠습니까?");
                                                    const data = {
                                                        productNum : productNum,
                                                        replyContent : replyContent
                                                    };
                                                    if (replyConfirm) {
                                                        if (replyContent !== "") {
                                                            $.ajax({
                                                                url : "${pageContext.request.contextPath}/shop/view/registReply",
                                                                type : "post",
                                                                data : data,
                                                                success : function () {
                                                                    replyList();
                                                                    $("#replyContent").val("");
                                                                }
                                                            });
                                                        } else {
                                                            alert("공백은 입력할 수 없습니다.");
                                                        }
                                                    }
                                                });
                                            </script>
                                        </div>
                                    </form>
                                </section>
                            </c:if>
                        </div>
                        <section class="replyList">
                            <input type="hidden" id="currMember" name="currLoginId" value="${member.memberId}">
                            <input type="hidden" id="currGoogle" name="currLoginId" value="${googleMember}">
                            <input type="hidden" id="currKakao" name="currLoginId" value="${kakaoMember}">
                            <ol>
                                <%--<c:forEach items="${replyList}" var="reply">
                                    <li>
                                        <div class="userInfo">
                                            <span class="userName">${reply.memberId}</span>
                                            <span class="date"><fmt:formatDate value="${reply.replyDate}" pattern="yyyy-MM-dd" /></span>
                                        </div>
                                        <div class="replyContent">${reply.replyContent}</div>
                                    </li>
                                </c:forEach>--%>

                            </ol>
                            <script>
                                replyList();
                            </script>

                            <script>
                                $(document).on("click", ".update", function(){
                                    let currId;
                                    $("input[name='currLoginId']").each(function () {
                                        if ($(this).val() !== "") {
                                            currId = $(this).val();
                                        }
                                    });
                                    const spanID = $(this).parent().parent().find(".userName").text();
                                    if (currId === spanID) {
                                        $(".replyModal").fadeIn(200);
                                        var replyNum = $(this).attr("data-replyNum");
                                        var replyContent = $(this).parent().parent().children(".replyContent").text();
                                        $(".modal_replyContent").val(replyContent);
                                        $(".modal_update_btn").attr("data-replyNum", replyNum);
                                    } else {
                                        alert("작성자 본인만 수정 가능합니다");
                                    }
                                });
                                $(document).on("click", ".delete", function () {
                                    let deleteConfirm = confirm("정말로 삭제하시겠습니까?");
                                    if (deleteConfirm) {
                                        let data = { replyNum : $(this).attr("data-replyNum")};
                                        $.ajax({
                                            url : "${pageContext.request.contextPath}/shop/view/deleteReply",
                                            type : "post",
                                            data : data,
                                            success : function (result) {
                                                if (result === 1) {
                                                    replyList();
                                                } else {
                                                    alert("작성자 본인만 삭제할 수 있습니다.")
                                                }
                                            },
                                            error : function () {
                                                alert("로그인 후 삭제 가능합니다다");
                                            }
                                        });
                                    }
                                });
                            </script>
                        </section>
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>

        <div class="replyModal">
            <div class="modalContent">
                <div>
                    <textarea class="modal_replyContent" name="modal_replyContent"></textarea>
                </div>

                <div>
                    <button type="button" class="modal_update_btn">수정</button>
                    <button type="button" class="modal_cancel_btn">취소</button>
                </div>
            </div>
            <div class="modalBackground"></div>
        </div>
        <script>
            $(".modal_update_btn").click(function(){
                var modifyConfirm = confirm("정말로 수정하시겠습니까?");
                if(modifyConfirm) {
                    var data = {
                        replyNum : $(this).attr("data-replyNum"),
                        replyContent : $(".modal_replyContent").val()
                    };
                    $.ajax({
                        url : "${pageContext.request.contextPath}/shop/view/updateReply",
                        type : "post",
                        data : data,
                        success : function(result){
                            if(result === 1) {
                                replyList();
                                $(".replyModal").fadeOut(200);
                            } else {
                                alert("작성자 본인만 수정 할 수 있습니다.");
                            }
                        },
                        error : function(){
                            alert("로그인 후 수정 가능합니다.")
                        }
                    });
                }
            });
            $(".modal_cancel_btn").click(function () {
                $(".replyModal").fadeOut(200);
            })
        </script>

        <div class="bottom-prdt">
            <div class="btm-grid-sec">
                <div class="col-md-2 btm-grid">
                    <a href="#">
                        <img src="images/p3.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$1200</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="#">
                        <img src="images/p10.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$700</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p5.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$1300</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p4.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$9000</span></a>
                </div>
                <div class="col-md-2 btm-grid">
                    <a href="product.html">
                        <img src="images/p2.jpg" alt=""/>
                        <h4>Product#1</h4>
                        <span>$450</span></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!---->
<div class="subscribe">
    <div class="container">
        <h3>Newsletter</h3>
        <form>
            <input type="text" class="text" value="Email" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email';}">
            <input type="submit" value="Subscribe">
        </form>
    </div>
</div>
<!---->
<div class="footer">
    <%@ include file="../include/footer.jsp"%>
</div>
<!---->
<div class="copywrite">
    <%@ include file="../include/copywrite.jsp"%>
</div>
<!---->
</body>
</html>
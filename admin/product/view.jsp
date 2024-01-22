<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        .input_Area { margin:10px 0; }
        select { width:80px; }
        label { display:inline-block; width:70px; padding:5px; }
        label[for='productDescription'] { display:block; }
        input { width:150px; }
        textarea#productDescription { width:400px; height:180px; }
        .origImg {width: 200px; height: auto;}
        .thumbImg{width: 100px; height: auto;}
    </style>
</head>
<body>
<div id="container">
    <h2><spring:message code="message.admin.ProductDetailInfo" /></h2>
    <form role="form" action="${pageContext.request.contextPath}/admin/product/view" method="post" autocomplete="off">
        <input type="hidden" name="n" value="${product.productNum}" />
        <label>1<spring:message code="message.admin.category" /></label><span class="result1"></span>
        <label>2<spring:message code="message.admin.category" /></label><span class="result2"></span>
        <label>
            <select id="category1">
                <option value=""><spring:message code="message.admin.category.All" /></option>
            </select>
        </label>

        <label>
            <select id="category2">
                <option value=""><spring:message code="message.admin.category.All" /></option>
            </select>
        </label>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductName" /></label>
            <span>${product.productName}</span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductName" /></label>
            <span>${product.productName_ja}</span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductPrice" /></label>
            <span><fmt:formatNumber value="${product.productPrice}" pattern="###,###,###" /></span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductPrice" /></label>
            <span><fmt:formatNumber value="${product.productPrice_ja}" pattern="###,###,###" /></span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductStocks" /></label>
            <span>${product.productStock}</span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductSales" /></label>
            <span>${product.sale}</span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductDesc" /></label>
            <span>${product.productDescription}</span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductDesc" /></label>
            <span>${product.productDescription_ja}</span>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductImg" /></label>
            <p>Original</p>
            <img src="/ProjectWebMarket/resources${product.productImage}" class="origImg" />

            <p>Thumbnail</p>
            <img src="/ProjectWebMarket/resources${product.productThumbnail}" class="thumbImg"/>
        </div>

        <div class="input_Area">
            <label><spring:message code="message.admin.ProductRegistDate" /></label>
            <span><fmt:formatDate value="${product.regDate}" pattern="yyyy-MM-dd" /></span>
        </div>

        <div class="input_Area">
            <button type="button" class="update_Btn btn-warning"><spring:message code="message.admin.ProductUpdateBtn" /></button>
            <button type="button" class="delete_Btn btn-danger"><spring:message code="message.admin.ProductDeleteBtn" /></button>
        </div>
    </form>
</div>

<script>
    const jsonData = JSON.parse('${category}');
    console.log(jsonData);

    let cate1Arr = [];
    let cate1Obj = {};

    for (let i = 0; i < jsonData.length; i ++) {
        if (jsonData[i].depth === 1) {
            cate1Obj = {};
            cate1Obj.categoryCode = jsonData[i].categoryCode;
            cate1Obj.categoryName = jsonData[i].categoryName;
            cate1Arr.push(cate1Obj);
        }
    }

    for (let i = 0; i < cate1Arr.length; i++) {
        $("#category1").append("<option value='" + cate1Arr[i].categoryCode + "'>" + cate1Arr[i].categoryName + "</option>");
    }

    const select_cateCode  = '${product.categoryCode}';
    const select_cateCodeRef = '${product.categoryCodeRef}';
    const select_cateName = '${product.categoryName}';

    if(select_cateCodeRef != null && select_cateCodeRef != '') {
        $("#category1").val(select_cateCodeRef);
        $("#category2").val(select_cateCode);
        $("#category2").children().remove();
        $("#category2").append("<option value='" + select_cateCode + "'>" + select_cateName + "</option>");
    }

    $('.result1').text($("#category1 option:selected").text());
    $('.result2').text($("#category2 option:selected").text());
    document.getElementById("category1").style.display = "none";
    document.getElementById("category2").style.display = "none";

    const formObj = $("form[role='form']");
    $(".update_Btn").click(function() {
        formObj.attr("action", "${pageContext.request.contextPath}/admin/product/update");
        formObj.attr("method", "get");
        formObj.submit();
    });

    $(".delete_Btn").click(function() {
        const con = confirm("정말로 삭제하시겠습니까?");

        if (con === true) {
            formObj.attr("action", "${pageContext.request.contextPath}/admin/product/delete");
            formObj.submit();
            alert("게시글을 삭제하였습니다.");
        }
    });

</script>
</body>
</html>

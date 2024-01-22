<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
<c:if test="${member != null or kakaoMember != null or googleMember != null}">
    <a id="All_Delete_Btn">Empty Cart</a>
</c:if>

<script>
    function calcTotal() {
        let calcTotal = "";
        calcTotal += "<span>" + " : " + "" + " " + "(" + "" + ")" + "</span>";
        $("#message").html(calcTotal);
    }

    $("#All_Delete_Btn").click(function() {
        if (confirm("상품을 모두 삭제하시겠습니까?")) {
            $.ajax({
                url : "${pageContext.request.contextPath}/shop/view/deleteAllCart",
                type : "post",
                success : function (result) {
                    if (result === 1) {
                        alert("모든 상품을 삭제하였습니다");
                        let calcTotal = "";
                        calcTotal += "<span>" + " : " + "" + " " + "(" + "" + ")" + "</span>";
                        $("#message").html(calcTotal);
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

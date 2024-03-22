<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Exchange Data</title>
</head>
<body>
    <h1>Exchange Data</h1>
    <table border="1">
        <thead>
            <tr>
            <%-- <c:if test="${loop.index + 1 == 7 || loop.index + 1 == 13 || loop.index + 1 == 14 || loop.index + 1 == 22 || loop.index + 1 == 23}"> --%>
                <th>번호</th>
                <th>통화 단위</th>
                <th>통화 이름</th>
                <!-- 
                <th>ttb</th>
                <th>tts</th>
                 -->
                <th>환율</th>
                <!-- 
                <th>bkpr</th>
                <th>yy_efee_r</th>
                <th>ten_dd_efee_r</th>
                <th>kftc_deal_bas_r</th>
                <th>kftc_bkpr</th>
                 -->
            <%-- </c:if>      --%>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${exchangeData}" var="data" varStatus="loop">
                <tr>
                 <%-- <c:if test="${loop.index + 1 == 7 || loop.index + 1 == 13 || loop.index + 1 == 14 || loop.index + 1 == 22 || loop.index + 1 == 23}"> --%>
                    <td>${loop.index+1}</td>
                    <td>${data.cur_unit}</td>	<!-- 통화 단위 -->
                    <td>${data.cur_nm}</td>		<!-- 통화 이름 -->
                    <%-- 
                    <td>${data.ttb}</td>		<!-- 전신환 매입 기준율 -->
                    <td>${data.tts}</td>		<!-- 전신환 매도 기준율 -->
                     --%>
                    <td>${data.deal_bas_r}</td>	<!-- 매매기준율 -->
                    <%-- 
                    <td>${data.bkpr}</td>		<!-- 전일대비 환율 변동값 -->
                    <td>${data.yy_efee_r}</td>	<!-- 연환율 -->
                    <td>${data.ten_dd_efee_r}</td>	<!-- 일환율 -->
                    <td>${data.kftc_deal_bas_r}</td><!-- 고시회차 매매기준율 -->	
                    <td>${data.kftc_bkpr}</td>	<!-- 고시회차 전일대비 환율 변동값 -->
                     --%>	
               <%--  </c:if> --%>      
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>

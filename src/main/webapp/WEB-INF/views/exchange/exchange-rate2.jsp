<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>오늘의 환율</title>
    <style>
    table {
    	text-align:center;
		width: 500px;
    }
    </style>
</head>
<body>
    <h1 style="padding-left:120px;">${date} 환율표</h1>
    <p style="margin-left: 338px;"><a href="https://www.koreaexim.go.kr/wg/HPHKWG057M01" onclick="window.open(this.href, '_blank', 'location=no'); return false;" style="text-align:right;"> 출처 : 한국수출입은행 </a></p>
    <table>
        <thead style="background:#E3E4E5;">
            <tr>
                <th>통화 단위</th>
                <th>통화 이름</th>
                <!-- 
                <th>ttb</th>
                <th>tts</th>
                 -->
                <th>매매기준율</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${exchangeData}" var="data" varStatus="loop">
                 <c:if test="${ loop.index + 1 == 13 || loop.index + 1 == 14 || loop.index + 1 == 23}">
                <tr>
                    <td style="background:#ccc;">${data.cur_unit}</td>	<!-- 통화 단위 -->
                    <td>${data.cur_nm}</td>		<!-- 통화 이름 -->
                    <td>${data.deal_bas_r}</td>	<!-- 매매기준율 -->
               </c:if>      
                </tr>
            </c:forEach>
            
            <%-- ${unit} --%>
              <c:forEach items="${exchangeData}" var="data" varStatus="loop">
					 <%-- <c:if test="${unit eq yen}">		<!-- 엔화 --> --%>
						 <c:if test="${ loop.index + 1 == 13}">		<!-- 엔화 -->
							<p>${data.deal_bas_r}</p>          
						</c:if>
					<%-- </c:if>		 --%>
<%-- 					<c:if test="${unit eq usd}">		<!-- usd --> --%>
						<c:if test="${ loop.index + 1 == 23}">		<!-- usd -->
							<p>${data.deal_bas_r}</p>          
						</c:if>
					<%-- </c:if>		    	    	 --%>
              </c:forEach>
            
        </tbody>
    </table>
</body>
</html>
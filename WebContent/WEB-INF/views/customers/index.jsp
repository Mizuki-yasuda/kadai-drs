<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
    </head>
    <body>
    <c:import url="/WEB-INF/views/layout/app.jsp">
        <c:param name="content">
            <c:if test="${flush != null}">
                <div id="flush_success">
                    <c:out value="${flush}"></c:out>
                </div>
            </c:if>
            <h2>顧客 一覧</h2>
            <table id="customer_list">
                <tbody>
                  <tr>
                    <th class="customer_name">氏名</th>
                    <th class="customer_date">日付</th>
                    <th class="customer_customer_name">顧客名</th>
                    <th class="customer_action">操作</th>
                 </tr>
                 <c:forEach var="customer" items="${customers}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td class="customer_name"><c:out value="${customer.employee.name}" /></td>
                        <td class="customer_date"><fmt:formatDate value="${customer.customer_date}" pattern='yyyy-MM-dd' /></td>
                        <td class="customer_customer_name">${customer.customer_name}</td>
                        <td class="customer_action"><a href="<c:url value='/customers/show?id=${customer.id}' />">詳細を見る</a></td>
                   </tr>
                 </c:forEach>
                </tbody>
            </table>

            <div id="pagination">
            (全 ${customers_count} 件)<br />
            <c:forEach var="i" begin="1" end="${((customers_count - 1) / 15) + 1}" step="1">
            <c:choose>
            <c:when test="${i == page}">
                <c:out value="${i}" />&nbsp;
            </c:when>
            <c:otherwise>
                <a href="<c:url value='/customers/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
            </c:otherwise>
            </c:choose>
            </c:forEach>

            </div>
            <p><a href="<c:url value='/customers/new' />">新規顧客情報の登録</a></p>
        </c:param>
    </c:import>

    </body>
</html>
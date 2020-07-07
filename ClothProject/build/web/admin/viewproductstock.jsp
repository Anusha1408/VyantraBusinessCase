<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>View All Cloth Stock Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <h1 align="center">${message }</h1>
        <table class="table">
            <tr>
                <th>Stock Id</th>
                <th>Product Name</th>
                <th>Quantity</th>
                <th>Stock Type</th>
                <th>Stock Date</th>

                <th>Delete Record</th>
            </tr>

            <c:choose>
                <c:when test="${prosto!=null }">
                    <c:forEach var="item" items="${prosto }">
                        <c:if test="${item.stockId==param.stkid }">
                            <c:set var="info" value="${item }" scope="page" />
                        </c:if>
                        <tr>
                            <td>${item.stockId }</td>
                            <td>${item.productName }</td>
                            <td>${item.quantity }</td>
                            <td>${item.stockType }</td>
                            <td>${item.stockDate }</td>

                            <td><a onclick="return comfirm('Are You Sure To Delete This Record')" href="deleteProductStock?productid=${item.stockId }">Delete This Record</a></td>;

                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="6" align="center">There is No Data</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
</div>
<%@include file="footer.jsp" %>

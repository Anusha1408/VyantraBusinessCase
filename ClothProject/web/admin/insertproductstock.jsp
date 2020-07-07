<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>Add New Cloth Stock Information</h1>
</div>
<div class="form-group">
    <div class="col-12">
        <form action="insertProductStock" method="post">
            <div class="form-group">
                <label for="productid">Choose Any Cloth</label>
                <select name="productid" class="form-control" id="productid">
                    <option value="">Choose Any Cloth</option>
                    <c:if test="${proinf!=null }">
                        <c:forEach var="item" items="${proinf }">
                            <c:choose>
                                <c:when test="${item.productId==param.productid }">
                                    <option selected="selected" value="${item.productId }">${item.productName }</option>
                                </c:when>
                                <c:otherwise>
                                    <option  value="${item.productId }">${item.productName }</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
            <div class="form-group">
                <label for="quantity">Enter Quantity </label>
                <input type="text" name="quantity" class="form-control" id="quantity" value="${param.quantity } " />
            </div>
            <div class="form-group">
                <label for="stocktype">Choose Stock Type </label>
                <select name="stocktype" id="stocktype" class="form-control">
                    <option value="">Stock Type</option>
                    <option value="yes">YES</option>
                    <option value="no">NO</option>
                </select>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="Add Product Stock" />
            </div>

            
        </form>
        <h1 align="center">${message }</h1>
    </div>
</div>
<%@include file="footer.jsp" %>

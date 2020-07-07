
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>Add New Cloth Photo Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <form action="insertProductPhoto" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="file">Choose Cloth Photo:  </label>
                <input class="form-control" id="file" type="file" name="file" />
            </div>
            <div class="form-group">
                <label for="productid">Choose Cloth  </label>

                <select id="productid" class="form-control" name="productid">
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
                <input type="submit" class="btn btn-primary btn-block" value="Add Cloth Photo" />
            </div>

        </form>
        <h1 align="center">${message }</h1>
    </div>
</div>
<%@include file="footer.jsp" %>

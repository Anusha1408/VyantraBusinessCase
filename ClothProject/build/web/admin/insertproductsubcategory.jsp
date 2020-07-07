<%@page import="javax.servlet.descriptor.TaglibDescriptor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>Add New Product Sub Category Information</h1>
</div>
<div class="row">
    <div class="col-12">

        <form action="insertProductSubCategory" method="post">
            <div class="form-group">
                <label for="subcategoryname">Enter SubCategory Name </label>
               <input class="form-control" type="text" name="subcategoryname" value="${param.subcategoryname } " />
            </div>
            <div class="form-group">
                <label for="description">Enter Description </label>
                <textarea class="form-control" id="description" name="description">${param.description }</textarea>
            </div>
            <div class="form-group">
                <label for="categoryid">Choose Category </label>

                <select class="form-control" id="categoryid" name="categoryid">
                    <option value="">Choose Any Category</option>
                    <c:if test="${procatfk!=null }">
                        <c:forEach var="item" items="${procatfk }">
                            <c:choose>
                                <c:when test="${item.categoryId==param.categoryid }">
                                    <option selected="selected" value="${item.categoryId }">${item.categoryName }</option>
                                </c:when>
                                <c:otherwise>
                                    <option  value="${item.categoryId }">${item.categoryName }</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>
                </select>

            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="Add Sub Category" />
            </div>
        </form>
        <h1 align="center">${message }</h1>
    </div>
</div>
<%@include file="footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>View All Cloth Sub Category Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <h1 align="center">${message }</h1>
        <table class="table">
            <tr>
                <th>Sub Category Id</th>
                <th>Sub Category Name</th>
                <th>Description</th>
                <th>Category Name</th>                
                <th>Edit Record</th>
                <th>Delete Record</th>
            </tr>

            <c:choose>
                <c:when test="${prosubcat!=null }">
                    <c:forEach var="item" items="${prosubcat }">
                        <c:if test="${item.subCategoryId==param.subcat }">
                            <c:set var="info" value="${item }" scope="page" />
                        </c:if>
                        <tr>
                            <td>${item.subCategoryId }</td>
                            <td>${item.subCategoryName }</td>
                            <td>${item.description }</td>
                            <td>${item.category.categoryName }</td>
                            
                            <td><a href="viewProductSubCategory?subcat=${item.subCategoryId}">Edit Product Info</a></td>
                            <td><a onclick="return comfirm('Are You Sure To Delete This Record')" href="deleteProductSubCategory?subcategoryid=${item.subCategoryId }">Delete This Record</a></td>

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
        <c:if test="${info!=null }">

            <form action="updateProductSubCategory" method="post">
                <div class="form-group">
                    <label for="subcategoryname">Enter Sub Category Name </label>
                    <input class="form-control" type="text" name="subcategoryname" value="${info.subcategoryname } " />
                    <input type="hidden" name="subcategoryid" value="${info.subcategoryId}"/>
                </div>
                <div class="form-group">
                    <label for="description">Enter Description </label>
                    <textarea class="form-control" id="description" name="description">${info.description }</textarea>
                </div>
                <div class="form-group">
                    <label for="categoryid">Choose Category </label>

                    <select class="form-control" id="categoryid" name="categoryid">
                        <option value="">Choose Any Category</option>
                        <c:if test="${procatfk!=null }">
                            <c:forEach var="item" items="${procatfk }">
                                <c:choose>
                                    <c:when test="${item.categoryId==info.categoryid }">
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
                    <input class="btn btn-primary btn-block" type="submit" value="Update Sub Category Information" />
                </div>

            </form>
        </c:if>
    </div>
</div>
<%@include file="footer.jsp" %>

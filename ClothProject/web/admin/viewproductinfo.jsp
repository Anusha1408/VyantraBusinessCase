<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>View All Cloth Information</h1>
</div>
<div class="row">
    <div class="col-12">

        <h1 align="center">${message }</h1>
        <table class="table">
            <tr>
                <th>Product Name</th>
                <th>Sub Category Name</th>
                <th>Company Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Edit Record</th>
                <th>Delete Record</th>
            </tr>

            <c:choose>
                <c:when test="${proinf!=null }">
                    <c:forEach var="item" items="${proinf }">
                        <c:if test="${item.productId==param.proinfid }">
                            <c:set var="info" value="${item }" scope="page" />

                        </c:if>
                        <tr>
                            <td>${item.productName }</td>
                            <td>${item.subcategory.subCategoryName }</td>
                            <td>${item.company.companyName }</td>
                            <td>${item.price}</td>
                            <td>${item.quantity }</td>
                            <td>${item.description }</td>
                            <td><a href="viewProductInfo?proinfid=${item.productId}">Edit Product Info</a></td>
                            <td><a onclick="return comfirm('Are You Sure To Delete This Record')" href="deleteProductInfo?productid=${item.productId }">Delete This Record</a></td>

                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="7" align="center">There is No Data</td>
                    </tr>
                </c:otherwise>
            </c:choose>


        </table>
    </div>
</div>
<c:if test="${info!=null }">
    <div class="row">
        <div class="col-12">
            <h1>Update Cloth Details</h1>
            <form action="updateProductInfo" method="post">

                <div class="form-group">
                    <label for="productname">Enter Cloth Name </label>
                    <input type="text" placeholder="Cloth Name"
                           id="productname" class="form-control" name="productname" value="${info.productname } " />
                    <input type="hidden" name="productid" value="${info.productId } " />
                </div>

                <div class="form-group">
                    <label for="subcategoryid">Choose Cloth Sub Category:</label>

                    <select name="subcategoryid"  id="subcategoryid" class="form-control">
                        <option value="">Choose Any Cloth Sub Category</option>
                        <c:if test="${prosubcat!=null }">
                            <c:forEach var="item" items="${prosubcat }">
                                <c:choose>
                                    <c:when test="${item.subCategoryId==info.subcategoryid }">
                                        <option selected="selected" value="${item.subCategoryId }">${item.subCategoryName }</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="${item.subCategoryId }">${item.subCategoryName }</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="form-group">
                    <label for="companyid">Choose Company Name </label>

                    <select name="companyid"  id="companyid" class="form-control">
                        <option value="">Choose Company</option>
                        <c:if test="${cominf!=null }">
                            <c:forEach var="item" items="${cominf }">
                                <c:choose>
                                    <c:when test="${item.companyId==info.companyid }">
                                        <option selected="selected" value="${item.companyId }">${item.companyName }</option>
                                    </c:when>
                                    <c:otherwise>
                                        <option  value="${item.companyId }">${item.companyName }</option>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="form-group">
                    <label for="price">Enter Price </label>
                    <input id="price" class="form-control" type="text" name="price" value="${info.price }" />
                </div>
                <div class="form-group">
                    <label for="quantity">Enter Quantity </label>
                    <input id="quantity" class="form-control" type="text" name="quantity" value="${info.quantity }" />
                </div>
                <div class="form-group">
                    <label for="description">Enter Description </label>
                    <textarea id="description" name="description" class="form-control">${info.description }</textarea>
                </div>
                <div class="form-group">
                    <input class="btn btn-primary btn-block" type="submit" value="Update Cloth Info" />
                </div>
            </form>
        </div>
    </div>
</c:if>

<%@include file="footer.jsp" %>

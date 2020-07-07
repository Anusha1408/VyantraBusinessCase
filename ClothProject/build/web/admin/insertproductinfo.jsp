<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="header.jsp" %>
<div class="jumbotron">
    <h1>Add New Cloth Information</h1>
</div>
<div class="row">
    <div class="col-12">
        <form action="insertProductInfo" method="post">

            <div class="form-group">
                 <label for="productname">Enter Cloth Name </label>
                 <input type="text" placeholder="Cloth Name"
                           id="productname" class="form-control" name="productname" value="${param.productname } " />

            </div>

            <div class="form-group">
                <label for="subcategoryid">Choose Cloth Sub Category:</label>
                
                    <select name="subcategoryid"  id="subcategoryid" class="form-control">
                        <option value="">Choose Any Cloth Sub Category</option>
                        <c:if test="${prosubcat!=null }">
                            <c:forEach var="item" items="${prosubcat }">
                                <c:choose>
                                    <c:when test="${item.subCategoryId==param.subcategoryid }">
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
                                    <c:when test="${item.companyId==param.companyid }">
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
                <input id="price" class="form-control" type="text" name="price" value="${param.price } " />
            </div>
            <div class="form-group">
                <label for="quantity">Enter Quantity </label>
                    <input id="quantity" class="form-control" type="text" name="quantity" value="${param.quantity } " />
            </div>
            <div class="form-group">
                <label for="description">Enter Description </label>
                <textarea id="description" name="description" class="form-control">${param.description }</textarea>
            </div>
            <div class="form-group">
                <input class="btn btn-primary btn-block" type="submit" value="Add Cloth Info" />
            </div>
        </form>
        <h1 align="center">${message }</h1>
    </div>
</div>
<%@include file="footer.jsp" %>

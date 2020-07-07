<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    response.setHeader("Cache-Control", "no-cache");//HTTP 1.1 
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0 
    response.setDateHeader("Expires", 0); //prevents caching 
    response.setHeader("Cache-Control", "no-store"); //HTTP 1.1
    if (session.getAttribute("auname") == null) {
        response.sendRedirect("../login.jsp");
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Cloth Store: Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="stylesheet" href="css/bootstrap.css" media="screen">
        <link rel="stylesheet" href="css/custom.min.css">
        
    </head>
    <body>
        <div class="navbar navbar-expand-lg fixed-top navbar-dark bg-primary">
            <div class="container">
                <a href="index.jsp" class="navbar-brand">Cloth Store</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Admin Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Category<span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="download">
                                <a class="dropdown-item" href="insertproductcategory.jsp">Add Cloth Category</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="viewProductCategory">View Cloth Categories</a>
                                
                                <div class="dropdown-divider"></div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Company<span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="download">
                                <a class="dropdown-item" href="insertcompanyinfo.jsp">Add Company</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="viewCompanyInfo">View Companies</a>
                                
                                <div class="dropdown-divider"></div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Sub Category<span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="download">
                                <a class="dropdown-item" href="fetchProductCategoryForProductSubCategory">Add Cloth Sub Category</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="viewProductSubCategory">View Cloth Sub Categories</a>
                                
                                <div class="dropdown-divider"></div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Cloths<span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="download">
                                <a class="dropdown-item" href="fetchCompanyInfoForProductInfo">Add Cloth</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="viewProductInfo">View Cloths</a>
                                
                                <div class="dropdown-divider"></div>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" id="download">Cloth Photo<span class="caret"></span></a>
                            <div class="dropdown-menu" aria-labelledby="download">
                                <a class="dropdown-item" href="fetchProductInfoForProductPhoto">Add Cloth Photo</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="viewproductphoto.jsp">View Cloth Photos</a>
                                
                                <div class="dropdown-divider"></div>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="orders.jsp">All Orders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="signout.jsp">Sign Out</a>
                        </li>
                    </ul>

                </div>
            </div>
        </div>


        <div class="container">

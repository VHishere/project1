<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/cart.css" />
        <style>
            h3,
            h4,
            h5,
            h6,
            button {
                font-family: 'Poppins';
                font-style: normal;
                font-weight: 600;
                font-size: 16px;
                line-height: 24px;
                text-transform: capitalize;
                color: #FFFFFF;
            }
            * {
                box-sizing: border-box;
            }
            input[type="checkbox"] {
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                -webkit-tap-highlight-color: transparent;
                cursor: pointer;
            }

            input[type="checkbox"]:f ocus {
                outline: 0;
            }

            .toggle {
                height: 32px;
                width: 52px;
                border-radius: 16px;
                display: inline-block;
                position: relative;
                margin: 0;
                border: 2px solid #FF9EA2;
                background: #FFFFFF;
                transition: all .2s ease;
            }

            .toggle:after {
                content: '';
                position: absolute;
                top: 2px;
                left: 2px;
                width: 24px;
                height: 24px;
                border-radius: 50%;
                background: #ff5b6a;
                box-shadow: 0 1px 2px rgba(44, 44, 44, .2);
                transition: all .2s cubic-bezier(.5, .1, .75, 1.35);
            }

            .toggle:checked {
                border-color: #ffffff;
                background: #FF9EA2;
            }

            .toggle:checked:after {
                transform: translateX(20px);
            }
        </style>
        <title>Cart</title>
    </head>
    <body style="background-color: #FFEAE3; margin-top: 100px;">
        <form id="updateForm" action="updateproduct" method="post">
            <div class="container px-3 my-5 clearfix">
                <div class="card">
                    <div class="card-header" style="background-color: #FF9EA2;">
                        <h2
                            style="font-family: 'Poppins'; font-weight: revert; color: white; text-align: center;">
                            All Product</h2>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <div class="content" style="margin-bottom: 30px; margin-top: 10px;">
                                <div class="input-group mb-3">
                                    <input name="productID" value="${product.productID}" hidden>
                                    <label for="sel1" class="form-label">Category:</label>
                                    <select class="form-select" id="category" name="category"
                                            style="width: 80px; margin-left: 5px; margin-bottom: 5px;">
                                        <c:forEach items="${listCategory}" var="category">
                                            <c:if test="${category.categoryID==product.categoryID}">
                                                <option value="${category.categoryID}" selected>${category.name}</option>
                                            </c:if>
                                            <c:if test="${category.categoryID!=product.categoryID}">
                                                <option value="${category.categoryID}">${category.name}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-default" style="width:105px;">ImageURL</span>
                                    </div>
                                    <input type="text" class="form-control" name="image" aria-label="Default"
                                           aria-describedby="inputGroup-sizing-default" value="${product.image}">
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-default">Description</span>
                                    </div>
                                    <input type="text" class="form-control" name="description"
                                           aria-label="Default" aria-describedby="inputGroup-sizing-default"
                                           value="${product.description}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-default">Name</span>
                                    </div>
                                    <input type="text" class="form-control" name="name" aria-label="Default"
                                           aria-describedby="inputGroup-sizing-default" value="${product.name}">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroup-sizing-default" style="width:68px;">Price</span>
                                    </div>
                                    <input type="number" class="form-control" name="price" aria-label="Default"
                                           aria-describedby="inputGroup-sizing-default" value="${product.price}">
                                </div>
                                <div style="margin-left: 5px;">
                                    <label class="relative inline-flex items-center mr-5 cursor-pointer">
                                        <c:choose>
                                            <c:when test="${product.status == '1'}">
                                                <input type="checkbox" class="toggle" name="status" checked>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="checkbox" class="toggle" name="status">
                                            </c:otherwise>
                                        </c:choose>
                                        <!-- <input type="checkbox" class="toggle" ${(product.status !="1"
                                                                                     ? "checked" : "" )}> -->
                                        <span class="text-sm font-medium" style="margin-left: 10px;">Display product</span>
                                    </label>
                                </div>
                            </div>

                            <div class="float-left">
                                <a href="home">
                                    <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3"
                                            style="background-color: #aeacab; border-color: #aeacab; color: white;">Back to home</button>
                                </a>
                            </div>

                            <div class="float-right">
                                <button type="button" name="updatecart" class="btn btn-lg btn-primary mt-2"
                                        style="background-color: #ff5b6a; border-color: #ff5b6a; margin-right: 5px;">Reload</button>
                                <button type="submit" class="btn btn-lg btn-primary mt-2"
                                        style="background-color: #ff5b6a; border-color: #ff5b6a;">Save</button>
                            </div>

                        </div>
                    </div>
                </div>
        </form>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
            integrity="sha512-fD9DI5bZwQxOi7MhYWnnNPlvXdp/2Pj3XSTRrFs5FQa4mizyGLnJcN6tuvUS6LbmgN1ut+XGSABKvjN0H6Aoow=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
    crossorigin="anonymous"></script>
</html>
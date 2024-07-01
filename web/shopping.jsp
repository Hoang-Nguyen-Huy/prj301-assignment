<%-- 
    Document   : shopping
    Created on : Jun 15, 2024, 4:21:13 PM
    Author     : Dell Latitude 7490
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Tu Tu Store</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/shopping.css" rel="stylesheet">
    </head>
    <body>
        <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>
        <div>
            <!--header of the page start here-->
            <%@include file="assets/header.jsp" %>
            <!--header of the page end here-->

            <!--carousel of the page start here-->
            <div id="carouselFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://wallpapers.com/images/hd/adidas-painted-running-shoes-4quwe21ymne5ing3.jpg" class="d-block w-100" alt="Addidas">
                    </div>
                    <div class="carousel-item">
                        <img src="https://wallpapercave.com/wp/DIqJBN7.jpg" class="d-block w-100" alt="Nike">
                    </div>
                    <div class="carousel-item">
                        <img src="https://wallpapercave.com/wp/wp2631927.jpg" class="d-block w-100" alt="Vans">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselFade" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselFade" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <!--carousel of the page end here-->

            <!--body of the page start here-->
            <div class="container">
                <div id="carouselExampleIndicators" class="carousel carousel-dark slide mx-auto" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="cards-wrapper">
                            <c:forEach var="product" varStatus="status" items="${requestScope.LIST_PRODUCT}">
                                <c:if test="${status.index < 6}">
                                    <c:if test="${status.index % 3 == 0}">
                                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                            <div class="row justify-content-center">
                                            </c:if>
                                            <div class="col-md-4 all-card">
                                                <div class="card mb-3 card-item">
                                                    <div class="images-wrapper">
                                                        <img src="${product.getPicture()}" class="card-img-top" alt="${product.getName()}">
                                                    </div>
                                                    <div class="card-body">
                                                        <h5 class="card-title">${product.getName()}</h5>
                                                        <p class="card-text">${product.getPrice()}</p>
                                                        <p class="card-text">${product.getBrand()}</p>
                                                        <form action="MainController" method="POST">
                                                            <input type="hidden" name="cmbShoes" value="${product.getId()}-${product.getName()}-${product.getPrice()}-${1}-${product.getPicture()}-${product.getBrand()}">
                                                            <button class="btn btn-primary add-to-cart" type="submit" name="action" value="Add">
                                                                Add to Cart
                                                            </button>
                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                            <c:if test="${status.index % 3 == 2 || status.index == requestScope.LIST_PRODUCT.size() - 1}">
                                            </div> <!-- close row justify-content-center -->
                                        </div> <!-- close carousel-item -->
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div> <!-- close cards-wrapper -->                        
                    </div> <!-- close carousel-inner -->
                </div> <!-- close carousel slide -->
            </div>
            <!--body of the page end here-->

            <!--footer of the page start here-->
            <%@include file="assets/footer.jsp" %>
            <!--footer of the page end here-->
        </div>

        <script src="js/bootstrap.bundle.min.js"></script>
    </body>
</html>

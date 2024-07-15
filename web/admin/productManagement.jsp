<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="model.Products" %>
<%@ page import="model.ProductsDB" %>
<%@ page import="java.util.List" %>
<%
    ArrayList<Products> products = new ArrayList<>();
    products = ProductsDB.listAll();
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Vike Online - Admin Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.21.5/dist/css/uikit.min.css" />
        <link rel="shortcut icon" href="../image/logo/logoShop.png" type="image/x-icon">
        <link rel="stylesheet" href="../bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../style/header.css">
        <link rel="stylesheet" href="../style/middle.css">
        <link rel="stylesheet" href="../style/middle-poster.css">
        <link rel="stylesheet" href="../style/list-color.css">      
        <link rel="stylesheet" href="../style/adminStyle.css">
        <link rel="stylesheet" href="../style/adminTable.css">
    </head>
    <body>
        <div class="header">
            <div class="navbar">
                <div class="container">
                    <div class="left-section">
                        <div id="userPanel" class="user-panel">
                            <a href="javascript:void(0);" id="userIcon" onclick="toggleUserInfo()">
                                <img class="icon-head" src="../icons/user.png" alt="#">
                            </a>
                            <div id="userInfo" class="user-info">
                                <table>
                                    <tr>
                                        <td>${sessionScope.user.username}</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="LogoutServlet?value=admin" class="logout-link">
                                                <img class="icon-logout" src="../icons/logout.png" alt="Logout Icon">
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>  
                    </div>
                    <div class="middle-section">
                        <nav>
                            <p>ADMIN</p>
                        </nav>
                    </div>
                    <div class="right-section">
                        <a href="adminPage.jsp">
                            <img class="icon-head" src="../icons/back.png" alt="#">
                        </a>                       
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="container mt-5">
            <form action="addProduct.jsp" method="post">
                <button type="submit" class="add-user-button">Add Product</button>
            </form>

            <table class="tableAdmin">
                <tr>
                    <th>ProductID</th>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>CategoryID</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>ImageURL</th>
                    <th>StockQuantity</th>
                    <th>ManufacturerID</th>
                    <th>Size</th>
                    <th>Gender</th>
                    <th>Funciton</th>
                </tr>

                <%
                for (Products product : products) {
                %>
                <tr>
                    <td><%= product.getProductID() %></td>
                    <td><%= product.getName() %></td>
                    <td><%= product.getBrand() %></td>
                    <td><%= product.getCategoryID() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getDescription() %></td>
                    <td><%= product.getImageURL() %></td>
                    <td><%= product.getStockQuantity() %></td>
                    <td><%= product.getManufacturerID() %></td>
                    <td><%= product.getSize() %></td>
                    <td><%= product.getGender() %></td>
                    <td>
                        <form action="managementProduct" method="post">
                            <input type="hidden" name="action" value="deleteProduct">
                            <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                            <button type="submit">Delete</button>
                        </form>
                        <form action="updateProduct.jsp" method="post">
                            <input type="hidden" name="productID" value="<%= product.getProductID() %>">
                            <!-- Other input fields for updating user information -->
                            <button type="submit">Update</button>
                        </form>

                    </td>
                </tr>
                <%}%>
            </table>
        </div>

        <script>
            // Panel user
            function toggleUserInfo() {
                var userInfo = document.getElementById("userInfo");
                if (userInfo.style.display === "none" || userInfo.style.display === "") {
                    userInfo.style.display = "block";
                } else {
                    userInfo.style.display = "none";
                }
            }

            document.addEventListener('click', function (event) {
                var userInfo = document.getElementById("userInfo");
                var userIcon = document.getElementById("userIcon");
                if (userInfo && userIcon) {
                    if (!userIcon.contains(event.target) && !userInfo.contains(event.target)) {
                        userInfo.style.display = "none";
                    }
                }
            });
        </script>
    </body>
</html>

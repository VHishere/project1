<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/styles.css" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark"
             style="background-color: #fd7c80 !important;">

            <a class="navbar-brand ps-3" href="home">Home</a>

            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"
                    href="#!"></button>

            <div class="d-none d-md-inline-block form-inline ms-auto ">
            </div>

            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <a class="dropdown-item" href="logout" style="color: white;">logout</a>
            </ul>
        </nav>
        <div id="layoutSidenav">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <div class="row">

                            <div class="row">
                                <div class="col-xl-6">
                                    <div class="card mb-4">
                                        <div class="card-header">
                                            <i class="fas fa-chart-area me-1"></i>
                                            Number of orders
                                        </div>
                                        <div class="card-body"><canvas id="myAreaChart" width="100%"
                                                                       height="40"></canvas></div>
                                    </div>
                                </div>
                                <div class="col-xl-6">
                                    <div class="card mb-4">
                                        <input type="text" id="totalRevenue" hidden value="${totalRevenue}">
                                        <div class="card-header">
                                            <i class="fas fa-chart-bar me-1"></i>
                                            Revenue
                                        </div>
                                        <div class="card-body"><canvas id="myBarChart" width="100%"
                                                                       height="40"></canvas></div>
                                    </div>
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Order list
                                </div>
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Order date</th>
                                                <th>Status</th>
                                                <th>Total price</th>
                                            </tr>
                                        </thead>
                                        <tfoot>
                                            <tr>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Address</th>
                                                <th>Order date</th>
                                                <th>Status</th>
                                                <th>Total price</th>
                                            </tr>
                                        </tfoot>
                                        <tbody>
                                            <c:forEach items="${listOrders}" var="order" varStatus="loop">
                                                <tr>
                                                    <td>${listAccounts.get(loop.index).name}</td>
                                                    <td>${listAccounts.get(loop.index).email}</td>
                                                    <td>${listAccounts.get(loop.index).address}</td>
                                                    <td>${order.orderDate}</td>
                                                    <td>${order.status == 1 ? "Completed" : order.status == 0 ?
                                                          "Processing" : "Canceled" }
                                                    </td>
                                                    <td>${order.totalPrice}.000₫</td>
                                                </tr>
                                            </c:forEach>
                                            <tr>
                                                <td>Tiger Nixon</td>
                                                <td>Nixon@gmail.com</td>
                                                <td>Ha Noi, Viet Nam</td>
                                                <td>2011/04/25</td>
                                                <td>Completed</td>
                                                <td>320.800₫</td>
                                            </tr>
                                            <tr>
                                                <td>Garrett Winters</td>
                                                <td>Winters@gmail.com</td>
                                                <td>Tokyo</td>
                                                <td>2011/07/25</td>
                                                <td>Processing</td>
                                                <td>170.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Ashton Cox</td>
                                                <td>Ashton123@yahoo.com</td>
                                                <td>San Francisco</td>
                                                <td>2009/01/12</td>
                                                <td>Cancelled</td>
                                                <td>85.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Cedric Kelly</td>
                                                <td>Senior@gmail.com</td>
                                                <td>Edinburgh</td>
                                                <td>2012/03/29</td>
                                                <td>Completed</td>
                                                <td>433.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Airi Satou</td>
                                                <td>Accountant@gmail.com</td>
                                                <td>Tokyo</td>
                                                <td>2008/11/28</td>
                                                <td>Processing</td>
                                                <td>162.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Brielle Williamson</td>
                                                <td>Integration@gmail.com</td>
                                                <td>New York</td>
                                                <td>2012/12/02</td>
                                                <td>Completed</td>
                                                <td>372.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Herrod Chandler</td>
                                                <td>Sales@gmail.com</td>
                                                <td>San Francisco</td>
                                                <td>2012/08/06</td>
                                                <td>Processing</td>
                                                <td>137.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Rhona Davidson</td>
                                                <td>Integration@gmail.com</td>
                                                <td>Tokyo</td>
                                                <td>2010/10/14</td>
                                                <td>Cancelled</td>
                                                <td>327.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Colleen Hurst</td>
                                                <td>Java.Developer@yahoo.com</td>
                                                <td>San Francisco</td>
                                                <td>2009/09/15</td>
                                                <td>Completed</td>
                                                <td>205.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Sonya Frost</td>
                                                <td>Software.Engineer@gmail.com</td>
                                                <td>Edinburgh</td>
                                                <td>2008/12/13</td>
                                                <td>Processing</td>
                                                <td>103.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Jena Gaines</td>
                                                <td>Office.Manager@gmail.com</td>
                                                <td>London</td>
                                                <td>2008/12/19</td>
                                                <td>Cancelled</td>
                                                <td>90.5000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Quinn Flynn</td>
                                                <td>Support@gmail.com</td>
                                                <td>Edinburgh</td>
                                                <td>2013/03/03</td>
                                                <td>Completed</td>
                                                <td>342.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Charde Marshall</td>
                                                <td>Regional@gmail.com</td>
                                                <td>San Francisco</td>
                                                <td>2008/10/16</td>
                                                <td>Processing</td>
                                                <td>470.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Haley Kennedy</td>
                                                <td>Kennedy@yahoo.com</td>
                                                <td>London</td>
                                                <td>2012/12/18</td>
                                                <td>Completed</td>
                                                <td>313.000₫</td>
                                            </tr>
                                            <tr>
                                                <td>Tatyana Fitzpatrick</td>
                                                <td>Regional.Director@gmail.com</td>
                                                <td>London</td>
                                                <td>2010/03/17</td>
                                                <td>Cancelled</td>
                                                <td>385.000₫</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script>
            window.addEventListener('DOMContentLoaded', event => {

                const sidebarToggle = document.body.querySelector('#sidebarToggle');
                if (sidebarToggle) {
                    sidebarToggle.addEventListener('click', event => {
                        event.preventDefault();
                        document.body.classList.toggle('sb-sidenav-toggled');
                        localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
                    });
                }
                sidebarToggle.click();
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
        crossorigin="anonymous"></script>
        <script src="assets/demo/chart-area-demo.js"></script>
        <script src="assets/demo/chart-bar-demo.js"></script>
        <script src="js/simple-datatables.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.2.0/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>
</html>
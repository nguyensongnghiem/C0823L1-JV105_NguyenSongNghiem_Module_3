<%--
  Created by IntelliJ IDEA.
  User: nghie
  Date: 14/03/2024
  Time: 12:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>RouterManager</title>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <link rel="stylesheet" href="styles.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
</head>
<body>
<header class="header grid-container">
    <h5 class="brand-name">
        <img src="logo.png" alt="MobiFone"/>
    </h5>
    <nav class="nav">
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">account</a></li>
        </ul>
    </nav>
</header>
<main class="grid-container">
    <nav class="nav-side">
        <ul>
            <li><a href="#">Quản lý thiết bị Metro</a></li>
            <li><a href="#">Quản lý cơ sở hạ tầng</a></li>
            <li><a href="#">Quản lý cáp quang</a></li>
            <li><a href="#">Quản lý kênh thuê</a></li>
        </ul>
    </nav>
    <div class="center-main">
        <div class="about grid-container">
            <img src="https://i1-kinhdoanh.vnecdn.net/2023/01/06/Bai-9-Anh-minh-hoa-JPG-6898-1673017837.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=6F6bqbdq7QT0WMMZZypUCw"
                 alt="">
            <div class="welcome ">
                <h2>Chào mừng đến với MobiFone </h2>
                <p>
                    MobiFone là một trong số các doanh nghiệp Viễn thông – Công nghệ thông tin – Nội dung số lớn
                    nhất, là nhà cung cấp mạng thông tin di động đầu tiên, với hơn 30% thị phần. MobiFone là thương hiệu
                    được
                    khách hàng yêu thích lựa chọn, nhận được nhiều giải thưởng, xếp hạng danh giá trong nước và quốc tế.
                    MobiFone đang chuyển đổi hướng đến phát triển thành tập đoàn công nghệ hàng đầu Việt Nam.
                </p>
            </div>

        </div>

        <h2 class="info">Tổng quan hệ thống </h2>
        <div class="purpose grid-container">
            <div class="card grid-container">
                <h4>Tỷ lệ thiết bị theo tỉnh</h4>
                <div id="total-chart" class="chart">
                    Biểu đồ phân bổ thiết bị theo tỉnh
                </div>
            </div>

            <div class="card grid-container">
                <h4>Tỷ lệ loại TD</h4>
                <div id="router-chart" class="chart">
                    Biểu đồ phân bổ thiết bị theo tỉnh
                </div>
            </div>
            <div class="card grid-container">
                <h4>Tỷ lệ tram / router</h4>
                <div id="device-chart" class="chart">
                    Biểu đồ phân bổ thiết bị theo tỉnh
                </div>
            </div>
        </div>
    </div>

</main>
<footer class="footer grid-container">
    <p class="copyright">Copyright @nghiem.nguyen</p>
</footer>
</body>
<script>
    google.charts.load('current',{packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        ;
        // Set Data
        const data = google.visualization.arrayToDataTable([
            ['Contry', 'Mhl'],
            ['Italy', 55],
            ['France', 49],
            ['Spain', 44],
            ['USA', 24],
            ['Argentina', 15]
        ]);

// Set Options
        const options = {
            title: 'World Wide Wine Production',
            'width':"100%",
            'height':100
        };

// Draw
        const chart = new google.visualization.PieChart(document.getElementById('total-chart'));
        chart.draw(data, options);
    }
</script>
</html>

<%--
  Created by IntelliJ IDEA.
  User: nghie
  Date: 20/03/2024
  Time: 7:04 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<html>
<head>
    <title>Add product</title>
    <form action="/add" method="post">
        <div class="form-group">
            <label for="name" class="form-label">Tên sản phầm</label>
            <input type="text" id="name" class="form-control">
        </div>
        <label for="price" class="form-label">Giá</label>
        <input type="text" id="price" class="form-control">
        <br>
        <label for="price" class="form-label">Mô tả</label>
        <input type="text" id="description" class="form-control">
        <br>
        <label for="price" class="form-label">Hãng sản xuất</label>
        <input type="text" id="manufactor" class="form-control">
        <a href="/hello-servlet" class="btn btn-success">Thêm mới </a>

    </form>
</head>
<body>

</body>
</html>

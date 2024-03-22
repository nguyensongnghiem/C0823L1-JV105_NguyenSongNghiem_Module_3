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
    <link rel="stylesheet" href="/css/styles.css">
</head>
<html>


<body>
<div class="ml-5">
    <h1>Add product</h1>
    <form action="/product?action=add" method="post" class="w-50">
        <div class="input-group">
            <label for="id" class="form-label">Id</label>
            <input type="text" id="id" name="id" class="form-control">
        </div>
        <div class="input-group">
            <label for="name" class="form-label">Tên sản phầm</label>
            <input type="text" id="name" name="name" class="form-control">
        </div>

        <div class="input-group">
            <label for="price" class="form-label">Giá</label>
            <input type="text" id="price" name="price" class="form-control">
        </div>
        <div class="input-group">
            <label for="desc" class="form-label">Mô tả</label>
            <input type="text" id="desc" name="desc" class="form-control">
        </div>
        <div class="input-group">
            <label for="manufactor" class="form-label">Hãng sản xuất</label>
            <input type="text" id="manufactor" name="manufactor" class="form-control">
        </div>
        <button class="btn btn-success" type="submit">Thêm mới</button>
    </form>
</div>
</body>
</html>

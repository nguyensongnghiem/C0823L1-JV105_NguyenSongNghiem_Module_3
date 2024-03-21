package controller;


import model.Product;
import service.IProductService;
import service.ProductService;

import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ProductServlet",value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action==null) action ="";
        switch (action) {
            case "add":
                add(req,resp);
                break;
            case "delete":
                break;
            case "update":
                break;
            case "list" :
                showList(req,resp);
                break;
            default:
                showList(req,resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);

    }
    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> products = productService.findAll();
        req.setAttribute("products", products);
        RequestDispatcher rd =req.getRequestDispatcher("/view/list.jsp");
        rd.forward(req,resp);
    }
    private boolean add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id  = Integer.parseInt(req.getParameter("id"));
        String name  = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String desc  = req.getParameter("desc");
        String manufactor  = req.getParameter("manufactor");
        resp.sendRedirect("/product?action=list");
        return  productService.add(new Product(id,name,price, desc,manufactor));

    }
}

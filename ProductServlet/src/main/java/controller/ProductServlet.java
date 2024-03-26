package controller;


import dto.ProductDto;
import model.Manufactor;
import model.Product;
import service.IManufactorService;
import service.IProductService;
import service.ManufactorService;
import service.ProductService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    private IManufactorService manufactorService = new ManufactorService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "add":
                showAddForm(req, resp);
                break;
            case "delete":
                deleteById(req, resp);
                break;
            case "edit":
                showEditForm(req,resp);
                break;
            case "search":
                search(req,resp);
                break;
            case "list":
                showList(req, resp);
                break;
            default:
                showList(req, resp);
        }
    }

    private void search(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int editId = Integer.parseInt(req.getParameter("editId"));
        Product product = productService.findById(editId);
        req.setAttribute("product", product);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("/view/edit.jsp");
        requestDispatcher.forward(req,resp);
    }
    private void showAddForm(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.sendRedirect("/view/add.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "add":
                add(req, resp);
                break;
            case "delete":
                deleteById(req, resp);
                break;
            case "edit":
                update(req, resp);
                break;
            case "search":
                search(req,resp);
                break;
            case "list":
                showList(req, resp);
                break;
            default:
                showList(req, resp);
        }
    }

    private boolean update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String desc = req.getParameter("desc");
        String manufactorName = req.getParameter("manufactor");
        if (manufactorService.findByName(manufactorName)== null) {
            Manufactor manufactor = new Manufactor();
            manufactor.setId(null);
            manufactorService.save(manufactorName);
        }
        else


        resp.sendRedirect("/product?action=list");
        return productService.update(new Product(id, name, price, desc, manufactor));
    }

    private void showList(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ProductDto> products = productService.findAllDto();
        req.setAttribute("products", products);
        RequestDispatcher rd = req.getRequestDispatcher("/view/list.jsp");
        rd.forward(req, resp);
    }

    private void add(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String desc = req.getParameter("desc");
        int manufactor = Integer.parseInt(req.getParameter("manufactor"));
        boolean isOk = productService.add(new Product(id, name, price, desc, manufactor));
        String message = isOk?"OK":"NOK";
        resp.sendRedirect("/product?action=list&addMess="+message);
    }
    private boolean deleteById(HttpServletRequest req, HttpServletResponse resp) throws IOException {
//        System.out.println(req.getParameter("deleteId"));
        int deleteId = Integer.parseInt(req.getParameter("deleteId"));
        resp.sendRedirect("/product?action=list");
        return productService.deleteById(deleteId);
    }
}

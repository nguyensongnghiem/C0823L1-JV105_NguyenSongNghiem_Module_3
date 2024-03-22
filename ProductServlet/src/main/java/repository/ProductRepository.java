package repository;

import model.Product;

import java.math.BigDecimal;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private final static String GET_ALL = "SELECT * FROM product";
    private final static String GET_BY_ID = "SELECT * FROM product WHERE id = '?'";
    private final static String SAVE = "INSERT INTO product(id,name,price,description,manufactor) VALUE (?,?,?,?,?)";


    private static List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1,"Macbook", 1000f, "Laptop ", "Apple"));
        products.add(new Product(2,"Iphone", 900f, "Điện thoại", "Apple"));
        products.add(new Product(3,"Samsum S24", 800f, "Điện thoại", "Samsung"));
        products.add(new Product(4,"Xiaomi S20", 300f, "Điện thoại", "Xiaomi"));
    }
    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection conn = ConnectDB.getConnectDB();

        try {
            PreparedStatement preparedStatement =  conn.prepareStatement(GET_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                float price = resultSet.getFloat("price");
                String desc = resultSet.getString("description");
                String manufactor = resultSet.getString("manufactor");
                productList.add(new Product(id,name,price,desc,manufactor));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return productList;
    }

    @Override
    public Product findById(int id) {
        Product foundProduct = null;
        for (Product product : products) {
            if (product.getId() == id) foundProduct = product;
        }
        return foundProduct;
    }
    @Override
    public Product findByName(String name) {
        Product foundProduct = null;
        for (Product product : products) {
            if (product.getName().equals(name)) foundProduct = product;
        }
        return foundProduct;
    }

    @Override
    public boolean add(Product newProduct) {
        return products.add(newProduct);
    }
    @Override
    public boolean deleteById(int id) {
        boolean result = false;
        if (findById(id) != null) {
            products.remove(findById(id));
            result = true;
        }
        return result;
    }

    @Override
    public boolean update(Product product) {
        return false;
    }
}

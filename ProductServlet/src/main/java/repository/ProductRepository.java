package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> products = new ArrayList<>();
    static {
        products.add(new Product(1,"Macbook", 1000f, "Laptop ", "Apple"));
        products.add(new Product(2,"Iphone", 900f, "Điện thoại", "Apple"));
        products.add(new Product(3,"Samsum S24", 800f, "Điện thoại", "Samsung"));
        products.add(new Product(4,"Xiaomi S20", 300f, "Điện thoại", "Xiaomi"));
    }
    @Override
    public List<Product> findAll() {
        return products;
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
        return false;
    }

    @Override
    public boolean update(Product product) {
        return false;
    }
}

package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    public List<Product> findAll();

    public Product findById(int id);

    public Product findByName(String name);

    public boolean add(Product newProduct);

    public boolean deleteById(int id);

    public boolean update(Product product);


}

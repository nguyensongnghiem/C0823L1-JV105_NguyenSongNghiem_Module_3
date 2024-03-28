package service;

import dto.ProductDto;
import model.Product;

import java.util.List;

public interface IProductService {
    public List<Product> findAll();
    public List<ProductDto> findAllDto();
    public List<ProductDto> search(String name, String manufactor);

    public Product findById(int id);

    public Product findByName(String name);

    public boolean add(Product newProduct);

    public boolean deleteById(int id);

    public boolean update(Product product);

}

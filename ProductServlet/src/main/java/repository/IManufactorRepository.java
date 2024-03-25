package repository;

import model.Manufactor;

import java.util.ArrayList;
import java.util.List;

public interface IManufactorRepository {
    List<Manufactor> findAll();

}

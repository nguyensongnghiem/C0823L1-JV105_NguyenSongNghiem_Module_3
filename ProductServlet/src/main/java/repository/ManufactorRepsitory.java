package repository;

import model.Manufactor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ManufactorRepsitory implements IManufactorRepository {
    private final static String GET_ALL = "SELECT * FROM manufactor";

    @Override
    public List<Manufactor> findAll() {
        List<Manufactor> manufactorsList = new ArrayList<>();
        Connection conn = null;
        try {
            conn = ConnectDB.getConnectDB();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(GET_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                manufactorsList.add(new Manufactor(id, name));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return manufactorsList;
    }
}


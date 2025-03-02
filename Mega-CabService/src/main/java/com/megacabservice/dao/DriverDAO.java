package com.megacabservice.dao;

import com.megacabservice.entity.Driver;
import java.util.List;

public interface DriverDAO {
    boolean addDriver(Driver driver);
    Driver login(String email, String password);
    List<Driver> getAllDrivers();
    boolean updateDriver(Driver driver);
    boolean deleteDriver(int driverId);
    Driver getDriverById(int driverId); 

    

    
}
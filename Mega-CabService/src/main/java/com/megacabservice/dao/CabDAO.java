package com.megacabservice.dao;

import com.megacabservice.entity.Cab;
import java.util.List;

public interface CabDAO {
    boolean addCab(Cab cab);
    List<Cab> getAllCabs();
    Cab getCabById(int id);
    boolean updateCab(Cab cab);
    boolean deleteCab(int id);
}
package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class HotelAction extends ActionSupport {

    private List<Hotel> hotels;

    @Override
    public String execute() {
        try {
            hotels = HotelService.getHotels();
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public List<Hotel> getHotels() { return hotels; }
}

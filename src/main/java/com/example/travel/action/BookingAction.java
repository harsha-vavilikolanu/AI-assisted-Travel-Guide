package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;
import com.example.travel.model.Booking;
import com.example.travel.dao.GenericDAO;

import java.time.LocalDateTime;

public class BookingAction extends ActionSupport {
    private int hostelId;
    private int restaurantId;
    private int transportId;

    // setters for params (Struts will populate)
    public void setHostelId(int hostelId) { this.hostelId = hostelId; }
    public void setRestaurantId(int restaurantId) { this.restaurantId = restaurantId; }
    public void setTransportId(int transportId) { this.transportId = transportId; }

    public String bookHostel() {
        try {
            Booking b = new Booking();
            b.setType("HOSTEL");
            b.setResourceId(hostelId);
            b.setStatus("BOOKED");
            b.setCreatedAt(LocalDateTime.now());
            GenericDAO.save(b);
            addActionMessage("Hostel booked (id=" + hostelId + ")");
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Failed to book hostel: " + e.getMessage());
            return ERROR;
        }
    }

    public String bookRestaurant() {
        try {
            Booking b = new Booking();
            b.setType("RESTAURANT");
            b.setResourceId(restaurantId);
            b.setStatus("BOOKED");
            b.setCreatedAt(LocalDateTime.now());
            GenericDAO.save(b);
            addActionMessage("Restaurant booked (id=" + restaurantId + ")");
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Failed to book restaurant: " + e.getMessage());
            return ERROR;
        }
    }

    // (optional) booking for transport
    public String bookTransport() {
        try {
            Booking b = new Booking();
            b.setType("TRANSPORT");
            b.setResourceId(transportId);
            b.setStatus("BOOKED");
            b.setCreatedAt(LocalDateTime.now());
            GenericDAO.save(b);
            addActionMessage("Transport booked (id=" + transportId + ")");
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Failed to book transport: " + e.getMessage());
            return ERROR;
        }
    }
}

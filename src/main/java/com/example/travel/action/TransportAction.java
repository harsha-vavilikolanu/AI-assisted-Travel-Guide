package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;
import com.example.travel.model.Transport;
import com.example.travel.dao.GenericDAO;

import java.time.LocalDateTime;

public class TransportAction extends ActionSupport {
    private String mode;
    private String fromPlace;
    private String toPlace;
    private String depart; // expected yyyy-MM-ddTHH:mm or parse manually
    private String arrive;
    private double price;

    // setters...
    public void setMode(String mode) { this.mode = mode; }
    public void setFromPlace(String fromPlace) { this.fromPlace = fromPlace; }
    public void setToPlace(String toPlace) { this.toPlace = toPlace; }
    public void setDepart(String depart) { this.depart = depart; }
    public void setArrive(String arrive) { this.arrive = arrive; }
    public void setPrice(double price) { this.price = price; }

    public String plan() {
        try {
            // For demo, save a Transport entry
            Transport t = new Transport();
            t.setMode(mode);
            t.setFromPlace(fromPlace);
            t.setToPlace(toPlace);
            if (depart != null && !depart.isEmpty()) {
                t.setDepartAt(LocalDateTime.parse(depart));
            } else {
                t.setDepartAt(LocalDateTime.now());
            }
            if (arrive != null && !arrive.isEmpty()) {
                t.setArriveAt(LocalDateTime.parse(arrive));
            } else {
                t.setArriveAt(t.getDepartAt().plusHours(2));
            }
            t.setPrice(price);
            GenericDAO.save(t);
            addActionMessage("Transport plan saved");
            return SUCCESS;
        } catch (Exception e) {
            addActionError("Failed to plan transport: " + e.getMessage());
            return ERROR;
        }
    }
}

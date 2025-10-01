package com.example.travel.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name="transports")
public class Transport {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;
    private String mode; // BUS, TRAIN, FLIGHT, TAXI
    private String fromPlace;
    private String toPlace;
    private LocalDateTime departAt;
    private LocalDateTime arriveAt;
    private double price;

    public Transport() {}

    // getters / setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getMode() { return mode; }
    public void setMode(String mode) { this.mode = mode; }

    public String getFromPlace() { return fromPlace; }
    public void setFromPlace(String fromPlace) { this.fromPlace = fromPlace; }

    public String getToPlace() { return toPlace; }
    public void setToPlace(String toPlace) { this.toPlace = toPlace; }

    public LocalDateTime getDepartAt() { return departAt; }
    public void setDepartAt(LocalDateTime departAt) { this.departAt = departAt; }

    public LocalDateTime getArriveAt() { return arriveAt; }
    public void setArriveAt(LocalDateTime arriveAt) { this.arriveAt = arriveAt; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}

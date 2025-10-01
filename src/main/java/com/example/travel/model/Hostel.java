package com.example.travel.model;

import javax.persistence.*;

@Entity
@Table(name="hostels")
public class Hostel {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private int id;

    private String name;
    private String city;
    private String address;
    private double pricePerNight;

    // Constructors
    public Hostel() {}
    public Hostel(String name, String city, String address, double p) {
        this.name = name; this.city = city; this.address = address; this.pricePerNight = p;
    }

    // Getters/Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public double getPricePerNight() { return pricePerNight; }
    public void setPricePerNight(double pricePerNight) { this.pricePerNight = pricePerNight; }
}

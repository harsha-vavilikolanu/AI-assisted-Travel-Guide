package com.example.travel.action;

public class Hotel {
    private String name;
    private String address;
    private String price;
    private double rating;
    private String url;
    private String imageUrl;

    public Hotel(String name, String address, String price, double rating, String url, String imageUrl) {
        this.name = name;
        this.address = address;
        this.price = price;
        this.rating = rating;
        this.url = url;
        this.imageUrl = imageUrl;
    }

    // Getters & Setters
    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getPrice() { return price; }
    public double getRating() { return rating; }
    public String getUrl() { return url; }
    public String getImageUrl() { return imageUrl; }
}

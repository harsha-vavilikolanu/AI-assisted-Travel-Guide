package com.example.travel.action;

import com.example.travel.model.Hotel;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class HotelAction extends ActionSupport {

    private String country;
    private List<Hotel> hotels;

    @Override
    public String execute() {
        SessionFactory factory = null;
        Session session = null;

        try {
            // Load Hibernate configuration (hibernate.cfg.xml must exist)
            factory = new Configuration().configure("hibernate.cfg.xml")
                    .addAnnotatedClass(Hotel.class)
                    .buildSessionFactory();

            session = factory.openSession();
            session.beginTransaction();

            // Query hotels by country
            String hql = "FROM Hotel WHERE country = :countryName";
            Query<Hotel> query = session.createQuery(hql, Hotel.class);
            query.setParameter("countryName", country);

            hotels = query.list();

            session.getTransaction().commit();
            return SUCCESS;

        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        } finally {
            if (session != null) session.close();
            if (factory != null) factory.close();
        }
    }

    // Getters and Setters
    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public List<Hotel> getHotels() { return hotels; }
    public void setHotels(List<Hotel> hotels) { this.hotels = hotels; }
}

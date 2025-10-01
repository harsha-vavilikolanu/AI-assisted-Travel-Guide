package com.example.travel.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class GenericDAO {
    public static <T> T save(T entity) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            s.saveOrUpdate(entity);
            tx.commit();
            return entity;
        } catch (RuntimeException e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            s.close();
        }
    }

    public static <T> void delete(T entity) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = null;
        try {
            tx = s.beginTransaction();
            s.delete(entity);
            tx.commit();
        } catch (RuntimeException e) {
            if (tx != null) tx.rollback();
            throw e;
        } finally {
            s.close();
        }
    }
}

package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;
import com.example.travel.model.Expense;
import com.example.travel.dao.GenericDAO;

import java.time.LocalDate;

public class ExpenseAction extends ActionSupport {
    private String category;
    private double amount;
    private String note;
    private String date; // form sends yyyy-MM-dd

    public void setCategory(String category) { this.category = category; }
    public void setAmount(double amount) { this.amount = amount; }
    public void setNote(String note) { this.note = note; }
    public void setDate(String date) { this.date = date; }

    public String addExpense() {
        try {
            Expense e = new Expense();
            e.setCategory(category);
            e.setAmount(amount);
            e.setNote(note);
            if (date != null && !date.isEmpty()) {
                e.setDate(LocalDate.parse(date));
            } else {
                e.setDate(LocalDate.now());
            }
            GenericDAO.save(e);
            addActionMessage("Expense recorded");
            return SUCCESS;
        } catch (Exception ex) {
            addActionError("Failed to save expense: " + ex.getMessage());
            return ERROR;
        }
    }
}

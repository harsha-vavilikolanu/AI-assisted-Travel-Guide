package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;

public class BudgetPlanAction extends ActionSupport {

    private double budget;
    private String country;
    private String travelPlan;
    // Define a minimum budget threshold for a simple check (e.g., $500)
    private static final double MIN_BUDGET_THRESHOLD = 500.0; 

    // Setters for Struts to populate
    public void setBudget(double budget) { this.budget = budget; }
    public void setCountry(String country) { this.country = country; }

    // Getter for the result JSP
    public String getTravelPlan() { return travelPlan; }

    public String planBudget() {
        if (budget < MIN_BUDGET_THRESHOLD) {
            // Fulfills the requirement: "if budget is too low he should get response cant travel with this budget"
            travelPlan = "Error: Cannot travel to " + country + " with a budget of $" + budget + ". Your budget is too low for a realistic travel plan.";
            return SUCCESS; // Return to the JSP to display the error message
        }

        try {
            // Prompt the existing AI service to generate a plan based on the budget
            String prompt = "Act as a professional budget travel agent. Create a concise, budget-friendly travel plan for a trip to " + country + " with a total budget of " + budget + " USD. The plan should cover suggested duration, budget-friendly accommodation (e.g., hostels), main activities, and transport options. Start directly with the plan.";
            
            // Reusing the existing AI service logic from ChatbotService.java
            travelPlan = ChatbotService.getResponse(prompt);
            return SUCCESS;
        } catch (Exception e) {
            travelPlan = "Failed to generate travel plan: " + e.getMessage();
            e.printStackTrace();
            return ERROR;
        }
    }
}
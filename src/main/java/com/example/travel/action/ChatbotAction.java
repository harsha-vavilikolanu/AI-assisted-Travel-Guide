package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;

public class ChatbotAction extends ActionSupport {

    private String userMessage;
    private String botResponse;

    public String execute() {
        try {
            botResponse = ChatbotService.getResponse(userMessage);
        } catch (Exception e) {
            botResponse = "Oops! Something went wrong.";
            e.printStackTrace(); // shows full error in console
        }
        return SUCCESS;
    }

    // Getters & Setters
    public String getUserMessage() { return userMessage; }
    public void setUserMessage(String userMessage) { this.userMessage = userMessage; }
    public String getBotResponse() { return botResponse; }
}

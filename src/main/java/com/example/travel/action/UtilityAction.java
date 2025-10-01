package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;

public class UtilityAction extends ActionSupport {
    private String text;
    private String targetLang;
    private String reply; // for chatbot

    public void setText(String text) { this.text = text; }
    public void setTargetLang(String targetLang) { this.targetLang = targetLang; }
    public String getReply() { return reply; }

    // Mock translate
    public String translate() {
        if (text == null) { addActionError("No text"); return ERROR; }
        // Very simple mock: reverse text + targetLang
        this.reply = "[translated to " + (targetLang == null ? "en" : targetLang) + "] " + new StringBuilder(text).reverse().toString();
        return SUCCESS;
    }

    // Mock chat (echo + canned)
    public String chat() {
        if (text == null) { addActionError("No text"); return ERROR; }
        this.reply = "Bot: I heard '" + text + "'. (This is a mock reply.)";
        return SUCCESS;
    }
}

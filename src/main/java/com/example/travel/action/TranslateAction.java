package com.example.travel.action;

import com.opensymphony.xwork2.ActionSupport;

public class TranslateAction extends ActionSupport {

    private String inputText;
    private String targetLang;
    private String translatedText;

    public String execute() {
        try {
            translatedText = TranslateService.translate(inputText, targetLang);
        } catch (Exception e) {
            translatedText = "Translation failed. Please try again.";
            e.printStackTrace();
        }
        return SUCCESS;
    }

    // Getters & Setters
    public String getInputText() { return inputText; }
    public void setInputText(String inputText) { this.inputText = inputText; }

    public String getTargetLang() { return targetLang; }
    public void setTargetLang(String targetLang) { this.targetLang = targetLang; }

    public String getTranslatedText() { return translatedText; }
}

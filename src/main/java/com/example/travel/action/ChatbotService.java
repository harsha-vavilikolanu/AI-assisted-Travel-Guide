package com.example.travel.action;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.HttpResponse;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

class ChatbotService {

    // 🔑 API key embedded in URL (no Bearer header needed)
    private static final String API_URL =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=AIzaSyAo4_WwhvbfPGv2_IYw_VqBOEOUFjaT-gU";

    public static String getResponse(String userMessage) throws Exception {
        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpPost post = new HttpPost(API_URL);

            // Headers
            post.setHeader("Content-Type", "application/json");

            // JSON payload as per Gemini docs
            JSONObject textPart = new JSONObject();
            textPart.put("text", userMessage);

            JSONArray parts = new JSONArray();
            parts.put(textPart);

            JSONObject contents = new JSONObject();
            contents.put("parts", parts);

            JSONArray contentsArray = new JSONArray();
            contentsArray.put(contents);

            JSONObject requestBody = new JSONObject();
            requestBody.put("contents", contentsArray);

            post.setEntity(new StringEntity(requestBody.toString(), StandardCharsets.UTF_8));

            HttpResponse response = client.execute(post);

            // Read response
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(response.getEntity().getContent(), StandardCharsets.UTF_8)
            );

            StringBuilder result = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }

            // Print raw JSON for debugging
            System.out.println("Gemini API Raw Response: " + result);

            // Parse response
            JSONObject jsonResponse = new JSONObject(result.toString());
            JSONArray candidates = jsonResponse.getJSONArray("candidates");
            JSONObject firstCandidate = candidates.getJSONObject(0);
            JSONArray partsResponse = firstCandidate.getJSONObject("content").getJSONArray("parts");
            return partsResponse.getJSONObject(0).getString("text");
        }
    }
}

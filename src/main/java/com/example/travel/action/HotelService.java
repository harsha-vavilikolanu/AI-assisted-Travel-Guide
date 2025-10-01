package com.example.travel.action;

import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class HotelService {

    private static final String API_KEY = "sk_live_74b34eb04224e23cd3377ad5058eb266e89c71eb38681b3a28ef36c2020695b0";
    private static final String API_URL = "https://api.stayapi.com/v1/tripadvisor/search?geo_id=293916&limit=10";

    public static List<Hotel> getHotels() throws Exception {
        List<Hotel> hotels = new ArrayList<>();

        try (CloseableHttpClient client = HttpClients.createDefault()) {
            HttpGet request = new HttpGet(API_URL);
            request.setHeader("x-api-key", API_KEY);
            request.setHeader("Content-Type", "application/json");

            HttpResponse response = client.execute(request);

            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(response.getEntity().getContent())
            );

            StringBuilder result = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                result.append(line);
            }

            JSONObject json = new JSONObject(result.toString());
            if (json.getBoolean("success")) {
                JSONObject data = json.getJSONObject("data");
                JSONArray hotelArray = data.getJSONArray("hotels");

                for (int i = 0; i < hotelArray.length(); i++) {
                    JSONObject obj = hotelArray.getJSONObject(i);
                    String name = obj.optString("name", "Unknown");
                    String address = obj.optString("distance", "Not provided") + " from center";
                    String price = obj.optString("price_per_night", "N/A");
                    double rating = obj.optDouble("rating", 0.0);
                    String url = obj.optString("url", "");
                    String imageUrl = obj.optString("main_photo", "");

                    hotels.add(new Hotel(name, address, price, rating, url, imageUrl));
                }
            }
        }

        return hotels;
    }
}

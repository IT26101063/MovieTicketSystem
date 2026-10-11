package com.movie;

public class Showtime {
    // Encapsulation: private fields
    private String theater;
    private String time;
    private int showId;

    // Constructor
    public Showtime(String theater, String time, int showId) {
        this.theater = theater;
        this.time = time;
        this.showId = showId;
    }

    // Getters (Encapsulation)
    public String getTheater() {
        return theater;
    }

    public String getTime() {
        return time;
    }

    public int getShowId() {
        return showId;
    }

    // Setters (Encapsulation)
    public void setTheater(String theater) {
        this.theater = theater;
    }

    public void setTime(String time) {
        this.time = time;
    }


    public String toFileString() {
        return showId + "," + theater + "," + time;
    }


    public static Showtime fromFileString(String line) {
        String[] parts = line.split(",");
        if (parts.length == 3) {
            return new Showtime(parts[1], parts[2], Integer.parseInt(parts[0]));
        }
        return null;
    }
}
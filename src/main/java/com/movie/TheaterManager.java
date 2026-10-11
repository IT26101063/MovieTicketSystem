package com.movie;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class TheaterManager {


    private static final String FILE_NAME = "shows.txt";

    // ==================== CREATE ====================

    public void addShow(Showtime showtime) {
        try (BufferedWriter bw = new BufferedWriter(
                new FileWriter(FILE_NAME, true))) {
            bw.write(showtime.toFileString());
            bw.newLine();
            System.out.println("Show added: " + showtime.getTheater());
        } catch (IOException e) {
            System.out.println("Error adding show: " + e.getMessage());
        }
    }

    // ==================== READ ====================

    public List<Showtime> getAllShows() {
        List<Showtime> shows = new ArrayList<>();
        File file = new File(FILE_NAME);

        if (!file.exists()) {
            return shows;
        }

        try (BufferedReader br = new BufferedReader(new FileReader(FILE_NAME))) {
            String line;
            while ((line = br.readLine()) != null) {
                Showtime s = Showtime.fromFileString(line);
                if (s != null) {
                    shows.add(s);
                }
            }
        } catch (IOException e) {
            System.out.println("Error reading shows: " + e.getMessage());
        }

        return shows;
    }

    // ==================== UPDATE ====================

    public boolean updateShow(int showId, String newTheater, String newTime) {
        List<Showtime> shows = getAllShows();
        boolean found = false;


        for (Showtime s : shows) {
            if (s.getShowId() == showId) {
                s.setTheater(newTheater);
                s.setTime(newTime);
                found = true;
                break;
            }
        }

        if (found) {

            writeAllToFile(shows);
            return true;
        }
        return false;
    }

    // ==================== DELETE ====================

    public boolean deleteShow(int showId) {
        List<Showtime> shows = getAllShows();
        boolean removed = shows.removeIf(s -> s.getShowId() == showId);

        if (removed) {
            writeAllToFile(shows);
            return true;
        }
        return false;
    }

    // ==================== HELPER ====================

    private void writeAllToFile(List<Showtime> shows) {
        try (BufferedWriter bw = new BufferedWriter(
                new FileWriter(FILE_NAME, false))) {  // false = overwrite
            for (Showtime s : shows) {
                bw.write(s.toFileString());
                bw.newLine();
            }
        } catch (IOException e) {
            System.out.println("Error writing file: " + e.getMessage());
        }
    }


    public Showtime getShowById(int showId) {
        for (Showtime s : getAllShows()) {
            if (s.getShowId() == showId) {
                return s;
            }
        }
        return null;
    }
}
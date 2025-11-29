package com.pack.tmf.dto;
public class Show { private int showId; private Movie movie; private Theatre theatre; private String showTime;
 public int getShowId(){return showId;} public void setShowId(int id){showId=id;}
 public Movie getMovie(){return movie;} public void setMovie(Movie m){movie=m;}
 public Theatre getTheatre(){return theatre;} public void setTheatre(Theatre t){theatre=t;}
 public String getShowTime(){return showTime;} public void setShowTime(String s){showTime=s;}
}

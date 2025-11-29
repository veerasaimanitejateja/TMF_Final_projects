package com.pack.tmf.dto;
public class Booking { private int bookingId; private int showId; private String userEmail; private String seatNumbers;
 private String movieName; private String theatreName; private String showTime; private String bookingTime;
 public int getBookingId(){return bookingId;} public void setBookingId(int id){bookingId=id;}
 public int getShowId(){return showId;} public void setShowId(int id){showId=id;}
 public String getUserEmail(){return userEmail;} public void setUserEmail(String e){userEmail=e;}
 public String getSeatNumbers(){return seatNumbers;} public void setSeatNumbers(String s){seatNumbers=s;}
 public String getMovieName(){return movieName;} public void setMovieName(String s){movieName=s;}
 public String getTheatreName(){return theatreName;} public void setTheatreName(String s){theatreName=s;}
 public String getShowTime(){return showTime;} public void setShowTime(String s){showTime=s;}
 public String getBookingTime(){return bookingTime;} public void setBookingTime(String s){bookingTime=s;}
}
